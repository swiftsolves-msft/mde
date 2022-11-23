#Convert Sophos XML to JSON - Example: https://jsonformatter.org/xml-to-json
# Prune the outputted lists as they sometimes contain differnt sections like extensions in the file path
# use the finalized lists to import in the Intune\MEM AV Policy Sections

$SophosJSONFile = "sophos.json"

# Import-Clixml -Path $SophosXMLFile # Specific Schema Formatting needed :(

$SophosJson = Get-Content -Raw -Path $SophosJSONFile | ConvertFrom-Json

$SophosJson.config.onAccessScan.exclusions.filePathSet.filePath | Out-File PathExclusionsList.csv
$SophosJson.config.onAccessScan.exclusions.processPathSet.processPath | Out-File ProcessExclusionsList.csv
$SophosJson.config.onAccessScan.exclusions.filePathSet.filePath | Select-String -SimpleMatch "*." | Out-File ExtensionsExclusionsList.csv  