Import-Module JiraPS

$pw = ConvertTo-SecureString “P@@$$w0rd” -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential (“michel.slotwinski@bedag.ch”, $pw)
Set-JiraConfigServer 'https://jira.bedag.ch'
New-JiraSession -Credential $cred
$user = get-jirauser
New-JiraIssue -IssueType task -Project DCSDBM -Summary "testissue aus ps" -Reporter $user.key
Get-JiraSession
Remove-JiraSession

$headers = @{
    Authorization = "Bearer NzMxMDUxMjY2ODY2OtSHC/ayAIuawT4ZsA8bg9VnuUVw"
};
<#
$issues = Get-JiraIssue -Query 'project = DCSDBM AND summary ~ Auftragseingang: AND resolution = Unresolved AND due IS NULL'
foreach($issue in $issues) {
$duedatestring = $issue.Description.Substring($issue.Description.IndexOf('Termin bis: ')+12,10)
$duedate = [Datetime]::ParseExact($duedatestring, 'dd.MM.yyyy', $null)
$duedatestring = $duedate.Year.ToString() +  "-" + $duedate.Month.ToString() + "-" + $duedate.Day.ToString()
Write-Host  $duedatestring.ToString()
Set-JiraIssue -Issue $issue.Key -Fields @{'duedate' = $duedatestring}
}
#>


NzE0MzE1NDEyNjYxOmBUjS8Jrnc9pfI7m0vhSJqBaHOC

$issue = Get-JiraIssue -Query 'key=DCSDBM-1198'
$issue.key
$component = Get-JiraComponent -Project DCSDBM -| Where-Object Name -Like "*MSL*Backlog*"




$Uri = $component.RestUrl
$Result = Invoke-RestMethod -Uri $Uri -Method get


Add-JiraIssueLink -Issue $issue.Key -IssueLink $component.RestUrl

Set-JiraIssueLabel -Issue $issue.Key -Add $component

$component.
$issue.components | gm



Get-JiraComponent -Project DCSDBM | gm


Get-JiraComponent | gm

$components = Get-JiraComponent -Project DCSDBM | gm


Get-JiraComponent -Project DCSDBM | Where-Object Name -EQ "DBM Betrieb"
Get-JiraComponent -Project DCSDBM | Where-Object Name -Like "*SQL*Technologie*"
Get-JiraComponent -Project DCSDBM | Where-Object Name -Like "*MAD*Technologie*"
Get-JiraComponent -Project DCSDBM | Where-Object Name -Like "*PGS*Technologie*"
Get-JiraComponent -Project DCSDBM | Where-Object Name -Like "*ORA*Technologie*"
Get-JiraComponent -Project DCSDBM | Where-Object Name -Like "*MOD*Technologie*"


$issue.duedate

Set-JiraIssue -Issue $issue -Fields duedate = 2022-08-26


$issue
$issue.Assignee



$field = @{
        'components' = $components
        'customfield_10156' = $instance.Kostenstelle.ToString()           #Kostenstelle aus dem CSV
        'customfield_13585' = $instance.HLQ.ToString()                    #HLQ aus dem CSV
        }



Set-JiraIssue -Issue $issue.Key -Assignee 'Unassigned' -Fields @{'duedate' = '2022-08-26'} -Description $issue.Description

$searchstring = 'Termin bis: '
$issue.Description.Substring($searchstring

$issue.Description.PadLeft('Termin bis: ')

$issue.Description.IndexOf('Termin bis: ')
$duedatestring = $issue.Description.Substring($issue.Description.IndexOf('Termin bis: ')12,10)

$duedate = [Datetime]::ParseExact($duedatestring, 'dd.MM.yyyy', $null)
$duedate

$duedatestring = $duedate.Year.ToString() +  "-" + $duedate.Month.ToString() + "-" + $duedate.Day.ToString()
$duedatestring

Set-JiraIssue -Issue $issue.Key -Assignee 'Unassigned' -Fields @{'duedate' = $duedatestring} -Description $issue.Description

getdtaetimeformats()


$issue.Key
$issue.Summary


$dbms = $issue.Description.Substring($issue.Description.IndexOf(' Database Management (') + 22, 3)
$issue.components
Set-JiraIssue 

$issue.Key

$components =@()
$component = Get-JiraComponent -Project DCSDBM | Where-Object Name -EQ "DBM Betrieb"
##Get-JiraComponent -Project DCSDBM | Where-Object Name -Like "*SQL*Technologie*"
$components += $component.ID
$component = Get-JiraComponent -Project DCSDBM | Where-Object Name -Like "*SQL*Technologie*"
$components += $component.ID
$components

Set-JiraIssue -Issue $issue.Key -Fields @{'components' = $components}

$issue.components

$component.RestUrl,$component.ID, $component.Name, $component.ProjectName
Set-JiraIssue -Issue $issue.Key -Fields @{'components' = @{$component.RestUrl,$component.ID, $component.Name, "blablabla"}}



