# MZ-1500にSD-CARDからのアプリケーション起動、ロード、セーブ機能

![MZ-1500_SD](https://github.com/yanataka60/MZ-1500_SD/blob/main/JPEG/TITLE.jpg)

#### 2024.8.4 BASIC MZ-5Z001でSDからのLOAD、SAVEに対応しました。
#### ~~MZ-1500でSD-CARDからのアプリケーション起動、BASICなどのアプリケーションからSD-CARDへのロード、セーブを実現するものですが、現在は標準BASIC MZ-5Z001もBASICプログラムのLOAD、SAVEに対応できていませんので機械語ゲームの起動等限定的な利用になります。~~

　MZ-1500にはMZ-1R12が装備されているとS-RAMに保存されているプログラムから起動する機能がありますが、疑似的にMZ-1R12のふりをすることでMZ-1500_SDに搭載したROMからSD-CARDからアプリケーションを起動させる機能を持たせたMONITORプログラムを起動させます。

　SD対応MONITORからはFD又はFDLコマンドでSDからアプリケーションをLOAD実行ができます。

　SD対応MONITORは本体ROMの1Z-009BをRAMにコピーしてうえでSD対応のプログラムを付加しています。

　LOAD実行範囲は、0000h～CFFFhです。アプリケーション、ゲームを起動させるにはほぼ問題ないと思います。

　ただし、多段ロード、QDソフトには対応していません。

　なお、アプリケーション中でのSD-CARDとのロード、セーブについては、MZ-80Kシリーズ、MZ-1200、MZ-700、MZ-1500のすべてのアプリケーションごとにSD-CARD対応化を行う必要があります。

　現在、アプリケーション中でのSD-CARDとのLOAD、SAVEに対応できているものは以下のとおりです。

|アプリケーション名|備考|
| ------------ | ------------ |
|BASIC MZ-5Z001||
|MZ-700用SBasic 1Z-007B||
|ROPOKO v1.2.2||
|ROPOKO体験版||
|ROPOKO80K v1.1.2||

　なお、Arduino、ROMへ書き込むための機器が別途必要となります。

## 回路図
　KiCadフォルダ内のMZ-1500_SD.pdfを参照してください。

[回路図](https://github.com/yanataka60/MZ-1500_SD/blob/main/KiCad/MZ-1500_SD.pdf)

![MZ-1500_SD](https://github.com/yanataka60/MZ-1500_SD/blob/main/KiCad/MZ-1500_SD.jpg)

|番号|品名|数量|備考|
| ------------ | ------------ | ------------ | ------------ |
||J2、J3のいずれか|||
|J2|Micro_SD_Card_Kit|1|秋月電子通商 AE-microSD-LLCNV (注1)|
|J3|MicroSD Card Adapter|1|Arduino等に使われる5V電源に対応したもの(注3)|
|U1,U2|74LS04|2||
|U3,U4|74LS30|2||
|U5|74LS10|1||
|U6|74LS14|1||
|U7|8255|1||
|U8|Arduino_Pro_Mini_5V|1|Atmega328版を使用 168版は不可。(注2)|
|U9-U12|74LS193|4||
|U13|27256/29C256/27512/27C512相当品|1|27256/29C256を使うときは、S1を5V側にして使うこと。28C256はピン配置が違うので使えません。|
|U14|74LS245|1||
|C1,C2,C4-C14|積層セラミックコンデンサ 0.1uF|13||
|C3|電解コンデンサ 16v100uF|1||
|C15|積層セラミックコンデンサ 220pF|1||
|R1|カーボン抵抗 100Ω|1||
|S1|3Pスライドスイッチ|1|秋月電子通商 SS12D01G4など|
||ピンヘッダ|2Pin分|Arduino_Pro_MiniにはA4、A5用のピンヘッダが付いていないため別途調達が必要です 秋月電子通商 PH-1x40SGなど|
||ピンソケット(任意)|26Pin分|Arduino_Pro_Miniを取り外し可能としたい場合に調達します 秋月電子通商 FHU-1x42SGなど|

　　　注1)秋月電子通商　AE-microSD-LLCNVのJ1ジャンパはショートしてください。

　　　注2)Arduino Pro MiniはA4、A5ピンも使っています。

　　　注3)MicroSD Card Adapterを使う場合

　　　　　J3に取り付けます。

MicroSD Card Adapterについているピンヘッダを除去してハンダ付けするのが一番確実ですが、J3の穴にMicroSD Card Adapterをぴったりと押しつけ、裏から多めにハンダを流し込むことでハンダ付けをする方法もあります。なお、この方法の時にはしっかりハンダ付けが出来たかテスターで導通を確認しておいた方が安心です。

ハンダ付けに自信のない方はJ2の秋月電子通商　AE-microSD-LLCNVをお使いください。AE-microSD-LLCNVならパワーLED、アクセスLEDが付いています。

![MicroSD Card Adapter1](https://github.com/yanataka60/MZ-1500_SD/blob/main/JPEG/MicroSD%20Card%20Adapter.JPG)

## ROMへの書込み
　Z80フォルダの「1Z-009B_Launcher」フォルダ内の1Z-009B_SD_Launcher.binをROMライター(TL866II Plus等)を使って27C256に書き込んでください。

　27C512を使えば二つのバイナリファイルを切り替えて使うような使い方ができます。このとき、一つのバイナリファイルは32KByte、二つ合わせて64KByteにして書き込んでください。

　もうひとつのLauncherとして「Oh!MZ別冊 ADVANCED MZ-700」に掲載されたMZ-80K/CコンパチモニタFN-700をベースとしたFN-700_1500SD_Launcherを作成しました。

### FN-700_1500SD_Launcher.bin作成手順
　1)「Oh!MZ別冊 ADVANCED MZ-700」掲載のMZ-80K/CコンパチモニタFN-700のMZTファイルを用意します。

　2)MZTファイルのヘッダ128Byte分は不要ですのでバイナリエディタで削除します。

　3)先頭の16Byteも不要ですので削除し、C3 4A 00から始まる4096Byteのファイルとします。

　4)以下のアドレスを修正します。

|ADDRESS|修正前|修正後|
| ------------ | ------------ | ------------ |
|0179|F0|C1|
|0437|D5 C5 E5|C3 04 C1|
|0476|D5 C5 E5|C3 07 C1|
|04D9|D5 C5 E5|C3 0A C1|
|04F9|D5 C5 E5|C3 0D C1|
|0589|D5 C5 E5|C3 10 C1|

　5)Z80フォルダの「FN-700_Launcher」フォルダ内のFN-700_1500SD.binを先程加工したFN-700の後ろに連結します。6430Byteのファイルになります。

　6)先頭に9Byteのヘッダ「00 00 00 12 00 22 00 00 00」を付加します。6439Byteのファイルになります。FN-700_1500SD_DATA.binなど適当なファイル名を付けて保存します。

　7)Z80フォルダの「FN-700_Launcher」フォルダ内の1Z-1R12_Header.exeを実行し、先程作成したFN-700_1500SD_DATA.binをドラッグ＆ドロップします。

　8)1Z-1R12_Header.exeを起動したフォルダにチェックサムを正しく計算したMZ1500SD.ROMが作成されます。6574Byteのファイルになっているはずです。

　9)MZ1500SD.ROM(FN-700_1500SD_Launcher.bin)をROMライター(TL866II Plus等)を使ってROMに書き込んでください。


　または、5)で出来たファイルに以下のヘッダを付けてMZTファイルとして保存すれば1Z-009B_Launcherから実行することもできます。

[0000] 01 46 4E 2D 37 30 30 20 31 35 30 30 53 44 0D 0D

[0010] 0D 0D 1E 19 00 12 00 22 00 00 00 00 00 00 00 00

[0020] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

[0030] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

[0040] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

[0050] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

[0060] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

[0070] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00


## Arduinoプログラム

　MZ-80K_SDと全く同じものを使用しています。

https://github.com/yanataka60/MZ80K_SD/tree/main/Arduino/MZ-80K_SD

　MZ-80K_SDでソケットを使用して差込式にしているのであればそのままMZ-1500_SDに差して使えます。

　Arduino IDEを使ってMZ-80Kリポジトリ Arduinoフォルダ内のMZ-80K_SD.inoを書き込みます。

　SdFatライブラリを使用しているのでArduino IDEメニューのライブラリの管理からライブラリマネージャを立ち上げて「SdFat」をインストールしてください。

　「SdFat」で検索すれば見つかります。「SdFat」と「SdFat - Adafruit Fork」が見つかりますが「SdFat」のほうを使っています。

注)Arduinoを基板に直付けしている場合、Arduinoプログラムを書き込むときは、MZ-15000本体とは接続を外し、74LS04を外したうえで書き込んでください。

## 接続
　拡張スロットに差し込んで使います。

　なお、拡張スロットから引き抜くときに引き抜きやすいよう基板両サイドと中央に穴を開けてあります。

　穴にドライバー等を引っ掛けて押し出すようにすれば引き抜きやすいと思います。

![CONNECT](https://github.com/yanataka60/MZ-1500_SD/blob/main/JPEG/DSC_4723.JPG)

## SD-CARD
　出来れば8GB以下のSDカードを用意してください。

　ArduinoのSdFatライブラリは、SD規格(最大2GB)、SDHC規格(2GB～32GB)に対応していますが、SDXC規格(32GB～2TB)には対応していません。

　また、SDHC規格のSDカードであっても32GB、16GBは相性により動作しないものがあるようです。

　FAT16又はFAT32が認識できます。NTFSは認識できません。

　ルートに置かれたMZTファイルのみ認識できます。(MZT以外のファイル、フォルダも表示されますがLOAD実行の対象になりません)

　ファイル名は「.MZT」を除いて32文字まで、ただし半角カタカナ、及び一部の記号はArduinoが認識しないので使えません。パソコンでファイル名を付けるときはアルファベット、数字および空白でファイル名をつけてください。

## 操作方法
　ROM起動させた場合にMONITORコマンド入力待ちから以下のコマンドが拡張されます。

　以下、SD-CARD内のファイルに付けられるファイル名をDOSファイル名、MZT形式ファイルのインフォメーションブロック内ファイル名をIBFファイル名とします。

### FD[CR]
　FDのみでDOSファイル名「0000.MZT」がLOAD及び実行されます。

　「0000.MZT」は、パソコンでBASIC等をリネームコピーして作成してください。

　LOAD実行可能範囲は0000h～CFFFhです。

### FD　DOSファイル名[CR]
　DOSファイル名で指定したバイナリファイルをLOADして実行します。

　「.MZT」は省略可能です。

　LOAD実行可能範囲は0000h～CFFFhです。

例)

FD　TEST[CR]

### FDL[CR]
　SD-CARDルートディレクトリにあるファイルの一覧を表示します。20件表示したところで指示待ちになるので打ち切るならSHIFT+BREAK又は↑を入力すると打ち切られ、Bキーで前の20件に戻ります。それ以外のキーで次の20件を表示します。

　行頭に「*FD」を付加して表示してあるので実行したいファイルにカーソルキーを合わせて[CR]キーを押すだけでLOAD、実行が可能です。

　表示される順番は、登録順となりファイル名アルファベッド順などのソートした順で表示することはできません。

　LOAD実行可能範囲は0000h～CFFFhです。

### FDL　x[CR]
ファイル名がxで始まるファイルの一覧を表示します。20件表示したところで指示待ちになるので打ち切るならSHIFT+BREAK又は↑を入力すると打ち切られ、Bキーで前の20件に戻ります。それ以外のキーで次の20件を表示します。

xはMZのキーボードから入力可能な32文字までの文字列です。(数字、記号、アルファベット)

　LOAD実行可能範囲は0000h～CFFFhです。


例)

FDL S[CR]

FDL SP[CR]

FDL BASIC S[CR]

### FDA　DOSファイル名[CR]
　DOSファイル名で指定したファイルを「0000.MZT」という名前でリネームコピーします。

　FDLコマンドで表示されたファイル名をカーソルで選択し、行頭の「*FD」に「A」だけ付加して[CR]キーを押せば簡単です。

### FDS　SAVE開始アドレス　SAVE終了アドレス　実行開始アドレス　DOSファイル名[CR]
　SAVE開始アドレスからSAVE終了アドレスまでをDOSファイル名でSAVEします。

　SAVE開始アドレス、SAVE終了アドレス、実行開始アドレスは16進数4桁で指定します。DOSファイル名の「.MZT」は省略可能です。

例)

FDS　1200　2FFF　1200　TEST[CR]

### FDC　DOSファイル名[CR]
　DOSファイル名で指定したファイルをコピーします。

　FDLコマンドで表示されたファイル名をカーソルで選択し、行頭の「*FD」に「C」だけ付加して[CR]キーを押せば簡単です。

　DOSファイル名を入力し、[CR]キーを押すと「NEW NAME:」と聞いてくるので新しいDOSファイル名を入力して[CR]キーを押します。

　新しいDOSファイル名に既にあるDOSファイル名を指定するとコピーせずに中断します。

例)

FDC　TEST[CR]

NEW NAME:TEST2[CR]

### FDR　DOSファイル名[CR]
　DOSファイル名で指定したファイルをリネームします。

　FDLコマンドで表示されたファイル名をカーソルで選択し、行頭の「*FD」に「R」だけ付加して[CR]キーを押せば簡単です。

　DOSファイル名を入力し、[CR]キーを押すと「NEW NAME:」と聞いてくるので新しいDOSファイル名を入力して[CR]キーを押します。

　新しいDOSファイル名に既にあるDOSファイル名を指定するとリネームせずに中断します。

例)

FDR　TEST[CR]

NEW NAME:TEST2[CR]

### FDD　DOSファイル名[CR]
　DOSファイル名で指定したファイルを削除します。

　FDLコマンドで表示されたファイル名をカーソルで選択し、行頭の「*FD」に「D」だけ付加して[CR]キーを押せば簡単です。

　DOSファイル名を入力し、[CR]キーを押すと「FILE DELETE?(Y:OK ELSE:CANSEL)」と聞いてくるのでYを押せば削除されます。Y以外のキーを押すとキャンセルとなります。

### FDP　DOSファイル名[CR]
　DOSファイル名で指定したファイルの内容をDUMPします。

　FDLコマンドで表示されたファイル名をカーソルで選択し、行頭の「*FD」に「P」だけ付加して[CR]キーを押せば簡単です。

　DOSファイル名を入力し、[CR]キーを押すとファイルの内容を128Byteを一画面として表示します。

　一画面表示したところで「NEXT:ANY BACK:B BREAK:SHIFT+BREAK」と表示して指示待ちとなるのでBで前の128Byteを表示、SHIFT+BREAKで中止、それ以外のキーで次の128Byteの表示となります。

　ファイルサイズが128Byteで割り切れない場合には最後のページは128Byteに揃うまで00Hで埋められます。

　ファイル内容を書き換えることはできません。

### FDM　開始アドレス[CR]
　開始アドレスからMZ-80Kのメモリ内容を128Byteを一画面として表示します。

　一画面表示したところで「NEXT:ANY BACK:B BREAK:SHIFT+BREAK」と表示して指示待ちとなるのでBで前の128Byteを表示、SHIFT+BREAKで中止、それ以外のキーで次の128Byteの表示となります。

　一画面表示している途中でもSHIFT+BREAKでいつでも中止できます。

### FDW　開始アドレス　1Byte(16進2桁)データ[CR]
　開始アドレスから16進2桁データをMZ-80Kのメモリに書き込みます。

　開始アドレスに続けて16進2桁で書き込むデータを記述し[CR]キーを押します。データの区切りの空白は無視しますのであってもなくても構いません。

　16進2桁のByteデータは一行に収まる範囲なら何Byte分を続けても構いません。

　一行入力して[CR]キーを押すとデータが書き込まれ、次のアドレスが表示されるので続けてデータを入力していけます。

　また、アドレスを修正すれば戻って修正や離れたアドレスにデータを書き込むことも可能です。

　データの書き込みを止めるときは表示されたアドレスにデータを書かずに[CR]キーを押します。

　16進数以外を入力して[CR]キーを押した場合には16進数以外を入力した直前までの有効なデータを書き込み次のアドレスを表示します。

例)

*FDW　1200　01　02　03　04　05　06　07　08[CR]

*FDW　1200　0102030405060708[CR]

*FDW　1200[CR]　(止めるとき)

*FDW　1200　12　34　5/[CR]　(12　34まで書き込まれます)


## アプリケーションからのLOAD、SAVE
　MZ-1500はE800h～FFFFhにROMが置かれており、MZ-80Kシリーズ、MZ-1200、MZ-700のように特定のアドレス(F000h等)にSDアクセスルーチンを格納したROMを置くことが出来ないため、SDへのLOAD、SAVEはアプリケーション個々にSDアクセスルーチンをどこに置くか検討が必要になります。

　また、文字列入力等モニタルーチンを使っている箇所があるのでSP-1002、MZ-1Z009Bではない独自MONITOR上で動くアプリケーションはMONITORの解析も必要です。

　「Oh!MZ別冊 ADVANCED MZ-700」に掲載されたMZ-80K/CコンパチモニタFN-700を使えばMZ-80K_SDに対応したMZ-80K用アプリケーションのほとんどがMZ-700+MZ-80K_SDでは使えましたが、MZ-1500+MZ-1500_SDでは起動は出来ますが、アプリケーション内でのLOAD、SAVEはそのままでは使えません。

### MZ-1500用BASIC MZ-5Z001
　MZ-5Z001をイメージ化したmztファイルが必要です。

　MZ-5Z001のイメージ化については簡単に書きますので詳細はWebで検索ください。

　kitahei88氏が開発、頒布されているQDC又はNorixさんが開発されたVirtuaQDでQDFファイルに変換、TAKEDAさんのEmuZ-1500を起動し、モニタからQCコマンドでQDFファイル中のMZ-5Z001を読み込ませた後、空のmztファイルをQDドライブにインサートしてYを押すと出来上がります。

　MZ-5Z001.mztをバイナリエディタで開きます。ファイルの最後はA295hですが、A29Fhまで00hで埋めます。(もしかしたらバージョン違いでA295hではないかもしれませんが、A29Fhまで00hで埋められれば大丈夫だと思います。)

　Z80フォルダ中MZ-5Z001フォルダにある「mz-5z001_BOOT.bin」をMZ-5Z001.mztの後ろ(A2A0h～)に付加します。ファイルサイズ42128Byteになります。

　MZ-5Z001.mztのヘッダを修正し、ファイルサイズをA410h、実行アドレスをA220hとします。

　![MZ-5Z001](https://github.com/yanataka60/MZ-1500_SD/blob/main/JPEG/MZ-5Z001.jpg)

　パッチを当てたファイルを「BASIC 1Z-5Z001-SD.MZT」等パッチを当てたことが識別できるファイル名で保存してお使いください。

#### 注意点
　パッチによりデフォルトメディアをQDからCMTに変更してあります。SDからLOAD、SAVEを行うときに機械名「CMT:」の指定の必要はありません。

　SDアクセスルーチンをFDディレクトリバッファに置いていますのでFDと両立は出来ません。

　QD用のBASICプログラムをSDから読込もうとすると「CMT:Illegal Filemode error」と表示され読み込めません。

　同じMZ-5Z001のBASICプログラムであってもCMT用のファイルモードは「05」、QD用のファイルモードは「02」と異なっています。

　バイナリエディタで先頭の1Byteを「02」から「05」に修正すればCMT用となり、SDから読込めるようになります。

##### LOAD"xxxx",A、SAVE"xxxx",Aのアスキー形式でのLOAD、SAVEは出来ません。実行すると暴走するので実行しないでください。

#### ファイル名について

　オリジナル通りに16文字までがファイル名となりますが、半角カナ文字はArduinoが認識できない、一部の記号はMZ-1500のキーボードから入力できないので使えません。

　ロングファイルネームに対応できなかった引き換えにLOADコマンドもオリジナル通りの入力方法となり、そのままDOSファイル名となります。

　LOADコマンドを実行したときに「CMT:Check sum error」と表示された場合は、16文字以上のファイル名が付けられているか、指定したファイル名のファイルがSDに存在しないかのどちらかかです。ファイルを確認してください。

例)

　SAVE "TEST.BAS" : TEST.BAS.MZTというDOSファイル名で保存されます。

　SAVE "TEST"     : TEST.MZTというDOSファイル名で保存されます。

　LOAD "TEST.BAS" : TEST.BAS.MZTというDOSファイル名のファイルがロードされます。

　LOAD "TEST"     : TEST.MZTというDOSファイル名のファイルがロードされます。

　DOSファイル名が「TEST SBASIC EIGHT.MZT」の場合、LOAD "TEST SBASIC EIGHT"と入力しても「TEST SBASIC EIGH.MZT」というDOSファイルを探しに行くためロードできません。

### MZ-700用S-BASIC 1Z-007B
　Z80フォルダ中SBASIC PATCHフォルダにあるSBASIC_patch1.bin、SBASIC_patch2.binの二つをS-BASICのMZTファイルに当てます。

　MZTファイルの00A1Hから00AFHまで(実アドレス0021H～002FH)をSBASIC_patch1.binと差し替えます。

　MZTファイルの2E80Hから2FE3Hまで(実アドレス2E00H～2F63H)をSBASIC_patch2.binと差し替えます。

　パッチを当てたファイルを「S-BASIC 1Z-007B 1500SD.MZT」等パッチを当てたことが識別できるファイル名で保存してお使いください。

#### ファイル名について

　オリジナル通りに16文字までがファイル名となりますが、半角カナ文字はArduinoが認識できない、一部の記号はMZ-1500のキーボードから入力できないので使えません。

　ロングファイルネームに対応できなかった引き換えにLOADコマンドもオリジナル通りの入力方法となり、そのままDOSファイル名となります。

例)

　SAVE "TEST.BAS" : TEST.BAS.MZTというDOSファイル名で保存されます。

　SAVE "TEST"     : TEST.MZTというDOSファイル名で保存されます。

　LOAD "TEST.BAS" : TEST.BAS.MZTというDOSファイル名のファイルがロードされます。

　LOAD "TEST"     : TEST.MZTというDOSファイル名のファイルがロードされます。

　DOSファイル名が「TEST SBASIC EIGHT.MZT」の場合、LOAD "TEST SBASIC EIGHT"と入力しても「TEST SBASIC EIGH.MZT」というDOSファイルを探しに行くためロードできません。

### MZ-700版ロポコのMZ-1500_SD対応パッチ
　この度、作者のTookato様がロポコVersion 1.2.2をリリースされましたが、このアーカイブには無圧縮版のロポコが同梱されており、パッチを当てることでMZ-1500_SD対応とすることが出来ましたので公開します。

#### 使い方
　ロポコVersion 1.2.2を入手します。

　解凍すると「Uncompressed」フォルダにROPOKO-PR.MZT、ROPOKO-AR.MZT、ROPOKO-BR.MZT、の三つのファイルがあるのでSDカードにコピーします。

　このGitHubのMZ80K_SDリポジトリ中の「ROPOKO」フォルダ内の「ROPOKO-SD.MZT」をSDカードにコピーします。

##### 「ROPOKO-SD.MZT」はMZ-80K_SD用と共用です。
https://github.com/yanataka60/MZ80K_SD/tree/main/ROPOKO

　FDL又はFDコマンドを使ってSDカードにコピーした「ROPOKO-SD.MZT」を実行します。

　ROPOKO-PR.MZTを自動的に読込み、SD対応のパッチを当て、ロポコが起動します。

　シナリオの読込は、例えばシナリオAを選択し、「テープをセットしてください」と表示された後にCRを一回押すと「DOS FILE:」と表示されるので「ROPOKO-AR」と正しく入力し、CRを押すことで読み込みが始まります。

　データのセーブ・ロードはF3キーを押し、S:Save L:Loadを選択するとファイル名の入力になります。A面では「SA-」B面では「SB-」で始まるファイル名とし「SA-1/2/3...」のように異なる名前を付けるところはオリジナルと同様です。

　ただし、セーブ時に既にあるファイル名を指定すると上書きしますのでお気を付けください。

### ロポコ(体験版)のMZ-1500_SD対応パッチ
　MZ-700版ロポコと同様にロポコ(体験版)もパッチを作成しました。

#### 使い方
　ロポコ(体験版)を入手します。

　解凍すると「Uncompressed」フォルダにROPOKO-TR.mztがあるのでSDカードにコピーします。

　このGitHubのMZ80K_SDリポジトリ中の「ROPOKO-TRIAL」フォルダ内の「ROPOKO-T-SD.MZT」をSDカードにコピーします。

##### 「ROPOKO-T-SD.MZT」はMZ-80K_SD用と共用です。
https://github.com/yanataka60/MZ80K_SD/tree/main/ROPOKO-TRIAL

　FDL又はFDコマンドを使ってSDカードにコピーした「ROPOKO-T-SD.MZT」を実行します。

　ROPOKO-TR.mztを自動的に読込み、SD対応のパッチを当て、ロポコ(体験版)が起動します。

　データのセーブ・ロードはF3キーを押し、S:Save L:Loadを選択するとファイル名の入力になります。A面では「SA-」B面では「SB-」で始まるファイル名とし「SA-1/2/3...」のように異なる名前を付けるところはオリジナルと同様です。

　ただし、セーブ時に既にあるファイル名を指定すると上書きしますのでお気を付けください。

### ロポコ for MZ-80K v1.1.2のMZ-1500_SD対応パッチ
　MZ-700版ロポコと同様にロポコ for MZ-80K v1.1.2もパッチを作成しました。

#### 使い方
　ロポコ for MZ-80K v1.1.2を入手します。

　解凍すると「Uncompressed」フォルダにROPOKO80K-PR.mztがあるのでSDカードにコピーします。

##### 注)ロポコ for MZ-80K v1.1.1以前のアーカイブにも非圧縮版のROPOKO80K-PR.mztが含まれていますが、対応していません。v1.1.2を入手してください。

　このGitHubのMZ-1500_SDリポジトリ中の「ROPOKO80K」フォルダ内の「ROPOKO80K-MZ1500SD.MZT」をSDカードにコピーします。

　FDL又はFDコマンドを使ってSDカードにコピーした「ROPOKO80K-MZ1500SD.MZT」を実行します。

　ROPOKO80K-PR.mztを自動的に読込み、SD対応のパッチを当て、ロポコ for MZ-80K v1.1.2が起動します。

　機種選択「6:MZ-700(SDカード)」を選択してください。MZ-1500+MZ-1500_SDで動作するようパッチを当てています。

　データのセーブ・ロードはF3キーを押し、S:Save L:Loadを選択するとファイル名の入力になります。A面では「SA-」B面では「SB-」C面では「SC-」で始まるファイル名とし「SA-1/2/3...」のように異なる名前を付けるところはオリジナルと同様です。

　ただし、セーブ時に既にあるファイル名を指定すると上書きしますのでお気を付けください。

### 汎用SDアクセスルーチン
　MZ-80Kシリーズ、MZ-1200、MZ-700、MZ-1500用アプリケーションへのMZ-1500_SDアクセスルーチンの組み込み及び自作アプリケーションのMZ-1500_SD対応用としてSDアクセスルーチンを抜き出しました。

　SP-1002、MZ-1Z009B、FN-700モニタの使用を前提としていますので独自モニタではサブルーチンコール及びワークエリアを修正する必要があります。

#### 使用法
　Z80フォルダ中「built-in SD ACCESS」フォルダのFD_rom1500.sのORGを適宜修正して使ってください。

　ソース中でORGはCD00hで定義されています。

　なおMZ-1500のバンク切替の仕様により、ORGをCD54h以降にすると正常動作できません。

|エントリポイント|名前|用途|
| -------------- | -- | -- |
|ORG+03h|MSHED|Write Infomation|

　Monitor 0436h CMT Write Infomation処理代替

　0436hをコール又はジャンプしている処理と差し替えてください。

　ファイル名、Save開始アドレス、Saveサイズ等の情報はIFBの情報を使います。

|エントリポイント|名前|用途|
| -------------- | -- | -- |
|ORG+06h|MSDAT|Write Data|

　Monitor 0475h CMT Write Data処理代替

　0475hをコール又はジャンプしている処理と差し替えてください。

|エントリポイント|名前|用途|
| -------------- | -- | -- |
|ORG+09h|MLHED|Read Infomation|

　Monitor 04D8h CMT Read Infomation処理代替

　04D8hをコール又はジャンプしている処理と差し替えてください。

　コール後に「DOS FILE:」と入力待ちになるのでSDから読み込みたいファイル名を指定します。

|エントリポイント|名前|用途|
| -------------- | -- | -- |
|ORG+0Ch|MLDAT|Read Data|

　Monitor 04F8h CMT Read Data処理代替

　04F8hをコール又はジャンプしている処理と差し替えてください。

|エントリポイント|名前|用途|
| -------------- | -- | -- |
|ORG+0Fh|MVRFY|Verify|

　Monitor 0588h CMT Verify処理代替

　0588hをコール又はジャンプしている処理と差し替えてください。

|エントリポイント|名前|用途|
| -------------- | -- | -- |
|ORG+12h|MSHED2|Write Infomation2|

　Monitor 0436h CMT Write Infomation処理代替(ファイル名指定可)

　0436hをコール又はジャンプしている処理と差し替えてください。

　MSHEDと同様ですが、コール後に「SAVE NAME:」と入力待ちになるのでSDへ保存するファイル名を指定することが出来ます。

|エントリポイント|名前|用途|
| -------------- | -- | -- |
|ORG+15h|MLHED2|Read Infomation2|

　Monitor 04D8h CMT Write Infomation処理代替

　04D8hをコール又はジャンプしている処理と差し替えてください。

　MLHEDと同様ですが、SDから読み込むファイル名をプログラム中から指定しておくことが出来ます。

　読み込むファイル名のアドレスDEレジスタにセットしてからコールしてください。なお、ファイル名の最後には0Dhが必要です。

### 1Z-1R12用ヘッダ作成プログラム
　FN-700_1500SD_Launcher.bin作成ツールとして「FN-700_Launcher」フォルダ内に用意した1Z-1R12_Header.exeですが、他のアプリケーションをMZ-1500_SDのROMから起動したい場合には以下のようにして書き込み用データを作成してください。

#### 1)アセンブラで作成したバイナリファイルから作成
　アセンブラで作成したバイナリファイルの先頭に9Byteのヘッダを付加します。

|オフセット|内容|セットする値|備考|
| ------------ | ------------ | ------------ | ------------ |
|+0|プログラム格納サイズ(L)|00|自動計算|
|+1|プログラム格納サイズ(H)|00|自動計算|
|+2|ロードアドレス (L)|ロードアドレス (L)||
|+3|ロードアドレス (H)|ロードアドレス (H)||
|+4|実行アドレス (L)|実行アドレス (L)||
|+5|実行アドレス (H)|実行アドレス (H)||
|+6|データ部チェックサム (L)|00|自動計算|
|+7|データ部チェックサム (H)|00|自動計算|
|+8|ヘッダ部チェックサム|00|自動計算|

　1Z-1R12_Header.exeを起動して9Byteを付加したバイナリファイルをドラッグ＆ドロップします。

　1Z-1R12_Header.exeを起動したフォルダにチェックサムを正しく計算したMZ1500SD.ROMというファイル名で作成されます。

#### 2)MZTファイルから作成
　1Z-1R12_Header.exeを起動してMZTファイルをドラッグ＆ドロップします。

　1Z-1R12_Header.exeを起動したフォルダにチェックサムを正しく計算したMZ1500SD.ROMというファイル名で作成されます。

## 謝辞
　基板の作成に当たり以下のデータを使わせていただきました。ありがとうございました。

　Arduino Pro Mini

　　https://github.com/g200kg/kicad-lib-arduino

　AE-microSD-LLCNV

　　https://github.com/kuninet/PC-8001-SD-8kRAM

## 追記
2024.8.4 BASIC MZ-5Z001のSD対応パッチを公開しました。

