# PS triage by Jesse Carleton
# script assumes you are a privileged user
# requires psexec, would have used PS for netsh and netstat if supported in Win7 PS. AFAIK, this functionality is in Win8 and up
# creates triage.txt in working directory

$Target = Read-Host -Prompt 'Input the target hostname'
$Date = date
echo $Date > triage.txt
Get-WMIObject -class Win32_ComputerSystem -ComputerName $Target | select username >> triage.txt
Get-WmiObject -Class Win32_Process -ComputerName $Target >> triage.txt
psexec \\$Target netsh interface ipv4 show tcpconnections >> triage.txt
psexec \\$Target netstat -aob >> triage.txt
echo "Done!"
