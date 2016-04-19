$token = [token]
$clantag = [clantag]
$sqlserver = [sqlserver]
$sqldb = [sqldb]
$sqlusername = [username]
$sqlpassword = [password]
$requesturl = "https://api.clashofclans.com/v1/clans/"+ $clantag
$headers = @{"authorization"=("Bearer " + $token)}
$clan = (Invoke-WebRequest -Method get -uri $requesturl -Headers $headers | ConvertFrom-Json)
$date = get-date

$clan | foreach {
	$1 = $date
	$2 = $_.tag
	$3 = $_.clanlevel
	$4 = $_.warwins
	$5 = $_.warwinstreak
	$6 = $_.clanpoints

	$query = "insert into tbl_clanstats values ('$1', '$2', '$3', '$4', '$5', '$6')"

  	invoke-sqlcmd -Query $query -ServerInstance $sqlserver -Database $sqldb -Username $sqlusername -Password $sqlpassword
}
