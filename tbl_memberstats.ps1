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
  $1 = $date
  $2 = $_.tag
  $3 = $_.explevel
  $4 = $_.trophies
  $5 = $_.clanrank
  $6 = $_.previousclanrank
  $7 = $_.donations
  $8 = $_.donationsreceived
  
  $query = "insert into tbl_memberstats values ('$1', '$2', '$3', '$4', '$5', '$6', '$7', '$8')"

  invoke-sqlcmd -Query $query -ServerInstance $sqlserver -Database $sqldb -Username $sqlusername -Password $sqlpassword
}
