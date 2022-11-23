# Windows MDE

MDE miscellaneous stuff for Windows

Includes: JSON Body Configurations for Graph API MD Policy

## Example Graph API Call
The following example can be used to call the Microsoft Graph API and create a AV Exclusion Policy in Intune\Microsoft Endpoint Manager. [Reference API Link](https://learn.microsoft.com/en-us/graph/api/intune-deviceconfigv2-devicemanagementconfigurationpolicy-create?view=graph-rest-beta "Reference API Link") , [Defender AV Settings](https://learn.microsoft.com/en-us/windows/client-management/mdm/policy-csp-defender "Defender AV Settings Link")

**PERMISSIONS:** DeviceManagementConfiguration.ReadWrite.All

**POST** *https://graph.microsoft.com/beta/deviceManagement/configurationPolicies*

**REQUEST BODY JSON:**
```
{
    "name": "Sample AV Exclusions",
    "description": "This is an example of AV Exclusions for File, Folder, Proccess, and file extension",
    "platforms": "windows10",
    "technologies": "mdm,microsoftSense",
    "roleScopeTagIds": [
        "0"
    ],
    "settingCount": 3,
    "settings": [
        {
            "@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingCollectionInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_defender_excludedextensions",
                "simpleSettingCollectionValue": [
                    {
                        "value": "C:\\Program Files\\Microsoft SQL Server\\130\\MSSQL\\Binn\\SQLServr.exe",
                        "@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue"
                    },
                    {
                        "value": "C:\\Program Files\\Microsoft SQL Server\\130\\MSSQL\\ReplData",
                        "@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue"
                    }
                ],
                "settingInstanceTemplateReference": {
                    "settingInstanceTemplateId": "c203725b-17dc-427b-9470-673a2ce9cd5e"
                }
            }
        },
        {
            "@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingCollectionInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_defender_excludedpaths",
                "simpleSettingCollectionValue": [
                    {
                        "value": "C:\\Program Files\\Microsoft SQL Server\\130\\MSSQL\\Binn\\SQLServr.exe",
                        "@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue"
                    },
                    {
                        "value": "C:\\Program Files\\Microsoft SQL Server\\130\\MSSQL\\ReplData",
                        "@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue"
                    }
                ],
                "settingInstanceTemplateReference": {
                    "settingInstanceTemplateId": "aaf04adc-c639-464f-b4a7-152e784092e8"
                }
            }
        },
        {
            "@odata.type": "#microsoft.graph.deviceManagementConfigurationSetting",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingCollectionInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_defender_excludedprocesses",
                "simpleSettingCollectionValue": [
                    {
                        "value": "C:\\Program Files\\Microsoft SQL Server\\130\\MSSQL\\Binn\\SQLServr.exe",
                        "@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue"
                    },
                    {
                        "value": "C:\\Program Files\\Microsoft SQL Server\\130\\Reporting Services\\ReportServer\\Bin\\ReportingServicesService.exe",
                        "@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue"
                    }
                ],
                "settingInstanceTemplateReference": {
                    "settingInstanceTemplateId": "96b046ed-f138-4250-9ae0-b0772a93d16f"
                }
            }
        }
    ],
    "templateReference": {
        "templateId": "45fea5e9-280d-4da1-9792-fb5736da0ca9_1",
        "templateFamily": "endpointSecurityAntivirus",
        "templateDisplayName": "Microsoft Defender Antivirus exclusions",
        "templateDisplayVersion": "Version 1"
    }
}
```
