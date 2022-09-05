Import-Module "$PSScriptRoot\..\module\pastel.psd1" -Force

Describe "Get-PastelColorInfo" {
    It "should have command" {
        Get-Command Get-PastelColorInfo | Should -not -BeNullOrEmpty
    }
}

Describe "Module functionality" {
    It "should have added pastel to the path" {
        pastel color white | Should -Match hsl
    }
}
