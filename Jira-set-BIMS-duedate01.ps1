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