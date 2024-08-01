;
GETL		EQU		0003H
LETLN		EQU		0006H
MSGPR		EQU		0015H
PRTBYT		EQU		03C3H
DPCT		EQU		0DDCH
IBUFE		EQU		10F0H
FNAME		EQU		10F1H
FSIZE		EQU		1102H
SADRS		EQU		1104H
DSPX		EQU		1171H
LBUF		EQU		11A3H
MBUF		EQU		11AEH

;*********** MZ-1500_SD *****************
PPI_A		EQU		0A0H
;*********** MZ-80K_SD  *****************
;PPI_A		EQU		0D8H

PPI_B		EQU		PPI_A+1
PPI_C		EQU		PPI_A+2
PPI_R		EQU		PPI_A+3

;PPI_A PORTA ���M�f�[�^(����4�r�b�g)
;PPI_B PORTB ��M�f�[�^(8�r�b�g)
;
;PPI_C PORTC Bit
;7 IN  CHK
;6 IN
;5 IN
;4 IN 
;3 OUT
;2 OUT FLG
;1 OUT
;0 OUT
;
;PPI_R �R���g���[�����W�X�^


       ORG		0CD00H

		JP		START
;******************** MONITOR CMT���[�`����� *************************************
ENT1:	JP		MSHED
ENT2:	JP		MSDAT
ENT3:	JP		MLHED
ENT4:	JP		MLDAT
ENT5:	JP		MVRFY
ENT6:	JP		MSHED2
ENT7:	JP		MLHED2
		
START:	CALL	INIT
		RET

;**** 8255������ ****
;PORTC����BIT��OUTPUT�A���BIT��INPUT�APORTB��INPUT�APORTA��OUTPUT
INIT:	LD		A,8AH
		OUT		(PPI_R),A
;�o��BIT�����Z�b�g
INIT2:	LD		A,00H      ;PORTA <- 0
		OUT		(PPI_A),A
		OUT		(PPI_C),A   ;PORTC <- 0
		RET

;**** 1BYTE��M ****
;��MDATA��A���W�X�^�ɃZ�b�g���ă��^�[��
RCVBYTE:
		CALL	F1CHK      ;PORTC BIT7��1�ɂȂ�܂�LOOP
		IN		A,(PPI_B)   ;PORTB -> A
		PUSH 	AF
		LD		A,05H
		OUT		(PPI_R),A    ;PORTC BIT2 <- 1
		CALL	F2CHK      ;PORTC BIT7��0�ɂȂ�܂�LOOP
		LD		A,04H
		OUT		(PPI_R),A    ;PORTC BIT2 <- 0
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
		OUT		(PPI_A),A
		LD		A,05H
		OUT		(PPI_R),A    ;PORTC BIT2 <- 1
		CALL	F1CHK      ;PORTC BIT7��1�ɂȂ�܂�LOOP
		LD		A,04H
		OUT		(PPI_R),A    ;PORTC BIT2 <- 0
		CALL	F2CHK
		RET
		
;**** BUSY��CHECK(1) ****
; 82H BIT7��1�ɂȂ�܂�LOP
F1CHK:	IN		A,(PPI_C)
		AND		80H        ;PORTC BIT7 = 1?
		JR		Z,F1CHK
		RET

;**** BUSY��CHECK(0) ****
; 82H BIT7��0�ɂȂ�܂�LOOP
F2CHK:	IN		A,(PPI_C)
		AND		80H        ;PORTC BIT7 = 0?
		JR		NZ,F2CHK
		RET

;******** MESSAGE DATA ********************
WRMSG:
		DB		'WRITING '
		DB		0DH

MSG_F0:
		DB		'SD-CARD INITIALIZE ERROR'
		DB		0DH
		
MSG_F1:
		DB		'NOT FIND FILE'
		DB		0DH
		
MSG_DNAME:
		DB		'DOS FILE:'
MSG_DNAMEEND:
		DB		'                            '
		DB		0DH
		
MSG_SNAME:
		DB		'SAVE NAME:'
MSG_SNAMEEND:
		DB		'                            '
		DB		0DH
		
MSG99:
		DB		' ERROR'
		DB		0DH
		
;*********************** 0436H MONITOR ���C�g �C���t�H���[�V������֏��� ************
MSHED:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		CALL	INIT
		LD		A,91H      ;HEADER SAVE�R�}���h91H
		CALL	MCMD       ;�R�}���h�R�[�h���M
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

MSH7:	LD		B,11H
		LD		HL,FNAME+10H     ;�t�@�C���l�[��
		LD		A,0DH            ;17�����ڂɂ͏��0DH���Z�b�g����
		LD		(HL),A
MSH0:	LD		A,(HL)
		CP		0DH              ;0DH�ł���΂ЂƂO�̕����̌����Ɉڂ�
		JR		Z,MSH1
		CP		20H              ;20H�ł����0DH���Z�b�g���ĂЂƂO�̕����̌����Ɉڂ�
		JR		NZ,MSH2          ;0DH�A20H�ȊO�̕����ł���ΏI��
		LD		A,0DH
		LD		(HL),A
		
MSH1:	DEC		HL
		DJNZ	MSH0

MSH2:	CALL	LETLN
		LD		DE,WRMSG   ;'WRITING '
		CALL	MSGPR        ;���b�Z�[�W�\��
		LD		DE,FNAME     ;�t�@�C���l�[��
		CALL	MSGPR       ;���b�Z�[�W�\��

		LD		HL,IBUFE
		LD		B,80H
MSH3:	LD		A,(HL)     ;�C���t�H���[�V���� �u���b�N���M
		CALL	SNDBYTE
		INC		HL
		DJNZ	MSH3

		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		JP		MRET       ;����RETURN

;*********************** 0436H MONITOR ���C�g �C���t�H���[�V������֏��� ************
;  ��������SAVE�t�@�C���l�[�������
MSHED2:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		CALL	INIT
		LD		A,91H      ;HEADER SAVE�R�}���h91H
		CALL	MCMD       ;�R�}���h�R�[�h���M
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		LD		A,03H          ;��s�����N���A���邽��3�����폜�A37�����o��
		LD		(DSPX),A
		LD		A,0C7H
		CALL	DPCT
		CALL	DPCT
		CALL	DPCT
		LD		DE,MSG_SNAME   ;'SAVE NAME:'
		CALL	MSGPR
		LD		A,0AH          ;�J�[�\����10�����ڂɖ߂�
		LD		(DSPX),A

		LD		DE,MBUF
		CALL	GETL
		
		LD		DE,MBUF+10
		
		LD		B,10H
		LD		HL,FNAME
MSH61:	LD		A,(DE)
		LD		(HL),A
		INC		HL
		INC		DE
		DJNZ	MSH61
		JP		MSH7

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

		LD		DE,(FSIZE)
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
		CALL	INIT

		LD		B,08H      ;LBUF��0DH�Ŗ��߃t�@�C���l�[�����w�肳��Ȃ��������Ƃɂ���
		LD		DE,LBUF
		LD		A,0DH
MLH0:	LD		(DE),A
		INC		DE
		DJNZ	MLH0

		LD		A,03H          ;��s�����N���A���邽��3�����폜�A37�����o��
		LD		(DSPX),A
		LD		A,0C7H
		CALL	DPCT
		CALL	DPCT
		CALL	DPCT
MLH6:	LD		DE,MSG_DNAME   ;'DOS FILE:'
		CALL	MSGPR
		LD		A,09H          ;�J�[�\����9�����ڂɖ߂�
		LD		(DSPX),A

		LD		DE,MBUF    ;�t�@�C���l�[�����w�����邽�߂̋���̍�BLOAD�R�}���h�Ƃ��Ă̓t�@�C���l�[���Ȃ��Ƃ��ĉ��s�����̂��ɍs�o�b�t�@�̈ʒu�����炵��DOS�t�@�C���l�[������͂���B
		CALL	GETL
		
		LD		DE,MBUF+9
		
MLH7:	LD		A,93H      ;HEADER LOAD�R�}���h93H
		CALL	MCMD       ;�R�}���h�R�[�h���M
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

MLH1:
		LD		A,(DE)
		CP		20H                 ;�s���̃X�y�[�X���t�@�C���l�[���܂œǂݔ�΂�
		JR		NZ,MLH2
		INC		DE
		JR		MLH1

MLH2:	LD		B,20H
MLH4:	LD		A,(DE)     ;FNAME���M
		CP		20H
		JR		NC,MLH3
		LD		A,0DH
MLH3:
		CALL	SNDBYTE
		INC		DE
		DEC		B
		JR		NZ,MLH4
		LD		A,0DH
		CALL	SNDBYTE
		
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

		JP		MRET       ;����RETURN

;************************** 04D8H MONITOR ���[�h �C���t�H���[�V������֏��� *****************
; DE<-DOS�t�@�C���l�[���i�[�A�h���X���Z�b�g�A�t�@�C���l�[���̍Ō��ODH�Ƃ��邱��
MLHED2:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		CALL	INIT
		JP		MLH7

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

		LD		DE,FSIZE   ;FSIZE���M
		LD		A,(DE)
		CALL	SNDBYTE
		INC		DE
		LD		A,(DE)
		CALL	SNDBYTE
		CALL	DBRCV      ;FSIZE���̃f�[�^����M���ASADRS����i�[�B�������[�h�̏ꍇ�A���O��0436H��OPEN���ꂽ�t�@�C����ΏۂƂ���256�o�C�g����SADRS�����Z�����04F8H��CALL�����B

		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
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
MVRFY:
		XOR		A          ;����I���t���O

		RET

;******* ��֏����p�R�}���h�R�[�h���M (IN:A �R�}���h�R�[�h) **********
MCMD:
		CALL	SNDBYTE    ;�R�}���h�R�[�h���M
		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		RET

;****** ��֏����p����RETURN���� **********
MRET:	POP		HL
		POP		BC
		POP		DE
		XOR		A          ;����I���t���O
		
		RET

;******* ��֏����pERROR���� **************
MERR:
		CP		0F0H
		JR		NZ,MERR3
		LD		DE,MSG_F0
		JR		MERRMSG
		
MERR3:	CP		0F1H
		JR		NZ,MERR99
		LD		DE,MSG_F1
		JR		MERRMSG
		
MERR99:	CALL	PRTBYT
		LD		DE,MSG99
		
MERRMSG:
		CALL	MSGPR
		CALL	LETLN
		POP		HL
		POP		BC
		POP		DE
		LD		A,02H
		SCF

		RET

		END