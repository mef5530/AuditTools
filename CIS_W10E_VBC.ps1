#Evalates CIS W10E VBC

$keys = @{
    "EnableVirtualizationBasedSecurity" = "1";
    "RequirePlatformSecurityFeatures" = "1";
    "HypervisorEnforcedCodeIntegrity" = "1";
    "HVCIMATRequired" = "1";
    "LsaCfgFlags" = "1";
    "ConfigureSystemGuardLaunch" = "1"
}

foreach ($key in $keys.Keys) {
    $value = (Get-ItemPropertyValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" $key -ErrorAction SilentlyContinue)
    if ($value -ne $keys[$key]) {
        Write-Output "$key is not set correctly. Expected value: $($keys[$key]). Actual value: $($value)"
    }
    else {
        Write-Output "$key is set correctly"
    }
}
