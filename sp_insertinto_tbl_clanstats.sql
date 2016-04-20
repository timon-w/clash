USE [clash]
GO

/****** Object:  StoredProcedure [dbo].[sp_insertinto_tbl_clanstats]    Script Date: 4/20/2016 4:41:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertinto_tbl_clanstats] 
	-- Add the parameters for the stored procedure here
	@clanstats_date date,
	@clanstats_tag nvarchar(50),
	@clanstats_clanlevel int,
	@clanstats_warwins int,
	@clanstats_warwinstreak int,
	@clanstats_clanpoints int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tbl_clanstats
		(
			clanstats_date,
			clanstats_tag,
			clanstats_clanlevel,
			clanstats_warwins,
			clanstats_warwinstreak,
			clanstats_clanpoints
		)
	values
		(
			@clanstats_date,
			@clanstats_tag,
			@clanstats_clanlevel,
			@clanstats_warwins,
			@clanstats_warwinstreak,
			@clanstats_clanpoints
		)
END


GO


