$appsToRemove = @(
  "Microsoft.ZuneVideo",
  "Microsoft.GamingApp",
  "Microsoft.XboxApp",
  "Microsoft.XboxGameOverlay",
  "Microsoft.XboxGamingOverlay",
  "Microsoft.XboxIdentityProvider",
  "Microsoft.XboxSpeechToTextOverlay",
  "Microsoft.MixedReality.Portal",
  "Microsoft.GetHelp",
  "Microsoft.Getstarted",
  "Microsoft.WindowsFeedbackHub",
  "Microsoft.MicrosoftSolitaireCollection"
)

foreach ($app in $appsToRemove) {
  Get-AppxPackage -Name $app -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue
}
