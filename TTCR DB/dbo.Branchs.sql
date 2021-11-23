CREATE TABLE [dbo].[Branchs] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [BrancName]   NVARCHAR (50) NOT NULL,
    [BranchPhone] NVARCHAR (15) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

