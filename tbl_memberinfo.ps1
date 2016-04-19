$token = [token]
$clantag = [clantag]
$sqlserver = [sqlserver]
$sqldb = [sqldb]
$sqlusername = [username]
$sqlpassword = [password]
$requesturl = "https://api.clashofclans.com/v1/clans/"+ $clantag + "/members"
$headers = @{"authorization"=("Bearer " + $token)}
$members = (Invoke-WebRequest -Method get -uri $requesturl -Headers $headers | ConvertFrom-Json).items

$query1 = "execute sp_cleartbl_memberinfo_temp"
invoke-sqlcmd -Query $query1 -ServerInstance $sqlserver -Database $sqldb -username $sqlusername -password $sqlpassword

$members | foreach {
	$memberinfo_tag = $_.tag
	$memberinfo_name = $_.name
	$memberinfo_role = $_.role
	$query2 = "insert into tbl_memberinfo_temp (memberinfo_tag, memberinfo_name, memberinfo_role) values ('$memberinfo_tag', '$memberinfo_name', '$memberinfo_role')"
	invoke-sqlcmd -Query $query2 -ServerInstance $sqlserver -Database $sqldb -username $sqlusername -password $sqlpassword
}

$query3 = "execute sp_mergetbl_memberinfo_temp"
invoke-sqlcmd -Query $query3 -ServerInstance $sqlserver -Database $sqldb -username $sqlusername -password $sqlpassword
