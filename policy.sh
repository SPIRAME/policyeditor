#!/bin/bash

# Root check
if [ $(id -u) -ne 0 ]; then
    echo "Please run this script as root. You can do so by using 'sudo su'."
    exit
fi

echo "+##############################################+"
echo "| Policy Test Tool                            |"
echo "| -------------------------------------------- |"
echo "| Generates user policy configuration         |"
echo "+##############################################+"

sleep 1

read -p "Enter your email: " email

mkdir -p /usr/local/share/policy-test-tool/

cat > /usr/local/share/policy-test-tool/policies.json << EOF
{
  "policy_user": "$email",
  "managed_users": ["*"],
  "use_universal_signing_keys": true,
  "user": {
    "URLBlocklist": [],
    "EditBookmarksEnabled": true,
    "ChromeOsMultiProfileUserBehavior": "unrestricted",
    "DeveloperToolsAvailability": 1,
    "DefaultPopupsSetting": 1,
    "AllowDeletingBrowserHistory": true,
    "AllowDinosaurEasterEgg": true,
    "IncognitoModeAvailability": 0,
    "AllowScreenLock": true,
    "PasswordManagerEnabled": true,
    "TaskManagerEndProcessEnabled": true,
    "ForceGoogleSafeSearch": false,
    "ForceYouTubeRestrict": 0,
    "EasyUnlockAllowed": true,
    "DisableSafeBrowsingProceedAnyway": false,
    "DeviceGuestModeEnabled": true,
    "DefaultCookiesSetting": 1,
    "VmManagementCliAllowed": true,
    "WifiSyncAndroidAllowed": true,
    "DeveloperToolsDisabled": false,
    "InstantTetheringAllowed": true,
    "NearbyShareAllowed": true,
    "PrintingEnabled": true,
    "SmartLockSigninAllowed": true,
    "PhoneHubAllowed": true,
    "DnsOverHttpsMode": "automatic",
    "BrowserLabsEnabled": true,
    "SafeSitesFilterBehavior": 0,
    "SafeBrowsingProtectionLevel": 0,
    "DownloadRestrictions": 0,
    "NetworkPredictionOptions": 0,
    "ArcPolicy": "{\"playStoreMode\":\"ENABLED\",\"playEmmApiInstallDisabled\":false,\"dpsInteractionsDisabled\":false}"
  },
  "device": {}
}
EOF

echo ""
echo "Policy file successfully written!"
echo "Location: /usr/bin/policy-test-tool/policies.json"
echo "Configured for: $email"
