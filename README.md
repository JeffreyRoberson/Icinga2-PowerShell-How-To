I felt compelled to write a how to guide on implementing custom PowerShell scripts within Icinga2.  I needed to create my own custom tests to mirror the work I have done with Nagios in the past.  I spent many hours attempting to answer the question, “now what?” with my custom scripts.  While the documentation for Icinga2 is there, I felt like it was short on specific examples.  Many of us are short on time and spending hours trying to get the basics going is a lesson in frustration.

Assumptions: Icinga2, IcingaDirector are already installed and running.  I could write another article about how to build that system up as well.  

To begin, Icinga2 uses PowerShell functions.  I have some examples posted here in my GitHub page.  Icinga2 can implement a tired check system and is easy to work with.  My Veeam backup job check shows how to implement a tired check system.  I use the PowerShell ISE to build my scripts.  One can check them by executing the function with the ISE.  

I have built a script, now what?  This is where I spent many hours digging into PowerShell and how to make it work with Icinga2.

Where do I put my scripts?
I created a folder, %ProgramFiles%\WindowsPowerShell\Modules\IcingaCustom
The manifest file needs to live there.  One can create their own using the command:
New-ModuleManifest -Path %ProgramFiles%\WindowsPowerShell\Modules\IcingaCustom\IcingaCustom.psd1

The manifest I have posted as an example shows where to put the functions created so PowerShell can recognize them.  The important line in the manifest file is:
NestedModules = @('Invoke-CheckADObjectAge','Invoke-UpdateADObjectAge', 'Invoke-CheckMSSQL', 'Invoke-CheckVeeamVBR')
Simply list the function name in this array for PowerShell to recognize them.

The test functions created should be a “.psm1” file.  I put each function in a unique file to keep things simple.

How do I get these tests into Icinga2?

This is where baskets come into play.  First ensure the modules are imported into PowerShell using the Import-Module function.  For my example:
ImportModule IcingaCustom

The basket can be created using this command:
Get-IcingaCheckCommandConfig -OutDirectory ‘C:\Temp’ 
This will export all known functions created.
If only specific functions need to be exported add -CheckName onto the Get-IcingaCheckCommandConfig command.  
For Example,
 Get-IcingaCheckCommandConfig -CheckName Invoke-CheckADObjectAge -OutDirectory 'C:\Temp'
This will create a json file that can be imported into IcingaWeb2.

Open a web browser and log into IcingaWeb2.  
Click on the Icinga Director link.  Under Icinga Director Configuration there is a Configure Baskets link.  Click on this link.  Next click Upload.  Name the basket and upload the json file created with the Get-IcingaCheckCommandConfig command.  
The basket must be “restored” to work.  Click on the basket that was just uploaded.  Next click on Snapshots.  Click on the first link below the Create Snapshot button.  Next click on the Restore link and click Restore. 

This will import the configuration of the PowerShell scripts.

Now we can use it to create a new check command.

Go to Services under Icinga Director.  Then Single Service, click Add.  Give the service a name and answer the rest of the questions.  In the Check Command one can start typing the name of the function and it should appear in the list.  

This is all one needs to do to implement custom Icinga2 PowerShell scripts.  I hope this will help others to get up and going quickly with custom tests in Icinga2.  
