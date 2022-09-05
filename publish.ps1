Rename-Item "$PSScriptRoot\module" -NewName "pastel" 
Publish-Module -Path "$PSScriptRoot\pastel" -NuGetApiKey $Env:NUGETAPIKEY