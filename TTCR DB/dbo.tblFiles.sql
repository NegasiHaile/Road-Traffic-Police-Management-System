CREATE TABLE [dbo].[tblFiles] (
    [id]          INT             IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)    NOT NULL,
    [ContentType] NVARCHAR (200)  NOT NULL,
    [Data]        VARBINARY (MAX) NOT NULL,
    CONSTRAINT [PK_tblFiles] PRIMARY KEY CLUSTERED ([id] ASC)
);

