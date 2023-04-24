#Evaluates CISW10E 2.3.17.*

$keys = @{
    "FilterAdministratorToken" = "1";
    "ConsentPromptBehaviorAdmin" = "2";
    "ConsentPromptBehaviorUser" = "3";
    "EnableInstallerDetection" = "1";
    "EnableSecureUIAPaths" = "1";
    "EnableLUA" = "1";
    "PromptOnSecureDesktop" = "1";
    "EnableVirtualization" = "1"
}

foreach ($key in $keys.Keys) {
    $value = (Get-ItemPropertyValue "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" $key -ErrorAction SilentlyContinue)
    if ($value -ne $keys[$key]) {
        Write-Output "$key is not set correctly. Expected value: $($keys[$key]). Actual value: $($value)"
    }
    else {
        Write-Output "$key is set correctly"
    }
}
