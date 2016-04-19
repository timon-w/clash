USE [clash]
GO

/****** Object:  StoredProcedure [dbo].[sp_mergetbl_claninfo_temp]    Script Date: 4/19/2016 4:24:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_mergetbl_claninfo_temp]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	merge tbl_claninfo as target
	using tbl_claninfo_temp as source
	on (target.claninfo_tag = source.claninfo_tag)
	when matched and target.claninfo_name <> source.claninfo_name
	or target.claninfo_name <> source.claninfo_name
	or target.claninfo_type <> source.claninfo_type
	or target.claninfo_description <> source.claninfo_description
	or target.claninfo_location <> source.claninfo_location
	or target.claninfo_badgeurls <> source.claninfo_badgeurls
	or target.claninfo_warfrequency <> source.claninfo_warfrequency
	or target.claninfo_requiredtrophies <> source.claninfo_requiredtrophies
	or target.claninfo_members <> source.claninfo_members then 
	update set target.claninfo_name = source.claninfo_name, 
	target.claninfo_type = source.claninfo_type,
	target.claninfo_description = source.claninfo_description,
	target.claninfo_location = source.claninfo_location,
	target.claninfo_badgeurls = source.claninfo_badgeurls,
	target.claninfo_warfrequency = source.claninfo_warfrequency,
	target.claninfo_requiredtrophies = source.claninfo_requiredtrophies,
	target.claninfo_members = source.claninfo_members
	when not matched by target then
	insert (claninfo_tag, claninfo_name, claninfo_type, claninfo_description, claninfo_location, claninfo_badgeurls, claninfo_warfrequency, claninfo_requiredtrophies, claninfo_members) 
	VALUES (source.claninfo_tag, source.claninfo_name, source.claninfo_type, source.claninfo_description, source.claninfo_location, source.claninfo_badgeurls, source.claninfo_warfrequency, source.claninfo_requiredtrophies, source.claninfo_members)
	when not matched by source then
	delete
	OUTPUT $action, 
	DELETED.claninfo_tag AS Targetclaninfo_tag,
	DELETED.claninfo_name AS Targetclaninfo_name,
	DELETED.claninfo_type AS Targetclaninfo_type,
	DELETED.claninfo_description AS Targetclaninfo_description,
	DELETED.claninfo_location AS Targetclaninfo_location,
	DELETED.claninfo_badgeurls AS Targetclaninfo_badgeurls,
	DELETED.claninfo_warfrequency AS Targetclaninfo_warfrequency,
	DELETED.claninfo_requiredtrophies AS Targetclaninfo_requiredtrophies,
	DELETED.claninfo_members AS Targetclaninfo_members,
	INSERTED.claninfo_tag AS Sourceclaninfo_tag,
	INSERTED.claninfo_name AS Sourceclaninfo_name,
	INSERTED.claninfo_type AS Sourceclaninfo_type,
	INSERTED.claninfo_description AS Sourceclaninfo_description,
	INSERTED.claninfo_location AS Sourceclaninfo_location,
	INSERTED.claninfo_badgeurls AS Sourceclaninfo_badgeurls,
	INSERTED.claninfo_warfrequency AS Sourceclaninfo_warfrequency,
	INSERTED.claninfo_requiredtrophies AS Sourceclaninfo_requiredtrophies,
	INSERTED.claninfo_members AS Sourceclaninfo_members;
	SELECT @@ROWCOUNT;
END

GO

