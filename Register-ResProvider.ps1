param (
    [Parameter(Mandatory = $true)]
    [string]$ResourceProviderName
)

if (-not (Get-AzContext).Account) {
    Connect-AzAccount -UseDeviceAuthentication
}

$subscriptions = Get-AzSubscription

foreach ($subscription in $subscriptions) {
    Set-AzContext -SubscriptionId $subscription.Id
    Register-AzResourceProvider -ProviderNamespace $ResourceProviderName
}