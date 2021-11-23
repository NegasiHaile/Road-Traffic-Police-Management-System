CREATE TABLE [dbo].[Deviants] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [Branch]       NVARCHAR (50) NULL,
    [Location]     NVARCHAR (50) NULL,
    [Plate]        NVARCHAR (10) NULL,
    [Phone]        NVARCHAR (10) NOT NULL,
    [Description]  TEXT          NULL,
    [Status]       NVARCHAR (50) NULL,
    [DateTime]     DATETIME      NULL,
    [Owner_Phone]  NVARCHAR (10) NULL,
    [Driver_Phone] NVARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

