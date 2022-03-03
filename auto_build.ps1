$target_dir = "~\Desktop"  # Directory for APK-Release output

Write-Host ""
Write-Host ([System.Char]::ConvertFromUtf32([System.Convert]::toInt32("1F680",16))) -NoNewline
Write-Host " Start build APK-Release " -ForegroundColor:Red -NoNewline
Write-Host ([System.Char]::ConvertFromUtf32([System.Convert]::toInt32("1F680",16)))
Write-Host ""

$build_time = (Get-Date -Format 'yyyyMMdd_HHmm').Substring(2)

flutter clean
flutter pub get
flutter build apk --release

$flutter_output = ".\build\app\outputs\flutter-apk\app-release.apk"
$target_output = "$target_dir\app-release_$build_time.apk"

Copy-Item $flutter_output $target_output

Write-Host ""
Write-Host ("Built {0, -45}[Android APK-Release]" -f $target_output) -ForegroundColor:Blue
Write-Host ""
