#Utility to update UAD plugins to latest version

#source folder, where all factory plugin stored
$srcFolder = "c:\Program Files\Steinberg\VSTPlugins\Universal Audio"
#destination folder, where selected plugins
$dstFolder = "c:\Program Files\Steinberg\VSTPlugins\UAD"

$checkOnly = $args[0]

Set-Alias exist Test-Path -Option "Constant, AllScope"
$updateCount = 0
$missingCount = 0

Write-Output "Synchronize UAD plugins"
Write-Output "Source folder (UAD plugins): " $srcFolder
if (-not (Test-Path -Path  $srcFolder -PathType Container)) {
	Write-Output "Source folder not found..."
	return
}

Write-Output "Destination folder (selected UAD plugins): " $dstFolder
if (-Not (Test-Path -Path  $dstFolder -PathType Container)) {
	Write-Output "Destination folder not found..."
	return
}

Get-ChildItem -Path $dstFolder -Filter *.dll -Recurse | Foreach-Object {
	$dstPath = $_.FullName
	$filePath = $dstPath.Substring($dstFolder.Length)
	$srcPath = Join-Path $srcFolder $filePath
	#Write-Output "Processing plugin: " $dstPath
	if (exist $srcPath) {
		if (-Not $checkOnly) {
			Copy-Item $srcPath -Destination $_.FullName -force
		}
		$updateCount++
	} else {
		Write-Output "Missing plugin: " $updatePath
		$missingCount++
	}
}

if ($checkOnly)
{
	Write-Output "WARNING: Script executed in check only mode, no files updated..."
}

Write-Output "Plugin updated: " $updateCount
Write-Output "Plugin missing: " $missingCount
