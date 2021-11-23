CREATE TABLE [dbo].[tblImage] (
    [ImageId]     INT             IDENTITY (1, 1) NOT NULL,
    [ImageName]   VARCHAR (50)    NULL,
    [Image]       VARBINARY (MAX) NULL,
    [ReferenceID] VARCHAR (50)    NULL,
    PRIMARY KEY CLUSTERED ([ImageId] ASC)
);

