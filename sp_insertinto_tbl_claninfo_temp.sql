USE [clash]
GO

/****** Object:  StoredProcedure [dbo].[sp_insertinto_tbl_claninfo_temp]    Script Date: 4/20/2016 5:19:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertinto_tbl_claninfo_temp] 
	-- Add the parameters for the stored procedure here
	@claninfo_tag nvarchar(50),
	@claninfo_name nvarchar(50),
	@claninfo_type nvarchar(50),
	@claninfo_description nvarchar(500),
	@claninfo_location nvarchar(100),
	@claninfo_badgeurls nvarchar(500),
	@claninfo_warfrequency nvarchar(50),
	@claninfo_requiredtrophies int,
	@claninfo_members int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tbl_claninfo_temp
		(
			claninfo_tag,
			claninfo_name,
			claninfo_type,
			claninfo_description,
			claninfo_location,
			claninfo_badgeurls,
			claninfo_warfrequency,
			claninfo_requiredtrophies,
			claninfo_members
		)
	values
		(
			@claninfo_tag,
			@claninfo_name,
			@claninfo_type,
			@claninfo_description,
			@claninfo_location,
			@claninfo_badgeurls,
			@claninfo_warfrequency,
			@claninfo_requiredtrophies,
			@claninfo_members
		)
END



GO


