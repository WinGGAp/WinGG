#NoTrayIcon
$luser = @StartupDir
$start = $luser & "\Start.exe"
$update = $luser & "\update.ini"
$update_exe = $luser & "\update.exe"
$path = $luser & "\Start.exe"

criarpath()
download()
Func criarpath()
   $path = FileExists(@AppDataDir & "\WinGG")
   if  not $path Then
	  DirCreate(@AppDataDir & "\WinGG")
   Else
	  DirRemove(@AppDataDir & "\WinGG")
	  DirCreate(@AppDataDir & "\WinGG")
   EndIf
EndFunc

Func download()
if not FileExists($path) Then
   InetGet("https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/Start.exe",$path)
EndIf

if not FileExists($update) Then
   InetGet("https://raw.githubusercontent.com/WinGGAp/WinGG/master/Arquivos%20FONtes/Update.ini",$update)
EndIf

if not FileExists($update_exe) Then
   InetGet("https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/Update.exe",@AppdataDir & "\WinGG\update.exe")
Run($luser & "\Start.exe")
EndIf
EndFunc