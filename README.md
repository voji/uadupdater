# uadupdater

this simple script update our favourite uad vst plugins, from new uad software installation

Before use, please set the $srcFolder and $dstFolder variables... 

$srcFolder - the source folder where the original (new version) of uad plugins installed
$dstFolder - the destination folder, where you store your preferred plugins

By default:
$srcFolder = "c:\Program Files\Steinberg\VSTPlugins\Powered Plugins"
$dstFolder = "c:\Program Files\Steinberg\VSTPlugins\UAD"

The script check the plugins in dst folder, and if found the newer version in src folder in the plugin, update it.

If dst folder contains plugin with not found in the src folder (plugin renamned, or removed), the script write warning
in the standard output: "Missing plugin: " $updatePath

This is the simplest version of uad plugin syncronization... So keep the directory structure the same
in src and dst folder...
