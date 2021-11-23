CREATE TABLE [dbo].[Taxis] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [Plate]              NVARCHAR (10) NOT NULL,
    [Owner_Phone]        NVARCHAR (13) NOT NULL,
    [Type]               NVARCHAR (15) NULL,
    [Level]              NVARCHAR (10) NOT NULL,
    [Color]              NVARCHAR (10) NULL,
    [Plate_Renewed_Date] DATE          NULL,
    [Driver_Phone]       NVARCHAR (13) NULL,
    [taxi_Status]        NVARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([Plate] ASC)
);

