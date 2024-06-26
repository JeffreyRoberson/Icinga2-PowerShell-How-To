#
# Module manifest for module 'IcingaCustom'
#
# Generated by: Jeff Roberson
#
# Generated on: 4/16/2024
#

@{
    ModuleVersion = '1.0'
    GUID = '153933d4-391e-475b-848e-b16c8ace57ff'
    Author = 'Jeff Roberson'
    CompanyName = 'City of Hutchinson, Kansas'
    Copyright = '(c) 2024 City of Hutchinson, Kansas. All rights reserved.'
    NestedModules = @('Invoke-CheckADObjectAge','Invoke-UpdateADObjectAge', 'Invoke-CheckMSSQL')
    RequiredModules   = @(@{ModuleName = 'icinga-powershell-framework'; ModuleVersion = '1.12.0' })
    FunctionsToExport = @('*')
    CmdletsToExport   = @('*')
    VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()
    PrivateData       = @{
        PSData   = @{
            Tags         = @( 'icinga', 'icinga2', 'monitoringplugins', 'icingaplugins', 'icinga2plugins', 'windowsplugins', 'icingawindows')
            LicenseUri   = 'https://github.com/Icinga/icinga-powershell-plugins/blob/master/LICENSE'
            ProjectUri   = 'https://github.com/Icinga/icinga-powershell-plugins'
            ReleaseNotes = 'https://github.com/Icinga/icinga-powershell-plugins/releases'
        };
        Version  = 'v1.12.0';
        Name     = 'Windows Plugins';
        Type     = 'plugins';
        Function = '';
        Endpoint = '';
    }

}

