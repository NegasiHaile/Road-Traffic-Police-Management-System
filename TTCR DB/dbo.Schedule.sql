CREATE TABLE [dbo].[Schedule] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [Branch_Name]   NVARCHAR (50) NULL,
    [Loct_Name]     NVARCHAR (50) NULL,
    [Traffic_Phone] NVARCHAR (10) NOT NULL,
    [Bridge]        NVARCHAR (10) NULL,
    [Shift]         NVARCHAR (10) NULL,
    [Date]          DATETIME      NULL,
    [Attendance]    NVARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

