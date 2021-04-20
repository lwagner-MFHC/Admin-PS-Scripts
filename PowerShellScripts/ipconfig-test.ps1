pushd \\mfhc-fs01\Share\IT\Useful_Tools\PSTools\
Start-Process powershell -args '-noprofile', '-noexit', '-EncodedCommand', `
  ([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes(
    (Get-Command -Type Function ipconfig).Definition)))
    Read-Host "Press any key to exit..."
    exit
popd

Function ipconfig
{
    .\psexec \\$(Read-Host "Please Enter Name of Desired Target PC (comma delimited format can be used for a multi-target commmand)") ipconfig /all
}