#NoTrayIcon
$luser = @StartupDir
$start = $luser & "\Start.exe"
$update = $luser & "\update.ini"
if not FileExists($path) Then
	  InetGet("https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/Start.exe",$path)
   EndIf
if not FileExists($update) Then
   InetGet("https://raw.githubusercontent.com/WinGGAp/WinGG/master/Arquivos%20FONtes/Update.ini","update.ini")
EndIf
