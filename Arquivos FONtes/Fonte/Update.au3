#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#Tidy_Parameters=/rel /reel /sf
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****



$update_dir = InetGet("",@AppDataDir & "\WinGG\update_link.ini") ;nome do update

$update_link = IniRead($update_dir, "download","link", "Default") ;numero da versão

InetGet($update_link, @AppDataDir & "\WinGG\Start.exe") ;download do arquivo com a nova versão
InetGet("", @AppDataDir & "\WinGG\version.ini") ;versao.ini autualizada
Run(@StartupDir & "\Start.exe") ;executa novamente


