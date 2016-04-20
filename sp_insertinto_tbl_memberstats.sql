USE [clash]
GO

/****** Object:  StoredProcedure [dbo].[sp_insertinto_tbl_memberstats]    Script Date: 4/20/2016 5:10:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertinto_tbl_memberstats] 
	-- Add the parameters for the stored procedure here
	@memberstats_date date,
	@memberstats_tag nvarchar(50),
	@memberstats_explevel int,
	@memberstats_trophies int,
	@memberstats_clanrank int,
	@memberstats_prevclankrank int,
	@memberstats_donations int,
	@memberstats_donationsrec int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tbl_memberstats
		(
			memberstats_date,
			memberstats_tag,
			memberstats_explevel,
			memberstats_trophies,
			memberstats_clanrank,
			memberstats_prevclankrank,
			memberstats_donations,
			memberstats_donationsrec
		)
	values
		(
			@memberstats_date,
			@memberstats_tag,
			@memberstats_explevel,
			@memberstats_trophies,
			@memberstats_clanrank,
			@memberstats_prevclankrank,
			@memberstats_donations,
			@memberstats_donationsrec
		)
END



GO


