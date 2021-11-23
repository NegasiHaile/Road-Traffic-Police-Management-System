CREATE TABLE [dbo].[Owners] (
    [Owner_Id]    INT           IDENTITY (1, 1) NOT NULL,
    [Phone_No]    NVARCHAR (13) NOT NULL,
    [FName]       NVARCHAR (50) NOT NULL,
    [MName]       NVARCHAR (50) NOT NULL,
    [LName]       NVARCHAR (50) NOT NULL,
    [Gender]      NVARCHAR (10) NOT NULL,
    [Tellephone]  NVARCHAR (15) NULL,
    [Email]       NVARCHAR (50) NULL,
    [OwnerStatus] NVARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([Phone_No] ASC)
);

