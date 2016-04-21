exec sp_addlogin '[username', '[password]', '[defaultdb]' 

exec sp_grantdbaccess [database]

grant execute on sp_cleartbl_claninfo_temp to [username]
grant execute on sp_cleartbl_memberinfo_temp to [username]
grant execute on sp_insertintotbl_claninfo_temp to [username]
grant execute on sp_insertintotbl_clanstats to [username]
grant execute on sp_insertintotbl_memberinfo_temp to [username]
grant execute on sp_insertintotbl_memberstats to [username]
grant execute on sp_mergetbl_claninfo to [username]
grant execute on sp_mergetbl_memberinfo to [username]
