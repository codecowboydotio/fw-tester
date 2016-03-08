$myservers="127.0.0.1"
$myports="12345","12346","2222","4444","5555","6666"

foreach ($element in $myservers) {
            foreach ($port in $myports) {
                        $ipAddress = $element
                        $ErrorActionPreference = "SilentlyContinue"
                        $ipObj = [System.Net.IPAddress]::parse($ipAddress)
                        $isValidIP = [System.Net.IPAddress]::tryparse([string]$ipAddress, [ref]$ipObj)
            if ($isValidIP) {
            } else {
                        write-host "$ipAddress is not a valid ip address"
                        exit
            } # end of if-else

            $socket = new-object Net.Sockets.TcpClient
            $socket.Connect($ipAddress, $port)
            if ($socket.connected) {
                        write-host -fore green "connected successfully to $ipAddress on $port"
                        $socket.Close()
            } else {
                        write-host -fore red "COULD NOT CONNECT to $ipAddress on $port"
            } # end of if-else statement

} # end of foreach loop ports
} # end of foreach loop servers
