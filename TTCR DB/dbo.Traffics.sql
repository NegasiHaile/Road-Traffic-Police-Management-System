CREATE TABLE [dbo].[Traffics] (
    [EplyID]         INT           IDENTITY (1, 1) NOT NULL,
    [Phone_No]       NVARCHAR (10) NOT NULL,
    [FName]          NVARCHAR (50) DEFAULT (NULL) NOT NULL,
    [MName]          NVARCHAR (50) DEFAULT (NULL) NOT NULL,
    [LName]          NVARCHAR (50) DEFAULT (NULL) NULL,
    [Email]          NVARCHAR (50) DEFAULT (NULL) NULL,
    [Proff_Name]     NVARCHAR (30) DEFAULT (NULL) NOT NULL,
    [Brith_date]     DATE          NULL,
    [Gender]         NVARCHAR (10) NOT NULL,
    [Branch]         NVARCHAR (50) NULL,
    [Responsibility] NVARCHAR (50) DEFAULT (NULL) NULL,
    PRIMARY KEY CLUSTERED ([Phone_No] ASC)
);

