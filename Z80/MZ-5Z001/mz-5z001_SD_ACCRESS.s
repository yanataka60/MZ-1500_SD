ELMD		EQU		1000H
IBUFE		EQU		10F0H
FNAME		EQU		10F1H
FSIZE		EQU		1102H
SADRS		EQU		1104H
LBUF		EQU		11A4H
LNAME		EQU		1001H
TEXTST		EQU		1070H
TEXTED		EQU		1072H
VARST		EQU		1074H
STRST		EQU		1076H
VARED		EQU		1078H
TMPEND		EQU		107AH

;0A0H PORTA ���M�f�[�^(����4�r�b�g)
;0A1H PORTB ��M�f�[�^(8�r�b�g)
;
;0A2H PORTC Bit
;7 IN  CHK
;6 IN
;5 IN
;4 IN 
;3 OUT
;2 OUT FLG
;1 OUT
;0 OUT
;
;0A3H �R���g���[�����W�X�^


		ORG		2000H

		JP		START
;******************** MONITOR CMT���[�`����� *************************************
ENT1:	JP		MSHED
ENT2:	JP		MSDAT
ENT3:	JP		MLHED
ENT4:	JP		MLDAT
ENT5:	JP		MVRFY
		
START:	CALL	INIT
		RET
		
;**** 8255������ ****
;PORTC����BIT��OUTPUT�A���BIT��INPUT�APORTB��INPUT�APORTA��OUTPUT
INIT:	LD		A,8AH
		OUT		(0A3H),A
;�o��BIT�����Z�b�g
INIT2:	LD		A,00H      ;PORTA <- 0
		OUT		(0A0H),A
		OUT		(0A2H),A   ;PORTC <- 0
		RET

;**** 1BYTE��M ****
;��MDATA��A���W�X�^�ɃZ�b�g���ă��^�[��
RCVBYTE:
		CALL	F1CHK      ;PORTC BIT7��1�ɂȂ�܂�LOOP
		LD		A,05H
		OUT		(0A3H),A    ;PORTC BIT2 <- 1
		IN		A,(0A1H)   ;PORTB -> A
		PUSH 	AF
		CALL	F2CHK      ;PORTC BIT7��0�ɂȂ�܂�LOOP
		LD		A,04H
		OUT		(0A3H),A    ;PORTC BIT2 <- 0
		POP 	AF
		RET
		
;**** 1BYTE���M ****
;A���W�X�^�̓��e��PORTA����4BIT��4BIT�����M
SNDBYTE:
		PUSH	AF
		RRA
		RRA
		RRA
		RRA
		AND		0FH
		CALL	SND4BIT
		POP		AF
		AND		0FH
		CALL	SND4BIT
		RET

;**** 4BIT���M ****
;A���W�X�^����4�r�b�g�𑗐M����
SND4BIT:
		OUT		(0A0H),A
		LD		A,05H
		OUT		(0A3H),A    ;PORTC BIT2 <- 1
		CALL	F1CHK      ;PORTC BIT7��1�ɂȂ�܂�LOOP
		LD		A,04H
		OUT		(0A3H),A    ;PORTC BIT2 <- 0
		CALL	F2CHK
		RET
		
;**** BUSY��CHECK(1) ****
; 82H BIT7��1�ɂȂ�܂�LOP
F1CHK:	IN		A,(0A2H)
		AND		80H        ;PORTC BIT7 = 1?
		JR		Z,F1CHK
		RET

;**** BUSY��CHECK(0) ****
; 82H BIT7��0�ɂȂ�܂�LOOP
F2CHK:	IN		A,(0A2H)
		AND		80H        ;PORTC BIT7 = 0?
		JR		NZ,F2CHK
		RET

;*********************** 0436H MONITOR ���C�g �C���t�H���[�V������֏��� ************
MSHED:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD		A,91H      ;HEADER SAVE�R�}���h91H
		CALL	MCMD       ;�R�}���h�R�[�h���M
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		LD		HL,IBUFE
		LD		B,80H
MSH1:	LD		A,(HL)     ;�C���t�H���[�V���� �u���b�N���M
		CALL	SNDBYTE
		INC		HL
		DJNZ	MSH1

		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		JP		MRET       ;����RETURN

;******************** 0475H MONITOR ���C�g �f�[�^��֏��� **********************
MSDAT:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD		A,92H      ;DATA SAVE�R�}���h92H
		CALL	MCMD       ;�R�}���h�R�[�h���M
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		LD		HL,FSIZE   ;FSIZE���M
		LD		A,(HL)
		CALL	SNDBYTE
		INC		HL
		LD		A,(HL)
		CALL	SNDBYTE

		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		LD		HL,IBUFE
		LD		A,(HL)
		CP		05H				;FILE MODE��05�Ȃ�BASIC TEXT START ADDRESS��SADRS�ɃZ�b�g
		JR		NZ,MSD0
		
		LD		HL,(TEXTST)
		LD		(SADRS),HL

MSD0:	LD		DE,(FSIZE)
		LD		HL,(SADRS)
MSD1:	LD		A,(HL)
		CALL	SNDBYTE      ;SADRS����FSIZE Byte�𑗐M�B�����Z�[�u�̏ꍇ�A���O��0436H��OPEN���ꂽ�t�@�C����ΏۂƂ���256�o�C�g����0475H��CALL�����B
		DEC		DE
		LD		A,D
		OR		E
		INC		HL
		JR		NZ,MSD1
		
		JP		MRET       ;����RETURN

;************************** 04D8H MONITOR ���[�h �C���t�H���[�V������֏��� *****************
MLHED:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD		A,93H      ;HEADER LOAD�R�}���h93H
		CALL	MCMD       ;�R�}���h�R�[�h���M
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		
		LD		DE,LNAME

MLH2:	LD		B,10H
MLH4:	LD		A,(DE)     ;FNAME���M
		CALL	SNDBYTE
		INC		DE
		DJNZ	MLH4

		LD		B,11H
MLH3:	LD		A,0DH
		CALL	SNDBYTE
		DJNZ	MLH3

		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		LD		HL,IBUFE
		LD		B,80H
MLH5:	CALL	RCVBYTE    ;�ǂ݂����ꂽ�C���t�H���[�V�����u���b�N����M
		LD		(HL),A
		INC		HL
		DJNZ	MLH5

		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		LD		DE,IBUFE
		LD		HL,ELMD		;DOS�t�@�C������IFB�t�@�C�������قȂ��Ă��Ă���v�������Ƃɂ���
		LD		B,12H
MLH7:	LD		A,(DE)
		LD		(HL),A
		INC		DE
		INC		HL
		DJNZ	MLH7
		
		JR		MRET       ;����RETURN

;**************************** 04F8H MONITOR ���[�h �f�[�^��֏��� ********************
MLDAT:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD		A,94H      ;DATA LOAD�R�}���h94H
		CALL	MCMD       ;�R�}���h�R�[�h���M
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		LD		HL,IBUFE
		LD		A,(HL)
		CP		05H				;FILE MODE��05�Ȃ�BASIC TEXT START ADDRESS��SADRS�ɃZ�b�g
		JR		NZ,MLD0
		LD		HL,(TEXTST)
		LD		(SADRS),HL

MLD0:	LD		DE,FSIZE   ;FSIZE���M
		LD		A,(DE)
		CALL	SNDBYTE
		INC		DE
		LD		A,(DE)
		CALL	SNDBYTE
		CALL	DBRCV      ;FSIZE���̃f�[�^����M���ASADRS����i�[�B�������[�h�̏ꍇ�A���O��0436H��OPEN���ꂽ�t�@�C����ΏۂƂ���256�o�C�g����SADRS�����Z�����04F8H��CALL�����B

		LD		HL,IBUFE
		LD		A,(HL)
		CP		05H				;FILE MODE��05�Ȃ�BASIC TEXT END ADDRESS��TEXTED�ɃZ�b�g
		JR		NZ,MLD1

		CALL	67BFH
		CALL	679CH


MLD1:	CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		JR		MRET       ;����RETURN

;�f�[�^��M
DBRCV:	LD		DE,(FSIZE)
		LD		HL,(SADRS)
DBRLOP:	CALL	RCVBYTE
		LD		(HL),A
		DEC		DE
		LD		A,D
		OR		E
		INC		HL
		JR		NZ,DBRLOP   ;DE=0�܂�LOOP
		RET

;************************** 0588H VRFY CMT �x���t�@�C��֏��� *******************
MVRFY:	XOR		A          ;����I���t���O
		RET

;******* ��֏����p�R�}���h�R�[�h���M (IN:A �R�}���h�R�[�h) **********
MCMD:	PUSH	AF
		CALL	INIT
		POP		AF
		CALL	SNDBYTE    ;�R�}���h�R�[�h���M
		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		RET

;****** ��֏����p����RETURN���� **********
MRET:	POP		HL
		POP		BC
		POP		DE
		XOR		A
		RET

;******* ��֏����pERROR���� **************
MERR:
		POP		HL
		POP		BC
		POP		DE
		LD		A,02H
		SCF
		RET
		
		END
