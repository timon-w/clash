USE [clash]
GO

/****** Object:  StoredProcedure [dbo].[sp_insertinto_tbl_memberinfo_temp]    Script Date: 4/20/2016 5:19:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertinto_tbl_memberinfo_temp] 
	-- Add the parameters for the stored procedure here
	@memberinfo_tag nvarchar(50),
	@memberinfo_name nvarchar(50),
	@memberinfo_role nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tbl_memberinfo_temp
		(
			memberinfo_tag,
			memberinfo_name,
			memberinfo_role
		)
	values
		(
			@memberinfo_tag,
			@memberinfo_name,
			@memberinfo_role
		)
END



GO


