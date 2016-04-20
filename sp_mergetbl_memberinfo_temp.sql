USE [clash]
GO

/****** Object:  StoredProcedure [dbo].[sp_mergetbl_memberinfo_temp]    Script Date: 4/19/2016 4:24:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_mergetbl_memberinfo_temp]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	merge tbl_memberinfo as target
	using tbl_memberinfo_temp as source
	on (target.memberinfo_tag = source.memberinfo_tag)
	when matched and target.memberinfo_name <> source.memberinfo_name 
	or target.memberinfo_role <> source.memberinfo_role then 
	update set target.memberinfo_name = source.memberinfo_name, 
	target.memberinfo_role = source.memberinfo_role 
	when not matched by target then
	insert (memberinfo_tag, memberinfo_name, memberinfo_role) 
	VALUES (source.memberinfo_tag, source.memberinfo_name, source.memberinfo_role)
	when not matched by source then
	delete
	OUTPUT $action, 
	DELETED.memberinfo_tag AS Targetmemberinfo_tag, 
	DELETED.memberinfo_name AS Targetmemberinfo_name, 
	DELETED.memberinfo_role AS Targetmemberinfo_role, 
	INSERTED.memberinfo_tag AS Sourcememberinfo_tag, 
	INSERTED.memberinfo_name AS Sourcememberinfo_name, 
	INSERTED.memberinfo_role AS Sourcememberinfo_role; 
	SELECT @@ROWCOUNT;
END

GO


