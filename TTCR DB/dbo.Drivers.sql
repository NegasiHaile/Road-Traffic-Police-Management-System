CREATE TABLE [dbo].[Drivers] (
    [license_Id]    NVARCHAR (10) NOT NULL,
    [Phone_No]      NVARCHAR (10) NOT NULL,
    [Name]          NVARCHAR (50) NULL,
    [mName]         NVARCHAR (50) NULL,
    [Taxi_Plate]    NVARCHAR (10) NULL,
    [Owner_Phone]   NVARCHAR (13) NULL,
    [Driver_Status] NVARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([license_Id] ASC)
);

