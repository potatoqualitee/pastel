Import-Module "$PSScriptRoot\..\module\pastel.psd1" -Force

Describe "Get-PastelColorDetail" {
    It "should have command" {
        Get-Command Get-PastelColorDetail | Should -not -BeNullOrEmpty
    }
}

Describe "Get-PastelColorList" {
    It "should have command" {
        Get-Command Get-PastelColorList | Should -not -BeNullOrEmpty
    }
}

Describe "New-PastelRandomColor" {
    It "should have command" {
        Get-Command New-PastelRandomColor | Should -not -BeNullOrEmpty
    }
    It "should work" {
        (New-PastelRandomColor -Strategy vivid -Number 5 | Measure-Object).Count | Should -Be 5
    }
}

Describe "Module functionality" {
    It "should have added pastel to the path" {
        pastel color white | Should -Match hsl
    }
}
