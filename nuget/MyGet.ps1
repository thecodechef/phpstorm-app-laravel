# set env vars usally set by MyGet (enable for local testing)
# $env:SourcePath = '..'
# $env:NuGet = './nuget.exe' # https://dist.nuget.org/win-x86-commandline/latest/nuget.exe

$nuget = $env:NuGet

# parse the version number out of package.json
$bulma_versionParts = ((Get-Content $env:SourcesPath\package.json) -join "`n" | ConvertFrom-Json).version.split('-', 2) # split the version on the '-'
$bulma_version = $bulma_versionParts[0]

if ($bulma_versionParts.Length -gt 1) {
  $bulma_version += '-' + $bulma_versionParts[1].replace('.', '').replace('-', '_') # strip out invalid chars from the PreRelease part
}

# create packages
& $nuget pack "$env:SourcesPath\nuget\bulma.nuspec" -Verbosity detailed -NonInteractive -NoPackageAnalysis -BasePath $env:SourcesPath -Version $bulma_version
& $nuget pack "$env:SourcesPath\nuget\bulma.sass.nuspec" -Verbosity detailed -NonInteractive -NoPackageAnalysis -BasePath $env:SourcesPath -Version $bulma_version