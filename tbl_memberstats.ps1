$token = [token]
$clantag = [clantag]
$sqlserver = [sqlserver]
$sqldb = [sqldb]
$sqlusername = [username]
$sqlpassword = [password]
$requesturl = "https://api.clashofclans.com/v1/clans/"+ $clantag + "/members"
$headers = @{"authorization"=("Bearer " + $token)}
$members = (Invoke-WebRequest -Method get -uri $requesturl -Headers $headers | ConvertFrom-Json).items
$date = get-date

$members | foreach {
  $memberstats_date = $date
  $memberstats_tag = $_.tag
  $memberstats_explevel = $_.explevel
  $memberstats_trophies = $_.trophies
  $memberstats_clanrank = $_.clanrank
  $memberstats_prevclankrank = $_.previousclanrank
  $memberstats_donations = $_.donations
  $memberstats_donationsrec = $_.donationsreceived
  
  $sqlquery1 = "insert into tbl_memberstats (memberstats_date, memberstats_tag, memberstats_explevel, memberstats_trophies, memberstats_clanrank, memberstats_prevclankrank, memberstats_donations, memberstats_donationsrec) values ('$memberstats_date', '$memberstats_tag', '$memberstats_explevel', '$memberstats_trophies', '$memberstats_clanrank', '$memberstats_prevclankrank', '$memberstats_donations', '$memberstats_donationsrec')"

  invoke-sqlcmd -Query $sqlquery1 -ServerInstance $sqlserver -Database $sqldb -Username $sqlusername -Password $sqlpassword
}
