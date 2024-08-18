;2024.8.18 MSDAT�AMLDAT�ւ̃p�����[�^SADRS�AFSIZE��HL�ABC���W�X�^���g���Ă��邱�Ƃ������������ߏC��

ELMD		EQU		1000H
LNAME		EQU		1001H
LSIZE		EQU		1014H
GETL		EQU		0003H
LETLN		EQU		0006H
MSGPR		EQU		0015H
GETKEY		EQU		001BH
BRKCHK		EQU		001EH
IBUFE		EQU		10F0H
FNAME		EQU		10F1H
FSIZE		EQU		1102H
SADRS		EQU		1104H
DSPX		EQU		0054H
LBUF		EQU		11A4H
MBUF		EQU		11AEH
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


		ORG		2200H

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
		IN		A,(0A1H)   ;PORTB -> A
		PUSH 	AF
		LD		A,05H
		OUT		(0A3H),A    ;PORTC BIT2 <- 1
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

;**** �R�}���h���M (IN:A �R�}���h�R�[�h)****
STCD:	CALL	SNDBYTE    ;A���W�X�^�̃R�}���h�R�[�h�𑗐M
		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		RET

;*********************** 0436H MONITOR ���C�g �C���t�H���[�V������֏��� ************
MSHED:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		CALL	INIT
		LD		A,91H      ;HEADER SAVE�R�}���h91H
		CALL	MCMD       ;�R�}���h�R�[�h���M
		AND		A          ;00�ȊO�Ȃ�ERROR
		JR		NZ,MERR

		LD		HL,IBUFE
		LD		B,80H
MSH1:	LD		A,(HL)     ;�C���t�H���[�V���� �u���b�N���M
		CALL	SNDBYTE
		INC		HL
		DJNZ	MSH1

		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		AND		A          ;00�ȊO�Ȃ�ERROR
		JR		NZ,MERR

		JR		MRET       ;����RETURN

;******************** 0475H MONITOR ���C�g �f�[�^��֏��� **********************
MSDAT:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD		A,92H      ;DATA SAVE�R�}���h92H
		CALL	MCMD       ;�R�}���h�R�[�h���M
		AND		A          ;00�ȊO�Ȃ�ERROR
		JR		NZ,MERR

		LD		A,C        ;FSIZE���M
		CALL	SNDBYTE
		LD		A,B        ;FSIZE���M
		CALL	SNDBYTE

		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		AND		A          ;00�ȊO�Ȃ�ERROR
		JR		NZ,MERR

MSD1:	LD		A,(HL)
		CALL	SNDBYTE      ;SADRS����FSIZE Byte�𑗐M�B�����Z�[�u�̏ꍇ�A���O��0436H��OPEN���ꂽ�t�@�C����ΏۂƂ���256�o�C�g����0475H��CALL�����B
		DEC		BC
		LD		A,B
		OR		C
		INC		HL
		JR		NZ,MSD1
		
;		JR		MRET       ;����RETURN

;****** ��֏����p����RETURN���� **********
MRET:	POP		HL
		POP		BC
		POP		DE
		XOR		A
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
		
MERR99:
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
		
;************************** 04D8H MONITOR ���[�h �C���t�H���[�V������֏��� *****************
MLHED:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		CALL	INIT

		LD		A,(LNAME)	;�t�@�C�������w�肳��Ă���΂��̂܂ܑ��M�A�w�肳��Ă��Ȃ���Γ��͏�����
		CP		0DH
		JR		Z,MLH10
		
		LD		A,93H      ;HEADER LOAD�R�}���h93H
		CALL	MCMD       ;�R�}���h�R�[�h���M
		AND		A          ;00�ȊO�Ȃ�ERROR
		JR		NZ,MERR

		LD		DE,LNAME

		LD		B,10H
MLN4:	LD		A,(DE)     ;FNAME���M
		CALL	SNDBYTE
		INC		DE
		DJNZ	MLN4

		LD		B,11H
MLN3:	LD		A,0DH
		CALL	SNDBYTE
		DJNZ	MLN3

		JR		MLN5

MLH10:	LD		B,08H      ;LBUF��0DH�Ŗ��߃t�@�C���l�[�����w�肳��Ȃ��������Ƃɂ���
		LD		DE,LBUF
		LD		A,0DH
MLH0:	LD		(DE),A
		INC		DE
		DJNZ	MLH0

MLH6:	LD		DE,MSG_DNAME   ;'DOS FILE:'
		CALL	MSGPR
		LD		A,09H          ;�J�[�\����9�����ڂɖ߂�
		LD		(DSPX),A

		LD		DE,MBUF    ;�t�@�C���l�[�����w�����邽�߂̋���̍�BLOAD�R�}���h�Ƃ��Ă̓t�@�C���l�[���Ȃ��Ƃ��ĉ��s�����̂��ɍs�o�b�t�@�̈ʒu�����炵��DOS�t�@�C���l�[������͂���B
		CALL	GETL
		
		LD		DE,MBUF+9
		
		LD		A,(DE)
;**** �t�@�C���l�[���̐擪��'*'�Ȃ�g���R�}���h�����ֈڍs ****
		CP		'*'
		JR		Z,MLHCMD

		LD		A,93H      ;HEADER LOAD�R�}���h93H
		CALL	MCMD       ;�R�}���h�R�[�h���M
		AND		A          ;00�ȊO�Ȃ�ERROR
		JR		NZ,MERR

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
		DJNZ	MLH4
		LD		A,0DH
		CALL	SNDBYTE
		
MLN5:	CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
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
		
		JP		MRET       ;����RETURN

;**************************** �A�v���P�[�V������SD-CARD���쏈�� **********************
MLHCMD:
;**** HL�ADE�ABC���W�X�^��ۑ� ****
		PUSH	HL
		PUSH	DE
		PUSH	BC
		INC		DE
		LD		B,03H
;**** FDL�R�}���h ****
		LD		HL,CMD1
		CALL	CMPSTR
		JR		Z,MLHCMD2
		POP		BC
		POP		DE
		POP		HL
;**** �t�@�C���l�[�����͂֕��A ****
		JP		MLH6

MLHCMD2:
		INC		DE
		INC		DE
		INC		DE
		LD		HL,MSG_DNAME         ;�s����'DOS FILE:'��t���邱�ƂŃJ�[�\�����ړ��������^�[���Ŏ��s�ł���悤��
		LD		BC,MSG_DNAMEEND-MSG_DNAME
;**** FDL�R�}���h�Ăяo�� ****
		CALL	DIRLIST
		AND		A          ;00�ȊO�Ȃ�ERROR
		JR		NZ,SERR
		POP		BC
		POP		DE
		POP		HL
;**** �t�@�C���l�[�����͂֕��A ****
		JP		MLH6

;******* �A�v���P�[�V������SD-CARD���쏈���pERROR���� **************
SERR:
		CP		0F0H
		JR		NZ,SERR3
		LD		DE,MSG_F0
		JR		SERRMSG
		
SERR3:	CP		0F1H
		JR		NZ,SERR99
		LD		DE,MSG_F1
		JR		SERRMSG
		
SERR99:
		LD		DE,MSG99
		
SERRMSG:
		CALL	MSGPR
		CALL	LETLN
		POP		BC
		POP		DE
		POP		HL
;**** �t�@�C���l�[�����͂֕��A ****
		JP		MLH6

;**** �R�}���h�������r ****
CMPSTR:
		PUSH	BC
		PUSH	DE
CMP1:	LD		A,(DE)
		CP		(HL)
		JR		NZ,CMP2
		DEC		B
		JR		Z,CMP2
		CP		0Dh
		JR		Z,CMP2
		INC		DE
		INC		HL
		JR		CMP1
CMP2:	POP		DE
		POP		BC
		RET

;**** �R�}���h���X�g ****
; �����g���p
CMD1:	DB		'FDL',0DH


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

		LD		A,C        ;FSIZE���M
		CALL	SNDBYTE
		LD		A,B        ;FSIZE���M
		CALL	SNDBYTE
		CALL	DBRCV      ;FSIZE���̃f�[�^����M���ASADRS����i�[�B�������[�h�̏ꍇ�A���O��0436H��OPEN���ꂽ�t�@�C����ΏۂƂ���256�o�C�g����SADRS�����Z�����04F8H��CALL�����B


MLD1:	CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		AND		A          ;00�ȊO�Ȃ�ERROR
		JP		NZ,MERR

		JP		MRET       ;����RETURN

;�f�[�^��M
DBRCV:
DBRLOP:	CALL	RCVBYTE
		LD		(HL),A
		DEC		BC
		LD		A,B
		OR		C
		INC		HL
		JR		NZ,DBRLOP   ;DE=0�܂�LOOP
		RET

;************************** 0588H VRFY CMT �x���t�@�C��֏��� *******************
MVRFY:	XOR		A          ;����I���t���O
		RET


;**** DIRLIST�{�� (HL=�s���ɕt�����镶����̐擪�A�h���X BC=�s���ɕt�����镶����̒���) ****
;****              �߂�l A=�G���[�R�[�h ****
DIRLIST:
		LD		A,83H      ;DIRLIST�R�}���h83H�𑗐M
		CALL	STCD       ;�R�}���h�R�[�h���M
		AND		A          ;00�ȊO�Ȃ�ERROR
		JR		NZ,DLRET
		
		PUSH	BC
		LD		B,21H
STLT1:	LD		A,(DE)
		CP		0DH
		JR		NZ,STLT2
		LD		A,00H
STLT2:	CALL	SNDBYTE           ;�y�[�W�w���𑗐M
		INC		DE
		DJNZ	STLT1
		POP		BC
DL1:
		PUSH	HL
		PUSH	BC
		LD		DE,LBUF
		LDIR
		EX		DE,HL
DL2:	CALL	RCVBYTE           ;'00H'����M����܂ł���s�Ƃ���
		CP		00H
		JR		Z,DL3
		CP		0FFH              ;'0FFH'����M������I��
		JR		Z,DL4
		CP		0FEH              ;'0FEH'����M������ꎞ��~���Ĉꕶ�����͑҂�
		JR		Z,DL5
		LD		(HL),A
		INC		HL
		JR		DL2
DL3:
		LD		(HL),A
		LD		DE,LBUF           ;'00H'����M�������s����\�����ĉ��s
		CALL	MSGPR
;		CALL	LETLN
		POP		BC
		POP		HL
		JR		DL1
DL4:	CALL	RCVBYTE           ;��Ԏ擾(00H=OK)
		POP		BC
		POP		HL
		JR		DLRET

DL5:	LD		DE,MSG_KEY1        ;HIT ANT KEY�\��
		CALL	MSGPR

		LD		A,12H              ;���󕶎���\��
		RST		18H
		DB		04H

		LD		DE,MSG_KEY2        ;HIT ANT KEY�\��
		CALL	MSGPR
		CALL	LETLN
DL6:	CALL	GETKEY            ;1�������͑҂�
		CP		00H
		JR		Z,DL6
		CP		12H               ;�J�[�\�����őł��؂�
		JR		Z,DL9
		CP		42H               ;�uB�v�őO�y�[�W
		JR		Z,DL8

		CALL	BRKCHK
		JR		Z,DL7             ;SHIFT+BREAK�őł��؂�

		LD		A,00H             ;����ȊO�Ōp��
		JR		DL8
DL9:
		LD		A,12H             ;�J�[�\�����őł��؂����Ƃ��ɃJ�[�\��2�s���
		RST		18H
		DB		03H
		LD		A,12H
		RST		18H
		DB		03H
DL7:	LD		A,0FFH            ;0FFH���f�R�[�h�𑗐M
DL8:	CALL	SNDBYTE
		CALL	LETLN
		JR		DL2
		
DLRET:		
		RET
		

;******** MESSAGE DATA ********************
MSG_F0:
		DB		'SD-CARD INITIALIZE ERROR'
		DB		00H
		
MSG_F1:
		DB		'NOT FIND FILE'
		DB		00H
		
MSG_KEY1:
		DB		'NEXT:ANY BACK:B BREAK:'
		DB		00H
MSG_KEY2:
		DB		' OR SHIFT+BREAK'
		DB		00H
		
MSG_DNAME:
		DB		'DOS FILE:'
MSG_DNAMEEND:
		DB		'                            '
		DB		00H

MSG99:
		DB		'UNKNOWN ERROR'
		DB		00H

;******* ��֏����p�R�}���h�R�[�h���M (IN:A �R�}���h�R�[�h) **********
MCMD:	PUSH	AF
		CALL	INIT
		POP		AF
		CALL	SNDBYTE    ;�R�}���h�R�[�h���M
		CALL	RCVBYTE    ;��Ԏ擾(00H=OK)
		RET

		END
