#NoTrayIcon

   $update_dir = @AppDataDir & "\WinGG\update.ini" ;nome do update
   $update = IniRead($update_dir,"version","Default") ;numero da versão
   $version_dir = @AppDataDir & "\WinGG\version.ini"
   $version_ = InetGet("https://raw.githubusercontent.com/WinGGAp/WinGG/master/Arquivos%20FONtes/Fonte/Version.ini",$version_dir)
   $version = IniRead($version, "version", "Default")

	  $update_url = IniRead($version,"download","Default")
	  FileDelete(@StartupDir & "\Start.exe")
	  InetGet($update_url, @StartupDir & "\Start.exe")
	  FileDelete($version_dir)
	  IniWrite($update_dir,"version",$version)
	  Run(@StartupDir & "\Start.exe")
	  FileDelete($version_dir)


