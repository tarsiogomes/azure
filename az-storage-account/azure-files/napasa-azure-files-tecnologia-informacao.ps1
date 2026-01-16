$connectTestResult = Test-NetConnection -ComputerName napasa01.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Salve a senha para que a unidade persista na reinicialização
    cmd.exe /C "cmdkey /add:`"napasa01.file.core.windows.net`" /user:`"localhost\napasa01`" /pass:`"ubtEoonEZLMdlevFlXFXzqdl0pQbXyYqsN+zQ6qiXD3PzjvYxwuvJ99qinGFgK7+nWTzVKwG4Aca+AStVVNEBA==`""
    # Montar a unidade
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\napasa01.file.core.windows.net\tecnologia-informacao" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}