$ports = @("12345", "12346", "2222", "4444", "5555", "6666")

Foreach($port in $ports) {
	Start-Job -FilePath .\powershell-server.ps1 -ArgumentList $port
}

Get-Job | Wait-Job

Get-Job | Receive-Job | Out-Gridview

