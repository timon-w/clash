$token = [token]
$clantag = [clantag]
$sqlserver = [sqlserver]
$sqldb = [sqldb]
$sqlusername = [username]
$sqlpassword = [password]
$requesturl = "https://api.clashofclans.com/v1/clans/"+ $clantag
$headers = @{"authorization"=("Bearer " + $token)}
$clan = (Invoke-WebRequest -Method get -uri $requesturl -Headers $headers | ConvertFrom-Json)

$query1 = "execute sp_cleartbl_claninfo_temp"
invoke-sqlcmd -Query $query1 -ServerInstance $sqlserver -Database $sqldb -username $sqlusername -password $sqlpassword

$clan | foreach {
	$1 = $_.tag
	$2 = $_.name
	$3 = $_.type
	$4 = $_.description
	$5 = $_.location
	$6 = $_.badgeurls
	$7 = $_.warfrequency
	$8 = $_.requiredtrophies
	$9 = $_.members

	$query2 = "insert into tbl_claninfo_temp values ('$1', '$2', '$3', '$4', '$5', '$6', '$7', '$8', '$9')"
	invoke-sqlcmd -Query $query2 -ServerInstance $sqlserver -Database $sqldb -username $sqlusername -password $sqlpassword
}

$query3 = "execute sp_mergetbl_claninfo_temp"
invoke-sqlcmd -Query $query3 -ServerInstance $sqlserver -Database $sqldb -username $sqlusername -password $sqlpassword
