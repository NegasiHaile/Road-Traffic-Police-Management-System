CREATE TABLE [dbo].[Records] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [Traffi_Phone]      NVARCHAR (10) NOT NULL,
    [Branch_Name]       NVARCHAR (50) NOT NULL,
    [Loct_Name]         NVARCHAR (50) NULL,
    [Plate_No]          NVARCHAR (10) NOT NULL,
    [Dirver_license_No] NVARCHAR (10) NOT NULL,
    [Date]              DATE          NOT NULL,
    [payment_Type]      NVARCHAR (20) NULL,
    [Ref_No]            NVARCHAR (10) NULL,
    [Ammount_In_figure] FLOAT (53)    NOT NULL,
    [Amount_In_Words]   NVARCHAR (50) NULL,
    [Purpose]           NVARCHAR (20) NOT NULL,
    [Driver_Agreement]  NVARCHAR (50) NULL,
    [Payment_Status]    NVARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

