CREATE TABLE [dbo].[Locations] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [BranchName] NVARCHAR (50) NOT NULL,
    [Loct_Name]  NVARCHAR (50) NOT NULL,
    [Loca_Info]  TEXT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

