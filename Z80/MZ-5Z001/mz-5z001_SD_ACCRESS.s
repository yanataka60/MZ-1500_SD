;2024.8.18 MSDAT、MLDATへのパラメータSADRS、FSIZEがHL、BCレジスタを使っていることが判明したため修正

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


		ORG		2200H

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
		IN		A,(0A1H)   ;PORTB -> A
		PUSH 	AF
		LD		A,05H
		OUT		(0A3H),A    ;PORTC BIT2 <- 1
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

;**** コマンド送信 (IN:A コマンドコード)****
STCD:	CALL	SNDBYTE    ;Aレジスタのコマンドコードを送信
		CALL	RCVBYTE    ;状態取得(00H=OK)
		RET

;*********************** 0436H MONITOR ライト インフォメーション代替処理 ************
MSHED:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		CALL	INIT
		LD		A,91H      ;HEADER SAVEコマンド91H
		CALL	MCMD       ;コマンドコード送信
		AND		A          ;00以外ならERROR
		JR		NZ,MERR

		LD		HL,IBUFE
		LD		B,80H
MSH1:	LD		A,(HL)     ;インフォメーション ブロック送信
		CALL	SNDBYTE
		INC		HL
		DJNZ	MSH1

		CALL	RCVBYTE    ;状態取得(00H=OK)
		AND		A          ;00以外ならERROR
		JR		NZ,MERR

		JR		MRET       ;正常RETURN

;******************** 0475H MONITOR ライト データ代替処理 **********************
MSDAT:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD		A,92H      ;DATA SAVEコマンド92H
		CALL	MCMD       ;コマンドコード送信
		AND		A          ;00以外ならERROR
		JR		NZ,MERR

		LD		A,C        ;FSIZE送信
		CALL	SNDBYTE
		LD		A,B        ;FSIZE送信
		CALL	SNDBYTE

		CALL	RCVBYTE    ;状態取得(00H=OK)
		AND		A          ;00以外ならERROR
		JR		NZ,MERR

MSD1:	LD		A,(HL)
		CALL	SNDBYTE      ;SADRSからFSIZE Byteを送信。分割セーブの場合、直前に0436HでOPENされたファイルを対象として256バイトずつ0475HがCALLされる。
		DEC		BC
		LD		A,B
		OR		C
		INC		HL
		JR		NZ,MSD1
		
;		JR		MRET       ;正常RETURN

;****** 代替処理用正常RETURN処理 **********
MRET:	POP		HL
		POP		BC
		POP		DE
		XOR		A
		RET

;******* 代替処理用ERROR処理 **************
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
		
;************************** 04D8H MONITOR リード インフォメーション代替処理 *****************
MLHED:
		PUSH	DE
		PUSH	BC
		PUSH	HL
		CALL	INIT

		LD		A,(LNAME)	;ファイル名が指定されていればそのまま送信、指定されていなければ入力処理へ
		CP		0DH
		JR		Z,MLH10
		
		LD		A,93H      ;HEADER LOADコマンド93H
		CALL	MCMD       ;コマンドコード送信
		AND		A          ;00以外ならERROR
		JR		NZ,MERR

		LD		DE,LNAME

		LD		B,10H
MLN4:	LD		A,(DE)     ;FNAME送信
		CALL	SNDBYTE
		INC		DE
		DJNZ	MLN4

		LD		B,11H
MLN3:	LD		A,0DH
		CALL	SNDBYTE
		DJNZ	MLN3

		JR		MLN5

MLH10:	LD		B,08H      ;LBUFを0DHで埋めファイルネームが指定されなかったことにする
		LD		DE,LBUF
		LD		A,0DH
MLH0:	LD		(DE),A
		INC		DE
		DJNZ	MLH0

MLH6:	LD		DE,MSG_DNAME   ;'DOS FILE:'
		CALL	MSGPR
		LD		A,09H          ;カーソルを9文字目に戻す
		LD		(DSPX),A

		LD		DE,MBUF    ;ファイルネームを指示するための苦肉の策。LOADコマンドとしてはファイルネームなしとして改行したのちに行バッファの位置をずらしてDOSファイルネームを入力する。
		CALL	GETL
		
		LD		DE,MBUF+9
		
		LD		A,(DE)
;**** ファイルネームの先頭が'*'なら拡張コマンド処理へ移行 ****
		CP		'*'
		JR		Z,MLHCMD

		LD		A,93H      ;HEADER LOADコマンド93H
		CALL	MCMD       ;コマンドコード送信
		AND		A          ;00以外ならERROR
		JR		NZ,MERR

MLH1:
		LD		A,(DE)
		CP		20H                 ;行頭のスペースをファイルネームまで読み飛ばし
		JR		NZ,MLH2
		INC		DE
		JR		MLH1

MLH2:	LD		B,20H
MLH4:	LD		A,(DE)     ;FNAME送信
		CP		20H
		JR		NC,MLH3
		LD		A,0DH
MLH3:
		CALL	SNDBYTE
		INC		DE
		DJNZ	MLH4
		LD		A,0DH
		CALL	SNDBYTE
		
MLN5:	CALL	RCVBYTE    ;状態取得(00H=OK)
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
		
		JP		MRET       ;正常RETURN

;**************************** アプリケーション内SD-CARD操作処理 **********************
MLHCMD:
;**** HL、DE、BCレジスタを保存 ****
		PUSH	HL
		PUSH	DE
		PUSH	BC
		INC		DE
		LD		B,03H
;**** FDLコマンド ****
		LD		HL,CMD1
		CALL	CMPSTR
		JR		Z,MLHCMD2
		POP		BC
		POP		DE
		POP		HL
;**** ファイルネーム入力へ復帰 ****
		JP		MLH6

MLHCMD2:
		INC		DE
		INC		DE
		INC		DE
		LD		HL,MSG_DNAME         ;行頭に'DOS FILE:'を付けることでカーソルを移動させリターンで実行できるように
		LD		BC,MSG_DNAMEEND-MSG_DNAME
;**** FDLコマンド呼び出し ****
		CALL	DIRLIST
		AND		A          ;00以外ならERROR
		JR		NZ,SERR
		POP		BC
		POP		DE
		POP		HL
;**** ファイルネーム入力へ復帰 ****
		JP		MLH6

;******* アプリケーション内SD-CARD操作処理用ERROR処理 **************
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
;**** ファイルネーム入力へ復帰 ****
		JP		MLH6

;**** コマンド文字列比較 ****
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

;**** コマンドリスト ****
; 将来拡張用
CMD1:	DB		'FDL',0DH


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

		LD		A,C        ;FSIZE送信
		CALL	SNDBYTE
		LD		A,B        ;FSIZE送信
		CALL	SNDBYTE
		CALL	DBRCV      ;FSIZE分のデータを受信し、SADRSから格納。分割ロードの場合、直前に0436HでOPENされたファイルを対象として256バイトずつSADRSが加算されて04F8HがCALLされる。


MLD1:	CALL	RCVBYTE    ;状態取得(00H=OK)
		AND		A          ;00以外ならERROR
		JP		NZ,MERR

		JP		MRET       ;正常RETURN

;データ受信
DBRCV:
DBRLOP:	CALL	RCVBYTE
		LD		(HL),A
		DEC		BC
		LD		A,B
		OR		C
		INC		HL
		JR		NZ,DBRLOP   ;DE=0までLOOP
		RET

;************************** 0588H VRFY CMT ベリファイ代替処理 *******************
MVRFY:	XOR		A          ;正常終了フラグ
		RET


;**** DIRLIST本体 (HL=行頭に付加する文字列の先頭アドレス BC=行頭に付加する文字列の長さ) ****
;****              戻り値 A=エラーコード ****
DIRLIST:
		LD		A,83H      ;DIRLISTコマンド83Hを送信
		CALL	STCD       ;コマンドコード送信
		AND		A          ;00以外ならERROR
		JR		NZ,DLRET
		
		PUSH	BC
		LD		B,21H
STLT1:	LD		A,(DE)
		CP		0DH
		JR		NZ,STLT2
		LD		A,00H
STLT2:	CALL	SNDBYTE           ;ページ指示を送信
		INC		DE
		DJNZ	STLT1
		POP		BC
DL1:
		PUSH	HL
		PUSH	BC
		LD		DE,LBUF
		LDIR
		EX		DE,HL
DL2:	CALL	RCVBYTE           ;'00H'を受信するまでを一行とする
		CP		00H
		JR		Z,DL3
		CP		0FFH              ;'0FFH'を受信したら終了
		JR		Z,DL4
		CP		0FEH              ;'0FEH'を受信したら一時停止して一文字入力待ち
		JR		Z,DL5
		LD		(HL),A
		INC		HL
		JR		DL2
DL3:
		LD		(HL),A
		LD		DE,LBUF           ;'00H'を受信したら一行分を表示して改行
		CALL	MSGPR
;		CALL	LETLN
		POP		BC
		POP		HL
		JR		DL1
DL4:	CALL	RCVBYTE           ;状態取得(00H=OK)
		POP		BC
		POP		HL
		JR		DLRET

DL5:	LD		DE,MSG_KEY1        ;HIT ANT KEY表示
		CALL	MSGPR

		LD		A,12H              ;上矢印文字を表示
		RST		18H
		DB		04H

		LD		DE,MSG_KEY2        ;HIT ANT KEY表示
		CALL	MSGPR
		CALL	LETLN
DL6:	CALL	GETKEY            ;1文字入力待ち
		CP		00H
		JR		Z,DL6
		CP		12H               ;カーソル↑で打ち切り
		JR		Z,DL9
		CP		42H               ;「B」で前ページ
		JR		Z,DL8

		CALL	BRKCHK
		JR		Z,DL7             ;SHIFT+BREAKで打ち切り

		LD		A,00H             ;それ以外で継続
		JR		DL8
DL9:
		LD		A,12H             ;カーソル↑で打ち切ったときにカーソル2行上へ
		RST		18H
		DB		03H
		LD		A,12H
		RST		18H
		DB		03H
DL7:	LD		A,0FFH            ;0FFH中断コードを送信
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

;******* 代替処理用コマンドコード送信 (IN:A コマンドコード) **********
MCMD:	PUSH	AF
		CALL	INIT
		POP		AF
		CALL	SNDBYTE    ;コマンドコード送信
		CALL	RCVBYTE    ;状態取得(00H=OK)
		RET

		END
