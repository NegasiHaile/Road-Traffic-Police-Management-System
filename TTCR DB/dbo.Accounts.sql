CREATE TABLE [dbo].[Accounts] (
    [Account_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [Email]          NVARCHAR (50) NULL,
    [Phone_No]       NVARCHAR (13) NOT NULL,
    [Password]       NVARCHAR (50) NOT NULL,
    [Account_Type]   NVARCHAR (20) NULL,
    [Account_Status] NVARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([Phone_No] ASC)
);

