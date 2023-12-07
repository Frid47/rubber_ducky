$directoryPath = "$env:HOMEPATH\Desktop"

for ($i = 1; $i -le 50; $i++) {
    $fileName = "file$i.txt"
    $filePath = Join-Path -Path $directoryPath -ChildPath $fileName
    New-Item -ItemType File -Path $filePath -Force
}
