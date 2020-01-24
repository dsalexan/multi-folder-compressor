$Files = Get-Content ./list.txt
for ($i = 0; $i -lt $Files.length; $i++) {
    $Names = $Files[$i].split("/")
    $Name = $Names[$Names.length - 1]
    $File = $Files[$i]

    $Target = "'./$i-$Name.zip'"
    $Path = "'$File'"

    powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory($Path, $Target); }"
}

