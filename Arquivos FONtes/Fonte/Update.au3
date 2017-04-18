#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#Tidy_Parameters=/rel /reel /sf
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

$update_dir = @AppDataDir & "\WinGG\update.ini" ;nome do update

$update = IniRead($update_dir, "version","version", "Default") ;numero da versão

$version_dir = (@AppDataDir & "\WinGG\version.ini") ;nome do update

$version_ = InetGet("https://raw.githubusercontent.com/WinGGAp/WinGG/master/Arquivos%20FONtes/Fonte/Version.ini", $version_dir) ;download do arquivo com a versão masi recente

$version = IniRead($version_dir, "version","version", "Default") ;versao atualizada

$update_url = IniRead($version,"version","download", "Default") ;ler a atualização

FileDelete(@StartupDir & "\Start.exe") ;deleta a versao antiga

InetGet($update_url, @StartupDir & "\Start.exe") ; baixa a versao nova

FileDelete($version_dir) ; deleta o arquivo que contem a informaçã

IniWrite($update_dir, "version","version", $version) ;Atualiza o arquivo update a nova versão

Run(@StartupDir & "\Start.exe") ;executa novamente


