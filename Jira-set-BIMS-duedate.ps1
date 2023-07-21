Import-Module JiraPS

$pw = ConvertTo-SecureString “P@$$W0rd” -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential (“michel.slotwinski@bedag.ch”, $pw)
Set-JiraConfigServer 'https://jira.bedag.ch'
New-JiraSession -Credential $cred
$issues = Get-JiraIssue -Query 'project = DCSDBM AND summary ~ Auftragseingang: AND resolution = Unresolved AND due IS NULL'
foreach($issue in $issues) {
$duedatestring = $issue.Description.Substring($issue.Description.IndexOf('Termin bis: ')+12,10)
$duedate = [Datetime]::ParseExact($duedatestring, 'dd.MM.yyyy', $null)
$duedatestring = $duedate.Year.ToString() +  "-" + $duedate.Month.ToString() + "-" + $duedate.Day.ToString()
Write-Host  $duedatestring.ToString()
Set-JiraIssue -Issue $issue.Key -Fields @{'duedate' = $duedatestring}
}



$JiraUrl = "https://jira.bedag.ch/rest/api/2/issue/DCSDBM-1214";



$contentType3 = "application/json"      
$headers3 = @{
    Authorization = "Bearer 1234"
};



$json = '{"update": {"components" : [{"add" : {"name" : "ORA Auftrag"}}]} }'



Invoke-RestMethod -Method PUT -Uri $JiraUrl -ContentType $contentType3 -Headers $headers3 -Body $json;

Register-KeepassSecretVault -Path c:\Data\PSAutomation\PSAuto.kdbx -Name PSAuto -UseMasterPassword

Register-KeepassSecretVault -Path c:\Data\PSAutomation\PSAuto.kdbx -KeyPath c:\Data\PSAutomation\PSAuto.keyx -Name PSAuto



Start-Process -FilePath "C:\Program Files\KeePass Password Safe 2\KeePass.exe" -ArgumentList "c:\Data\PSAutomation\PSAuto.kdbx -keyfile:c:\Data\PSAutomation\PSAuto.keyx"



"KPScript.exe" "-c:GetEntryString" "MyDatabase.kdbx" "-pw:MyPassword" "-keyfile:C:\MyDatabase.key" "-refx-group:mygroup" "-ref-Title:My Entry" "-Field:URL"