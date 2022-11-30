# To learn more on wildcardusage https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/configure-extension-file-exclusions-microsoft-defender-antivirus?view=o365-worldwide#use-wildcards-in-the-file-name-and-folder-path-or-extension-exclusion-lists
# tracking API limit on AV Exclusion Collection lists to a total of 600 or less


# Import the Sophos XML Policy File
[xml]$xml = Get-Content 'sophos.xml'

# Select XPath on //filePath
$xml.selectNodes('//filePath') | select Name

#Create list for exclude file path, remove matching *.xxx extensions, these are defined later, output exclusion path .csv
$excludepath = $xml.config.onAccessScan.exclusions.filePathSet.filePath | Where-Object {$_ -notmatch "^\*."}
# Create a PS logic to remove exact match duplicates, duplicates cause error on import
$excludepath | Out-File PathExclusionsList.csv



#Create list for exclude proccess, output exclusion process .csv
$excludeproccess = $xml.config.onAccessScan.exclusions.processPathSet.processPath
$excludeproccess | Out-File ProcessExclusionsList.csv

#Create list for exclude file extensions, leverage a ^ = begins with, and \ = escape to special char *
$excludeextensionraw = $xml.config.onAccessScan.exclusions.filePathSet.filePath | Select-String -SimpleMatch "*." | Where-Object {$_ -match "^\*."}

# remove starting wildcard, output exclusion extension .csv
$excludeextension = $excludeextensionraw -replace '[*]'
$excludeextension | Out-File ExtensionsExclusionsList.csv 