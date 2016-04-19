$token = [token]
$clantag = [clantag]
$requesturl = "https://api.clashofclans.com/v1/clans/"+ $clantag + "/members"
$headers = @{"authorization"=("Bearer " + $token)}
$members = (Invoke-WebRequest -Method get -uri $requesturl -Headers $headers | ConvertFrom-Json).items
$sqlusername = [username]
$sqlpassword = [password]

$query1 = "execute sp_cleartbl_memberinfo_temp"
invoke-sqlcmd -Query $query1 -ServerInstance "timon.clphw7e0y0fq.ap-southeast-2.rds.amazonaws.com" -Database clash -username $sqlusername -password $sqlpassword

$members | foreach {
	$memberinfo_tag = $_.tag
	$memberinfo_name = $_.name
	$memberinfo_role = $_.role
	$query2 = "insert into tbl_memberinfo_temp (memberinfo_tag, memberinfo_name, memberinfo_role) values ('$memberinfo_tag', '$memberinfo_name', '$memberinfo_role')"
	invoke-sqlcmd -Query $query2 -ServerInstance "timon.clphw7e0y0fq.ap-southeast-2.rds.amazonaws.com" -Database clash -username $sqlusername -password $sqlpassword
}

$query3 = "execute sp_mergetbl_memberinfo_temp"
invoke-sqlcmd -Query $query3 -ServerInstance "timon.clphw7e0y0fq.ap-southeast-2.rds.amazonaws.com" -Database clash -username $sqlusername -password $sqlpassword
