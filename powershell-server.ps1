function listen-port ($portobj) {
  $endpoint = new-object System.Net.IPEndPoint ([ipaddress]::any,$portobj)
  $listener = new-object System.Net.Sockets.TcpListener $endpoint
  $listener.start()
  $listener.AcceptTcpClientAsync()  # will block here until connection
  $listener.stop()
  write-host "Listener on port $portobj stopped."
}


Write-Host "Listening on port $Args."
listen-port $Args[0]






