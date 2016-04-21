exec sp_addlogin '[username', '[password]', '[defaultdb]' 

exec sp_grantdbaccess [database]

grant execute on sp_cleartbl_claninfo_temp to [username]
grant execute on sp_cleartbl_memberinfo_temp to [username]
grant execute on sp_insertinto_tbl_claninfo_temp to [username]
grant execute on sp_insertinto_tbl_clanstats to [username]
grant execute on sp_insertinto_tbl_memberinfo_temp to [username]
grant execute on sp_insertinto_tbl_memberstats to [username]
grant execute on sp_mergetbl_claninfo_temp to [username]
grant execute on sp_mergetbl_memberinfo_temp to [username]
