$Folders = Get-ChildItem 'test' -Directory
for ($i = 0; $i -lt $Folders.length; $i++) {
    $FullName = $Folders[$i].FullName
    $Name = $Folders[$i].Name

    $Target = "'./$Name.epub'"
    $Path = "'$FullName'"

    powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory($Path, $Target); }"
}

