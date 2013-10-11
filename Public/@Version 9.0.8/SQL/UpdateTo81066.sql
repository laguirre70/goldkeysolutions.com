/****** 

	Object:  Database GoldKey    
	Script Date: 06/12/2008
	Modified Date: 08/08/2009
	Description: Update the GoldKey database to level 81060

******/

Use GoldKey
GO

DECLARE @DbLevel varchar(5)
SET @DbLevel = (SELECT TOP 1 [dbo].[GlobalValues].[DbUpdateLevel] FROM [dbo].[GlobalValues])

IF (@DbLevel <= '81056')
	BEGIN		
		-- Add three more LogData fields so the Group Log is able to handle more data
		IF NOT EXISTS (SELECT * FROM sys.columns WHERE [object_id] = OBJECT_ID('[dbo].[GroupLog]', 'U') AND name = 'LogData4')
		BEGIN 
			ALTER TABLE [dbo].[GroupLog]
			ADD [LogData4] NVARCHAR(250)
		END
		IF NOT EXISTS (SELECT * FROM sys.columns WHERE [object_id] = OBJECT_ID('[dbo].[GroupLog]', 'U') AND name = 'LogData5')
		BEGIN 
			ALTER TABLE [dbo].[GroupLog]
			ADD [LogData5] NVARCHAR(250)
		END
		IF NOT EXISTS (SELECT * FROM sys.columns WHERE [object_id] = OBJECT_ID('[dbo].[GroupLog]', 'U') AND name = 'LogData6')
		BEGIN 
			ALTER TABLE [dbo].[GroupLog]
			ADD [LogData6] NVARCHAR(250)
		END
		
    -- Increase the [Notified] field size in the [Logbook] table --
    ALTER TABLE [dbo].[Logbook] ALTER COLUMN [Notified] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL

    -- Increase the [Notified] field size in the [Logbook] table --
    ALTER TABLE [dbo].[LogbookArch] ALTER COLUMN [Notified] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL		
		
		-- We need to update the DBLevel. 
		BEGIN
			UPDATE [dbo].[GlobalValues]
			SET [dbo].[GlobalValues].[DbUpdateLevel] = '81057'
		END
	END
ELSE
	PRINT 'You must be at DbLevel 81056 or older to run this section of script.'

IF (@DbLevel <= '81057')
	BEGIN
    UPDATE [dbo].[EvConText] SET [dbo].[EvConText].[EvConType] = 'F0' WHERE [dbo].[EvConText].[EvConType] = 'F'
    UPDATE [dbo].[EvConText] SET [dbo].[EvConText].[EvConType] = 'H0' WHERE [dbo].[EvConText].[EvConType] = 'H'
    UPDATE [dbo].[EvConText] SET [dbo].[EvConText].[EvConType] = 'S0' WHERE [dbo].[EvConText].[EvConType] = 'S'
		-- We need to update the DBLevel. 
		BEGIN
			UPDATE [dbo].[GlobalValues]
			SET [dbo].[GlobalValues].[DbUpdateLevel] = '81058'
		END
	END
ELSE
	PRINT 'You must be at DbLevel 81057 or older to run this section of script.'
	
IF (@DbLevel <= '81058')
	BEGIN
	  -- Add the ProfileTH table if it doesn't exist
		IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[ProfileTH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
			BEGIN
				CREATE TABLE [dbo].[ProfileTH] (
					[ProfileTHID] [int] IDENTITY (1, 1) NOT NULL ,
					[ProfileID] [int] NULL ,
					[Confirmation] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
					[ArrivalDate] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
					[DepartureDate] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
				) ON [PRIMARY]
			END
		-- Add the Suspicious table if it doesn't exist
		IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Suspicious]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
			BEGIN
				CREATE TABLE [dbo].[Suspicious] (
					[SuspiciousID] [int] IDENTITY (1, 1) NOT NULL ,
					[RecordID] [int] NULL ,
					[Workstation] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
					[Concierge] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
					[DateTimeSA] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
					[CAMName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
					[CAModule] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
					[DataSA] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
					[FieldSA] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
				) ON [PRIMARY]
			END
		-- We need to update the DBLevel. 
		BEGIN
			UPDATE [dbo].[GlobalValues]
			SET [dbo].[GlobalValues].[DbUpdateLevel] = '81059'
		END
		
		-- Add the LogbookExportDefs table if it doesn't exist
		IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[LogbookExportDefs]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
			BEGIN
				CREATE TABLE [dbo].[LogbookExportDefs] (
					[ID] [int] IDENTITY (1, 1) NOT NULL ,	
					[DefName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
					[Definition] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL
				) ON [PRIMARY]
			END
	END
ELSE
	PRINT 'You must be at DbLevel 81058 or older to run this section of script.'	

IF (@DbLevel < '81060')
	BEGIN
		-- This update will allow us to store more info on Credit Cards to allow purging based upon the the client's CC storage policies
		IF NOT EXISTS (SELECT * FROM sys.columns WHERE [object_id] = OBJECT_ID('[dbo].[ProfileCC]', 'U') AND name = 'CreatedDate')
		BEGIN 
			ALTER TABLE [dbo].[ProfileCC]
			ADD [CreatedDate] [datetime] NULL
		END
		IF NOT EXISTS (SELECT * FROM sys.columns WHERE [object_id] = OBJECT_ID('[dbo].[Logbook]', 'U') AND name = 'CC_CreatedDate')
		BEGIN 
			ALTER TABLE [dbo].[Logbook]
			ADD [CC_CreatedDate] [datetime] NULL
		END	
		-- Add the LogbookDeletedCC table if it doesn't exist
		IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[LogbookDeletedCC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
			BEGIN
				CREATE TABLE [dbo].[LogbookDeletedCC] (
					[ID] [int] IDENTITY (1, 1) NOT NULL ,
					[LogbookID] [int] NULL ,
					[DeletedDate] [datetime] NULL ,
					[DeletedBy] [nvarchar] (100) NULL
				) ON [PRIMARY]
			END
		-- Add the ProfileDeletedCC table if it doesn't exist
		IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[ProfileDeletedCC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
			BEGIN
				CREATE TABLE [dbo].[ProfileDeletedCC] (
					[ID] [int] IDENTITY (1, 1) NOT NULL ,
					[ProfileID] [int] NULL ,
					[DeletedDate] [datetime] NULL ,
					[DeletedBy] [nvarchar] (100) NULL
				) ON [PRIMARY]
			END	
		-- We need to update the DBLevel. 
		BEGIN
			UPDATE [dbo].[GlobalValues]
			SET [dbo].[GlobalValues].[DbUpdateLevel] = '81060'
		END					
	END
ELSE
	PRINT 'You must be at DbLevel 81059 or older to run this section of script.'
	
IF (@DbLevel < '81061')
	BEGIN
		-- Added the Read Only flag to the LogType Table
		IF NOT EXISTS (SELECT * FROM sys.columns WHERE [object_id] = OBJECT_ID('[dbo].[LogType]', 'U') AND name = 'ReadOnly')
		BEGIN 
			ALTER TABLE [dbo].[LogType]
			ADD [ReadOnly] [bit] NOT NULL
			CONSTRAINT [DF_LogType_ReadOnly] DEFAULT ((0))
		END	
		-- We need to update the DBLevel. 
		BEGIN
			UPDATE [dbo].[GlobalValues]
			SET [dbo].[GlobalValues].[DbUpdateLevel] = '81061'
		END			
	END
ELSE
	PRINT 'You must be at DbLevel 81060 or older to run this section of script.'
	
IF (@DbLevel < '81062')
	BEGIN
		/****** 
		There were no changes to the database but we need to update a value in
		the ConciergePlus table. We are now using position 24 in the Others field
		for Unbooking Reservations. This was set to 0 but we need to set it to 1
		for everyone and let them change it.
		******/    
		DECLARE @conc_id int, @others varchar(25);
		DECLARE ConciergePlus_Cursor CURSOR FOR
		SELECT [ConciergePlusID],[Others] FROM [ConciergePlus];
		OPEN ConciergePlus_Cursor;
		FETCH NEXT FROM ConciergePlus_Cursor INTO @conc_id, @others;
		WHILE @@FETCH_STATUS = 0
			BEGIN
				UPDATE [ConciergePlus] SET [Others] = STUFF(@others,24,1,'1') WHERE [ConciergePlusID] = @conc_id;			   
				FETCH NEXT FROM ConciergePlus_Cursor INTO @conc_id, @others;
			END;
		CLOSE ConciergePlus_Cursor;
		DEALLOCATE ConciergePlus_Cursor;

		-- We need to update the DBLevel. 
		BEGIN
			UPDATE [dbo].[GlobalValues]
			SET [dbo].[GlobalValues].[DbUpdateLevel] = '81062'
		END			
	END
ELSE
	PRINT 'You must be at DbLevel 81061 or older to run this section of script.'

	
IF (@DbLevel < '81063')
	BEGIN
		-- ' We need to track the Concierge that's making the reservations so not everyone can delete their entry.
		IF NOT EXISTS (SELECT * FROM sys.columns WHERE [object_id] = OBJECT_ID('[dbo].[Reservation]', 'U') AND name = 'ConciergeID')
		BEGIN 
			ALTER TABLE [dbo].[Reservation]
			ADD [ConciergeID] [int] NULL
		END	
		-- We need to update the DBLevel. 
		BEGIN
			UPDATE [dbo].[GlobalValues]
			SET [dbo].[GlobalValues].[DbUpdateLevel] = '81063'
		END			
	END
ELSE
	PRINT 'You must be at DbLevel 81062 or older to run this section of script.'

IF (@DbLevel < '81064')
	BEGIN
		-- Add the UserDefinedCategory fields in the Lost and Found table if they doesn't exist
		IF NOT EXISTS (SELECT * FROM sys.columns WHERE [object_id] = OBJECT_ID('[dbo].[LostAndFound]', 'U') AND name = 'UdCategory1')
		BEGIN 
			ALTER TABLE [dbo].[LostAndFound] ADD [UdCategory1] [int] NOT NULL Default ((0))
			ALTER TABLE [dbo].[LostAndFound] ADD [UdCategory2] [int] NOT NULL Default ((0))
			ALTER TABLE [dbo].[LostAndFound] ADD [UdCategory3] [int] NOT NULL Default ((0))
			ALTER TABLE [dbo].[LostAndFound] ADD [UdCategory4] [int] NOT NULL Default ((0))
			ALTER TABLE [dbo].[LostAndFound] ADD [UdCategory5] [int] NOT NULL Default ((0))
		END	

		-- Add the LostAndFoundHistory table if it doesn't exist
		IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[LostAndFoundHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
			BEGIN
				CREATE TABLE [dbo].[LostAndFoundHistory](
					[id] [int] IDENTITY(1,1) NOT NULL,
					[lfID] [int] NOT NULL,
					[userID] [int] NOT NULL,
					[logDate] [datetime] NOT NULL,
					[field] [varchar](100) NOT NULL,
					[origVal] [varchar](250) NULL,
					[newVal] [varchar](250) NULL,
				 CONSTRAINT [PK_LostAndFoundHistory] PRIMARY KEY CLUSTERED 
				(
					[id] ASC,
					[lfID] ASC
				)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
				) ON [PRIMARY]		
			END
		-- Add the LostAndFoundUdCats table if it doesn't exist
		IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[LostAndFoundUdCats]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		BEGIN
			CREATE TABLE [dbo].[LostAndFoundUdCats](
							[categoryID1] [int] NOT NULL,
							[categoryID2] [int] NOT NULL,
							[categoryID3] [int] NOT NULL,
							[categoryID4] [int] NOT NULL,
							[categoryID5] [int] NOT NULL
						) ON [PRIMARY]		
			ALTER TABLE [dbo].[LostAndFoundUdCats] ADD  CONSTRAINT [DF_LostAndFoundCats_categoryID1]  DEFAULT ((0)) FOR [categoryID1]
			ALTER TABLE [dbo].[LostAndFoundUdCats] ADD  CONSTRAINT [DF_LostAndFoundCats_categoryID2]  DEFAULT ((0)) FOR [categoryID2]
			ALTER TABLE [dbo].[LostAndFoundUdCats] ADD  CONSTRAINT [DF_LostAndFoundCats_categoryID3]  DEFAULT ((0)) FOR [categoryID3]
			ALTER TABLE [dbo].[LostAndFoundUdCats] ADD  CONSTRAINT [DF_LostAndFoundCats_categoryID4]  DEFAULT ((0)) FOR [categoryID4]
			ALTER TABLE [dbo].[LostAndFoundUdCats] ADD  CONSTRAINT [DF_LostAndFoundCats_categoryID5]  DEFAULT ((0)) FOR [categoryID5]						
		END
		BEGIN
			INSERT INTO [LostAndFoundUdCats]
			([categoryID1],[categoryID2],[categoryID3],[categoryID4],[categoryID5])
			VALUES (0,0,0,0,0);
		END
		
		-- Add the UserDefinedEnumCategories table if it doesn't exist
		IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UserDefinedEnumCategories]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		BEGIN
			CREATE TABLE [dbo].[UserDefinedEnumCategories]
			(
				[catID] [int] IDENTITY (1, 1) NOT NULL,
				[category] [nvarchar] (100) NOT NULL,
				CONSTRAINT PK_UserDefinedEnumCategories PRIMARY KEY ([catID])
			)
		END
		
		-- Add the UserDefinedEnumItems table if it doesn't exist
		IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UserDefinedEnumItems]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		BEGIN
			CREATE TABLE [dbo].[UserDefinedEnumItems]
			(
				[enumID] [int] IDENTITY (1, 1) NOT NULL,
				[caption] [nvarchar] (150) NOT NULL,
				[catID] [int] NOT NULL,
				CONSTRAINT PK_UserDefinedEnumItems PRIMARY KEY ([enumID],[catID]),
				CONSTRAINT FK_UserDefinedEnumItems_UserDefinedEnumCategories FOREIGN KEY ([catID]) REFERENCES [UserDefinedEnumCategories]([catID])
			);
		END
		
		-- Increase the field size to TEXT to allow for more storage for items like Disclaimers
		BEGIN
			ALTER TABLE [dbo].[GlobalString] ALTER COLUMN [StringValue] TEXT NOT NULL
		END
		
		-- Increase the field size to allow for more storage
		BEGIN
			ALTER TABLE [dbo].[LostAndFound] ALTER COLUMN [ItemText] [varchar](250) NULL
			ALTER TABLE [dbo].[LostAndFound] ALTER COLUMN [EmailAddress] [varchar](250) NULL
		END
		
		-- We need to update the DBLevel. 
		BEGIN
			UPDATE [dbo].[GlobalValues]
			SET [dbo].[GlobalValues].[DbUpdateLevel] = '81064'
		END			
	END
ELSE
	PRINT 'You must be at DbLevel 81063 or older to run this section of script.'
	
IF (@DbLevel < '81065')
	BEGIN
	  -- Add the MsgGroupPI table if it doesn't exist
		IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[MsgGroupPI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
			BEGIN
				CREATE TABLE [dbo].MsgGroupPI (
					[GroupName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
					[PIName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
					CONSTRAINT PK_MsgGroupPI PRIMARY KEY ([GroupName],[PIName])
				)
			END
		-- Change the name of the TypeID field to ProfileTSID in the ProfileTS Table
		IF EXISTS (SELECT * FROM sys.columns WHERE [object_id] = OBJECT_ID('[dbo].[ProfileTS]', 'U') AND name = 'TypeID')
		BEGIN 
			EXEC SP_RENAME '[dbo].[ProfileTS].[TypeID]', 'ProfileTSID', 'COLUMN'
		END				
		-- We need to update the DBLevel. 
		BEGIN
			UPDATE [dbo].[GlobalValues]
			SET [dbo].[GlobalValues].[DbUpdateLevel] = '81065'
		END
	END
ELSE
	PRINT 'You must be at DbLevel 81065 or older to run this section of script.'

IF (@DbLevel < '81066')
	BEGIN
		-- Increase the field size to of the Others column in ConciergePlus
		BEGIN
			ALTER TABLE [dbo].[ConciergePlus] ALTER COLUMN [Others] [varchar](50) NULL
		END
		/****** 
		There were no changes to the database but we need to update a value in
		the ConciergePlus table by increasing Others by 2.
		******/    
		DECLARE @conc_id_1 int, @others_1 varchar(27);
		DECLARE ConciergePlus_Cursor CURSOR FOR
		SELECT [ConciergePlusID],[Others] FROM [ConciergePlus];
		OPEN ConciergePlus_Cursor;
		FETCH NEXT FROM ConciergePlus_Cursor INTO @conc_id_1, @others_1;
		WHILE @@FETCH_STATUS = 0
			BEGIN
				UPDATE [ConciergePlus] SET [Others] = @others_1 + '00' WHERE [ConciergePlusID] = @conc_id_1;
				FETCH NEXT FROM ConciergePlus_Cursor INTO @conc_id_1, @others_1;
			END;
		CLOSE ConciergePlus_Cursor;
		DEALLOCATE ConciergePlus_Cursor;		
		-- We need to update the DBLevel. 
		BEGIN
			UPDATE [dbo].[GlobalValues]
			SET [dbo].[GlobalValues].[DbUpdateLevel] = '81066'
		END
	END
ELSE
	PRINT 'You must be at DbLevel 81066 or older to run this section of script.'