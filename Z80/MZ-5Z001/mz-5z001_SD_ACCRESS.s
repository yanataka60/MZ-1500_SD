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

;0A0H PORTA 送信データ(下位4ビット)
;0A1H PORTB 受信データ(8ビット)
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
;0A3H コントロールレジスタ


		ORG		2000H

		JP		START
;******************** MONITOR CMTルーチン代替 *************************************
ENT1:	JP		MSHED
ENT2:	JP		MSDAT
ENT3:	JP		MLHED
ENT4:	JP		MLDAT
ENT5:	JP		MVRFY
		
START:	CALL	INIT
		RET
		
;**** 8255初期化 ****
;PORTC下位BITをOUTPUT、上位BITをINPUT、PORTBをINPUT、PORTAをOUTPUT
INIT:	LD		A,8AH
		OUT		(0A3H),A
;出力BITをリセット
INIT2:	LD		A,00H      ;PORTA <- 0
		OUT		(0A0H),A
		OUT		(0A2H),A   ;PORTC <- 0
		RET

;**** 1BYTE受信 ****
;受信DATAをAレジスタにセットしてリターン
RCVBYTE:
		CALL	F1CHK      ;PORTC BIT7が1になるまでLOOP
		LD		A,05H
		OUT		(0A3H),A    ;PORTC BIT2 <- 1
		IN		A,(0A1H)   ;PORTB -> A
		PUSH 	AF
		CALL	F2CHK      ;PORTC BIT7が0になるまでLOOP
		LD		A,04H
		OUT		(0A3H),A    ;PORTC BIT2 <- 0
		POP 	AF
		RET
		
;**** 1BYTE送信 ****
;Aレジスタの内容をPORTA下位4BITに4BITずつ送信
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

;**** 4BIT送信 ****
;Aレジスタ下位4ビットを送信する
SND4BIT:
		OUT		(0A0H),A
		LD		A,05H
		OUT		(0A3H),A    ;PORTC BIT2 <- 1
		CALL	F1CHK      ;PORTC BIT7が1になるまでLOOP
		LD		A,04H
		OUT		(0A3H),A    ;PORTC BIT2 <- 0
		CALL	F2CHK
		RET
		
;**** BUSYをCHECK(1) ****
; 82H BIT7が1になるまでLOP
F1CHK:	IN		A,(0A2H)
		AND		80H        ;PORTC BIT7 = 1?
		JR		Z,F1CHK
		RET

;**** BUSYをCHECK(0) ****
; 82H BIT7が0になるまでLOOP
F2CHK:	IN		A,(0A2H)
		AND		80H        ;PORTC BIT7 = 0?
		JR		NZ,F2CHK
		RET

;*********************** 0436H MONITOR ライト インフォメーション代替処理 ************
MSHED:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD		A,91H      ;HEADER SAVEコマンド91H
		CALL	MCMD       ;コマンドコード送信
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		LD		HL,IBUFE
		LD		B,80H
MSH1:	LD		A,(HL)     ;インフォメーション ブロック送信
		CALL	SNDBYTE
		INC		HL
		DJNZ	MSH1

		CALL	RCVBYTE    ;状態取得(00H=OK)
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		JP		MRET       ;正常RETURN

;******************** 0475H MONITOR ライト データ代替処理 **********************
MSDAT:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD		A,92H      ;DATA SAVEコマンド92H
		CALL	MCMD       ;コマンドコード送信
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		LD		HL,FSIZE   ;FSIZE送信
		LD		A,(HL)
		CALL	SNDBYTE
		INC		HL
		LD		A,(HL)
		CALL	SNDBYTE

		CALL	RCVBYTE    ;状態取得(00H=OK)
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		LD		HL,IBUFE
		LD		A,(HL)
		CP		05H				;FILE MODEが05ならBASIC TEXT START ADDRESSをSADRSにセット
		JR		NZ,MSD0
		
		LD		HL,(TEXTST)
		LD		(SADRS),HL

MSD0:	LD		DE,(FSIZE)
		LD		HL,(SADRS)
MSD1:	LD		A,(HL)
		CALL	SNDBYTE      ;SADRSからFSIZE Byteを送信。分割セーブの場合、直前に0436HでOPENされたファイルを対象として256バイトずつ0475HがCALLされる。
		DEC		DE
		LD		A,D
		OR		E
		INC		HL
		JR		NZ,MSD1
		
		JP		MRET       ;正常RETURN

;************************** 04D8H MONITOR リード インフォメーション代替処理 *****************
MLHED:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD		A,93H      ;HEADER LOADコマンド93H
		CALL	MCMD       ;コマンドコード送信
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		
		LD		DE,LNAME

MLH2:	LD		B,10H
MLH4:	LD		A,(DE)     ;FNAME送信
		CALL	SNDBYTE
		INC		DE
		DJNZ	MLH4

		LD		B,11H
MLH3:	LD		A,0DH
		CALL	SNDBYTE
		DJNZ	MLH3

		CALL	RCVBYTE    ;状態取得(00H=OK)
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		CALL	RCVBYTE    ;状態取得(00H=OK)
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		LD		HL,IBUFE
		LD		B,80H
MLH5:	CALL	RCVBYTE    ;読みだされたインフォメーションブロックを受信
		LD		(HL),A
		INC		HL
		DJNZ	MLH5

		CALL	RCVBYTE    ;状態取得(00H=OK)
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		LD		DE,IBUFE
		LD		HL,ELMD		;DOSファイル名とIFBファイル名が異なっていても一致したことにする
		LD		B,12H
MLH7:	LD		A,(DE)
		LD		(HL),A
		INC		DE
		INC		HL
		DJNZ	MLH7
		
		JR		MRET       ;正常RETURN

;**************************** 04F8H MONITOR リード データ代替処理 ********************
MLDAT:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD		A,94H      ;DATA LOADコマンド94H
		CALL	MCMD       ;コマンドコード送信
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		CALL	RCVBYTE    ;状態取得(00H=OK)
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		CALL	RCVBYTE    ;状態取得(00H=OK)
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		LD		HL,IBUFE
		LD		A,(HL)
		CP		05H				;FILE MODEが05ならBASIC TEXT START ADDRESSをSADRSにセット
		JR		NZ,MLD0
		LD		HL,(TEXTST)
		LD		(SADRS),HL

MLD0:	LD		DE,FSIZE   ;FSIZE送信
		LD		A,(DE)
		CALL	SNDBYTE
		INC		DE
		LD		A,(DE)
		CALL	SNDBYTE
		CALL	DBRCV      ;FSIZE分のデータを受信し、SADRSから格納。分割ロードの場合、直前に0436HでOPENされたファイルを対象として256バイトずつSADRSが加算されて04F8HがCALLされる。

		LD		HL,IBUFE
		LD		A,(HL)
		CP		05H				;FILE MODEが05ならBASIC TEXT END ADDRESSをTEXTEDにセット
		JR		NZ,MLD1

		CALL	67BFH
		CALL	679CH


MLD1:	CALL	RCVBYTE    ;状態取得(00H=OK)
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		JR		MRET       ;正常RETURN

;データ受信
DBRCV:	LD		DE,(FSIZE)
		LD		HL,(SADRS)
DBRLOP:	CALL	RCVBYTE
		LD		(HL),A
		DEC		DE
		LD		A,D
		OR		E
		INC		HL
		JR		NZ,DBRLOP   ;DE=0までLOOP
		RET

;************************** 0588H VRFY CMT ベリファイ代替処理 *******************
MVRFY:	XOR		A          ;正常終了フラグ
		RET

;******* 代替処理用コマンドコード送信 (IN:A コマンドコード) **********
MCMD:	PUSH	AF
		CALL	INIT
		POP		AF
		CALL	SNDBYTE    ;コマンドコード送信
		CALL	RCVBYTE    ;状態取得(00H=OK)
		RET

;****** 代替処理用正常RETURN処理 **********
MRET:	POP		HL
		POP		BC
		POP		DE
		XOR		A
		RET

;******* 代替処理用ERROR処理 **************
MERR:
		POP		HL
		POP		BC
		POP		DE
		LD		A,02H
		SCF
		RET
		
		END
