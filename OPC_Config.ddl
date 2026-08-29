USE [OPC_Config]
GO
/****** Object:  Table [dbo].[Alias]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Alias] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Alias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventAttribute]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventAttribute](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EventAttribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventAttributes]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventAttributes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventSubId] [int] NOT NULL,
	[EventTypeId] [int] NOT NULL,
	[AttributeId] [int] NULL,
	[OuterCategoryId] [int] NULL,
	[OuterAttributeId] [int] NULL,
	[VarType] [int] NULL,
 CONSTRAINT [aaaaaEventAttributes_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventCat2Param]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventCat2Param](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventCatId] [int] NULL,
	[ParameterId] [int] NULL,
 CONSTRAINT [aaaaaEventCat2Param_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventCategories]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventTypeId] [int] NOT NULL,
	[Condition] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [aaaaaEventCategories_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventCategoryMap]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventCategoryMap](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventSubId] [int] NOT NULL,
	[SubconditionId] [int] NOT NULL,
	[SubconditionName_Srv] [varchar](100) NOT NULL,
 CONSTRAINT [PK_EventCategoryMap] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventFilterByArea]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventFilterByArea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventSubId] [int] NULL,
	[Area] [nvarchar](255) NULL,
 CONSTRAINT [aaaaaEventFilterByArea_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventFilterByCategory]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventFilterByCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventSubId] [int] NULL,
	[EventCategoryId] [int] NULL,
 CONSTRAINT [aaaaaEventFilterByCategory_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventFilterBySourse]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventFilterBySourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventSubId] [int] NULL,
	[Source] [nvarchar](255) NULL,
 CONSTRAINT [aaaaaEventFilterBySourse_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventLogAttributes]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventLogAttributes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[AttributeId] [smallint] NOT NULL,
	[ValueType] [smallint] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Value] [varchar](max) NULL,
 CONSTRAINT [PK_EventLogAttributes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventSub]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventSub](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[BufferTime] [int] NOT NULL,
	[MaxSize] [int] NOT NULL,
	[Refresh] [bit] NOT NULL,
	[AsIs] [bit] NOT NULL,
	[Timeout] [int] NULL,
	[Deleted] [bit] NULL,
	[Filters] [bit] NULL,
	[EventTypeFilter] [tinyint] NULL,
	[LowSeverityFilter] [int] NULL,
	[HighSeverityFilter] [int] NULL,
 CONSTRAINT [aaaaaEventSub_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTypeMap]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTypeMap](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventSubId] [int] NOT NULL,
	[EventCategoryId] [int] NOT NULL,
	[EventCategoryId_Srv] [int] NOT NULL,
 CONSTRAINT [PK_EventTypeMap] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTypes]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [tinyint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EventTypes_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genesis_Areas]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genesis_Areas](
	[Area] [nvarchar](255) NULL,
	[Source] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genesis_Tags]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genesis_Tags](
	[SourceId] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[Input1] [ntext] NULL,
	[Tag_] [nvarchar](255) NULL,
	[Tag] [nvarchar](255) NULL,
	[Factor] [float] NULL,
	[TS_TI] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemNamePatterns]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemNamePatterns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[ItemNamePattern] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ItemNamePatterns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemProperties]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [int] NULL,
	[ItemPropertyName] [nvarchar](255) NULL,
	[OuterItemPropertyName] [nvarchar](255) NULL,
 CONSTRAINT [aaaaaItemProperties_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jugsys_Tags]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugsys_Tags](
	[ItemName] [ntext] NULL,
	[Source] [nvarchar](255) NULL,
	[Area] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OPC_Types]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OPC_Types](
	[Id] [tinyint] NOT NULL,
	[Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_OPC_Types] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpcDataLog]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpcDataLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](254) NOT NULL,
	[TimeStamp] [datetime] NULL,
	[Quality] [smallint] NULL,
	[ValueType] [varchar](50) NOT NULL,
	[Value] [varchar](max) NULL,
	[DateIns] [datetime] NULL,
 CONSTRAINT [PK_OpcDataLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpcEventLog]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpcEventLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChangeMask] [smallint] NOT NULL,
	[NewState] [smallint] NOT NULL,
	[NewStateName] [varchar](20) NULL,
	[Source] [varchar](50) NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[Message] [varchar](50) NULL,
	[EventType] [varchar](10) NOT NULL,
	[EventCategory] [tinyint] NULL,
	[ConditionName] [varchar](50) NULL,
	[SubConditionName] [varchar](50) NULL,
	[Severity] [smallint] NULL,
	[Quality] [smallint] NULL,
	[AckRequired] [bit] NOT NULL,
	[ActiveTime] [datetime] NOT NULL,
	[Cookie] [int] NULL,
	[ActorId] [varchar](50) NULL,
	[DateIns] [datetime] NULL,
 CONSTRAINT [PK_OpcEventLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpcGroups]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpcGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[DeadBand] [float] NOT NULL,
	[RefreshRate] [int] NOT NULL,
	[AsIs] [bit] NOT NULL,
	[ItemNamePattern] [tinyint] NOT NULL,
	[AllItems] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_OpcGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parameters]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parameters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ObjectTypeId] [int] NULL,
	[ObjectDescription] [nvarchar](255) NULL,
	[ParameterId] [int] NULL,
	[ParameterName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Measure] [nvarchar](255) NULL,
	[StateNormName] [nvarchar](255) NULL,
	[StateAbnormName] [nvarchar](255) NULL,
 CONSTRAINT [aaaaaParameters_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servers]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AliasId] [int] NOT NULL,
	[HostName] [nvarchar](50) NULL,
	[ServerName] [nvarchar](50) NOT NULL,
	[ServerType] [tinyint] NOT NULL,
 CONSTRAINT [aaaaaAliases_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag2Group]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag2Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_Tag2Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerId] [int] NOT NULL,
	[Tag] [nvarchar](255) NULL,
	[ObjectId] [int] NULL,
	[ParameterId] [int] NULL,
	[Multiplier] [float] NULL,
	[Offset] [float] NULL,
	[BitMask] [int] NULL,
	[DeadBand] [float] NULL,
	[ItemName] [nvarchar](255) NULL,
	[Source] [nvarchar](255) NULL,
	[Area] [nvarchar](255) NULL,
	[ZeroNormalState] [bit] NULL,
	[ItemNamePure]  AS (case when patindex('%_id%',[ItemName])>(0) then left([ItemName],patindex('%_id%',[ItemName])-(1)) else [ItemName] end),
	[NormalState] [tinyint] NULL,
 CONSTRAINT [aaaaaTags_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagSettings]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventCatParam] [int] NULL,
	[TagId] [int] NULL,
	[ConditionValue] [float] NULL,
	[Priority] [int] NULL,
	[Message] [nvarchar](255) NULL,
	[RequiresAck] [bit] NOT NULL,
	[upsize_ts] [timestamp] NULL,
 CONSTRAINT [aaaaaTagSettings_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Obj_State_Event]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Obj_State_Event](
	[ItemId] [int] NULL,
	[EventTime] [datetime] NULL,
	[Tag] [nvarchar](55) NULL,
	[Area] [ntext] NULL,
	[SubObjEventType] [nvarchar](32) NULL,
	[Source] [ntext] NULL,
	[SubObj] [ntext] NULL,
	[CV] [smallint] NULL,
	[Measure] [nvarchar](1) NULL,
	[Message] [ntext] NULL,
	[GesClass] [nvarchar](50) NULL,
	[Groups_ID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Obj_Value_Event]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Obj_Value_Event](
	[ItemId] [int] NULL,
	[EventTime] [datetime] NULL,
	[Tag] [nvarchar](55) NULL,
	[Area] [ntext] NULL,
	[SubObjEventType] [nvarchar](32) NULL,
	[Source] [ntext] NULL,
	[SubObj] [ntext] NULL,
	[CV] [float] NULL,
	[Measure] [nvarchar](10) NULL,
	[Message] [nvarchar](1) NULL,
	[GesClass] [nvarchar](50) NULL,
	[Groups_ID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VarTypes]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VarTypes](
	[Id] [int] NOT NULL,
	[Type] [varchar](20) NOT NULL,
 CONSTRAINT [PK_VarTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[view_Tags]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[view_Tags](
	[ItemName] [nvarchar](max) NULL,
	[Source] [nvarchar](255) NOT NULL,
	[Area] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_DAGroups]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_DAGroups]
AS
SELECT     dbo.Alias.Id AS AliasId, dbo.Alias.Alias, dbo.Servers.Id AS ServerId, dbo.Servers.HostName, dbo.Servers.ServerName, dbo.OpcGroups.Id AS GroupId, 
                      dbo.OpcGroups.Name AS GroupName, dbo.OpcGroups.Active, dbo.OpcGroups.DeadBand, dbo.OpcGroups.RefreshRate, dbo.OpcGroups.AsIs, 
                      dbo.OpcGroups.ItemNamePattern, dbo.OpcGroups.AllItems
FROM         dbo.Alias INNER JOIN
                      dbo.Servers ON dbo.Alias.Id = dbo.Servers.AliasId INNER JOIN
                      dbo.OpcGroups ON dbo.Servers.Id = dbo.OpcGroups.ServerId
WHERE     (dbo.Servers.ServerType = 0) AND (dbo.OpcGroups.Deleted = 0)
GO
/****** Object:  View [dbo].[view_OpcItemConfigs]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_OpcItemConfigs]
AS
SELECT     dbo.view_DAGroups.GroupId, dbo.view_DAGroups.GroupName, dbo.view_DAGroups.ServerName, dbo.Tags.ObjectId, dbo.Tags.ParameterId, dbo.Tags.Multiplier, 
                      dbo.Tags.Offset, dbo.Tags.BitMask, dbo.Tags.DeadBand, dbo.Tags.ItemNamePure AS ItemName, dbo.Tags.Source, dbo.Tags.Area
FROM         dbo.Tags INNER JOIN
                      dbo.Tag2Group ON dbo.Tags.Id = dbo.Tag2Group.TagId INNER JOIN
                      dbo.view_DAGroups ON dbo.Tag2Group.GroupId = dbo.view_DAGroups.GroupId
GO
/****** Object:  View [dbo].[opcView_PS_Cell_Switch_new]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--use opc_config

CREATE view [dbo].[opcView_PS_Cell_Switch_new]
as
Select swList.id,swList.name as SwitchName,swList.TypeCodeId ,cellList.name as CellName, tpList.TypeCodeId as PsType, tpList.name as PsName, cellList.TypeCodeId as CellType,
swList.TypeCodeId as SwType 
from GES.dbo.tSchm_ObjList as swList inner join
GES.dbo.tSchm_Relation on swList.IdParent=GES.dbo.tSchm_Relation.id inner join
GES.dbo.tSchm_ObjList as cellList on cellList.id=GES.dbo.tSchm_Relation.edge inner join 
GES.dbo.tSchm_ObjList as tpList on cellList.IdParent = tpList.Id
where swList.TypeCodeId in (552,558,556) and swList.deleted=0 and cellList.deleted=0 and tpList.deleted=0


--select * from opcView_PS_Cell_Switch_new 

--select * from GES.dbo.tSchm_ObjList
GO
/****** Object:  View [dbo].[viewOpc_Ps_Cell_Switch]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewOpc_Ps_Cell_Switch]
AS
SELECT      PsCls.Name AS ParentTypeName, list.PsName AS ParentName, CellCls.Name AS Type, list.CellName AS Name, SwCls.Name AS SwitchTypeName, 
                        list.SwitchName, list.id
FROM          dbo.opcView_PS_Cell_Switch_new list INNER JOIN
                        GES.dbo.tR_Classifier PsCls ON PsCls.Id = list.PsType INNER JOIN
                        GES.dbo.tR_Classifier CellCls ON CellCls.Id = list.CellType INNER JOIN
                        GES.dbo.tR_Classifier SwCls ON SwCls.Id = list.TypeCodeId
GO
/****** Object:  View [dbo].[view_AESub]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_AESub]
AS
SELECT      dbo.EventSub.Id, dbo.Servers.Id AS ServerId, dbo.Servers.HostName, dbo.Servers.ServerName, dbo.EventSub.Active, dbo.EventSub.BufferTime, 
                        dbo.EventSub.MaxSize, dbo.EventSub.AsIs, dbo.EventSub.Filters, dbo.EventSub.EventTypeFilter, dbo.EventSub.LowSeverityFilter, 
                        dbo.EventSub.HighSeverityFilter
FROM          dbo.Servers INNER JOIN
                        dbo.EventSub ON dbo.Servers.Id = dbo.EventSub.ServerId
WHERE      (dbo.Servers.ServerType = 1) AND (dbo.EventSub.Deleted = 0)
GO
/****** Object:  View [dbo].[view_EventAttribs]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_EventAttribs]
AS
SELECT      dbo.EventAttributes.Id, dbo.EventAttributes.EventSubId, dbo.EventTypes.Code AS EventTypeId, dbo.EventTypes.Name AS EventTypeName, 
                        dbo.EventTypes.Id AS EventCategoryId, dbo.EventTypes.CategoryName AS EventCategoryName, dbo.EventAttributes.AttributeId, 
                        dbo.EventAttribute.Name AS AttributeName, dbo.EventAttributes.OuterCategoryId, dbo.EventAttributes.OuterAttributeId, 
                        dbo.EventAttributes.VarType
FROM          dbo.EventTypes INNER JOIN
                        dbo.EventAttributes ON dbo.EventTypes.Id = dbo.EventAttributes.EventTypeId INNER JOIN
                        dbo.EventAttribute ON dbo.EventAttributes.AttributeId = dbo.EventAttribute.Id
WHERE      (NOT (dbo.EventAttributes.OuterCategoryId IS NULL)) AND (NOT (dbo.EventAttributes.OuterAttributeId IS NULL))
GO
/****** Object:  View [dbo].[view_EventCategories]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_EventCategories]
AS
SELECT     dbo.EventTypes.Code AS EventType, dbo.EventCategories.EventTypeId AS EventCatrgoryId, dbo.EventTypes.CategoryName AS EventCatrgory, 
                      dbo.EventCategories.Condition, dbo.EventCategories.Description
FROM         dbo.EventCategories RIGHT OUTER JOIN
                      dbo.EventTypes ON dbo.EventCategories.EventTypeId = dbo.EventTypes.Id
GO
/****** Object:  View [dbo].[view_EventCategoryMap]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_EventCategoryMap]
AS
SELECT      dbo.EventCategoryMap.EventSubId, dbo.EventCategories.EventTypeId AS EventCategoryId, dbo.EventCategories.Condition AS SubCondition, 
                        dbo.EventCategoryMap.SubconditionName_Srv AS SubCondition_Srv
FROM          dbo.EventCategories INNER JOIN
                        dbo.EventCategoryMap ON dbo.EventCategories.Id = dbo.EventCategoryMap.SubconditionId
GO
/****** Object:  View [dbo].[view_EventTypeMap]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_EventTypeMap]
AS
SELECT      dbo.EventTypeMap.EventSubId, dbo.EventTypeMap.EventCategoryId, dbo.EventTypes.CategoryName, dbo.EventTypeMap.EventCategoryId_Srv
FROM          dbo.EventTypes INNER JOIN
                        dbo.EventTypeMap ON dbo.EventTypes.Id = dbo.EventTypeMap.EventCategoryId
GO
/****** Object:  View [dbo].[view_ItemNamePatterns]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_ItemNamePatterns]
AS
SELECT     dbo.view_DAGroups.GroupId, dbo.ItemNamePatterns.ItemNamePattern
FROM         dbo.view_DAGroups INNER JOIN
                      dbo.ItemNamePatterns ON dbo.view_DAGroups.GroupId = dbo.ItemNamePatterns.GrpoupId
GO
/****** Object:  View [dbo].[view_Jugsys_NewItems]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_Jugsys_NewItems]
AS
SELECT     ItemName, Source, Area
FROM       [ULGES-SQL].[Jugsys_Monitor].[dbo].[view_Tags] --AS OuterTags
--FROM         dbo.view_Tags AS OuterTags
/*
WHERE     (ItemName NOT IN
                          (SELECT     ItemName
                            FROM          dbo.Tags)) AND (LEN(Source) > 0)
*/
GO
/****** Object:  View [dbo].[viewOpc_Cell_Switch]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewOpc_Cell_Switch]
AS
SELECT      tR_Classifier_1.Id AS ParentTypeId, tR_Classifier_1.Name AS ParentTypeName, tSchm_ObjList_1.Id AS ParentId, 
                        tSchm_ObjList_1.Name AS ParentName, GES.dbo.tR_Classifier.Id AS TypeId, GES.dbo.tR_Classifier.Name AS Type, tSchm_ObjList_1.Id, 
                        tSchm_ObjList_1.Name AS SwitchTypeName, GES.dbo.tSchm_ObjList.Name AS SwitchName, GES.dbo.tSchm_ObjList.IdParent
FROM          GES.dbo.tSchm_ObjList INNER JOIN
                        GES.dbo.tR_Classifier ON GES.dbo.tSchm_ObjList.TypeCodeId = GES.dbo.tR_Classifier.Id INNER JOIN
                        GES.dbo.tR_Classifier tR_Classifier_1 INNER JOIN
                        GES.dbo.tSchm_ObjList tSchm_ObjList_1 ON tR_Classifier_1.Id = tSchm_ObjList_1.TypeCodeId INNER JOIN
                        GES.dbo.tSchm_Relation ON tSchm_ObjList_1.IdParent = GES.dbo.tSchm_Relation.id ON 
                        GES.dbo.tSchm_ObjList.Id = GES.dbo.tSchm_Relation.Edge
WHERE      (GES.dbo.tSchm_ObjList.Deleted = 0) AND (tSchm_ObjList_1.Deleted = 0) AND (tR_Classifier_1.Id IN (552, 558, 556))
GO
/****** Object:  View [dbo].[viewOpc_Ps]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewOpc_Ps]
AS
SELECT      GES.dbo.tR_Classifier.Name AS ParentTypeName, GES.dbo.tSchm_ObjList.Name AS ParentName, GES.dbo.tSchm_ObjList.Id, 
                        GES.dbo.tSchm_ObjList.NameP
FROM          GES.dbo.tSchm_ObjList INNER JOIN
                        GES.dbo.tR_Classifier ON GES.dbo.tSchm_ObjList.TypeCodeId = GES.dbo.tR_Classifier.Id
WHERE      (GES.dbo.tR_Classifier.Id IN (535, 536, 537, 538)) AND (GES.dbo.tSchm_ObjList.Deleted = 0)
GO
/****** Object:  View [dbo].[viewOpc_Ps_Cell_Bus]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewOpc_Ps_Cell_Bus]
AS
SELECT      GES.dbo.tR_Classifier.Id AS ParentTypeId, GES.dbo.tR_Classifier.Name AS ParentTypeName, GES.dbo.tSchm_ObjList.Id AS ParentId, 
                        GES.dbo.tSchm_ObjList.Name AS ParentName, tR_Classifier_1.Name AS Type, tSchm_ObjList_1.Id, tSchm_ObjList_1.Name
FROM          GES.dbo.tSchm_ObjList INNER JOIN
                        GES.dbo.tSchm_ObjList tSchm_ObjList_1 ON GES.dbo.tSchm_ObjList.Id = tSchm_ObjList_1.IdParent INNER JOIN
                        GES.dbo.tR_Classifier ON GES.dbo.tSchm_ObjList.TypeCodeId = GES.dbo.tR_Classifier.Id INNER JOIN
                        GES.dbo.tR_Classifier tR_Classifier_1 ON tSchm_ObjList_1.TypeCodeId = tR_Classifier_1.Id
WHERE      (GES.dbo.tR_Classifier.Id IN (535, 536, 537, 538)) AND (tSchm_ObjList_1.Name NOT LIKE '<Object>%') AND (GES.dbo.tSchm_ObjList.Deleted = 0) AND 
                        (tSchm_ObjList_1.Deleted = 0) AND (tR_Classifier_1.Id IN (672, 674, 675, 676, 541, 564, 653, 654))
GO
/****** Object:  View [dbo].[vParametersTags]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vParametersTags]
AS
SELECT     t.Id, t.ServerId, t.ParameterId, CASE WHEN s.hostname IS NULL OR
                      s.hostname = '' THEN s.servername + '\' + t .itemnamepure ELSE '\\' + s.hostname + '\' + s.servername + '\' + t .itemnamepure END AS ItemName, t.BitMask, 
                      t.ObjectId, t.Source, t.Area, p.ObjectDescription, p.Description AS pDescription, p.Measure, t.ZeroNormalState, p.StateNormName, p.StateAbnormName, 
                      p.ParameterName
FROM         dbo.Servers AS s LEFT OUTER JOIN
                      dbo.Tags AS t ON t.ServerId = s.Id LEFT OUTER JOIN
                      dbo.Parameters AS p ON p.Id = t.ParameterId
GO
ALTER TABLE [dbo].[EventSub] ADD  CONSTRAINT [DF__EventSub__Active__1DE57479]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[EventSub] ADD  CONSTRAINT [DF__EventSub__Buffer__1ED998B2]  DEFAULT ((1000)) FOR [BufferTime]
GO
ALTER TABLE [dbo].[EventSub] ADD  CONSTRAINT [DF__EventSub__MaxSiz__1FCDBCEB]  DEFAULT ((1000)) FOR [MaxSize]
GO
ALTER TABLE [dbo].[EventSub] ADD  CONSTRAINT [DF_EventSub_Refresh]  DEFAULT ((1)) FOR [Refresh]
GO
ALTER TABLE [dbo].[EventSub] ADD  CONSTRAINT [DF_EventSub_AllAttribs]  DEFAULT ((0)) FOR [AsIs]
GO
ALTER TABLE [dbo].[EventSub] ADD  CONSTRAINT [DF_EventSub_Timeout]  DEFAULT ((300000)) FOR [Timeout]
GO
ALTER TABLE [dbo].[EventSub] ADD  CONSTRAINT [DF_EventSub_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[EventSub] ADD  CONSTRAINT [DF_EventSub_Filters]  DEFAULT ((0)) FOR [Filters]
GO
ALTER TABLE [dbo].[OpcDataLog] ADD  CONSTRAINT [DF_OpcDataLog_DateIns]  DEFAULT (getdate()) FOR [DateIns]
GO
ALTER TABLE [dbo].[OpcEventLog] ADD  CONSTRAINT [DF_OpcEventLog_DateIns]  DEFAULT (getdate()) FOR [DateIns]
GO
ALTER TABLE [dbo].[OpcGroups] ADD  CONSTRAINT [DF_OpcGroups_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[OpcGroups] ADD  CONSTRAINT [DF_OpcGroups_DeadBand]  DEFAULT ((0)) FOR [DeadBand]
GO
ALTER TABLE [dbo].[OpcGroups] ADD  CONSTRAINT [DF_OpcGroups_AllItems]  DEFAULT ((0)) FOR [AsIs]
GO
ALTER TABLE [dbo].[OpcGroups] ADD  CONSTRAINT [DF_OpcGroups_ItemNamePattern]  DEFAULT ((0)) FOR [ItemNamePattern]
GO
ALTER TABLE [dbo].[OpcGroups] ADD  CONSTRAINT [DF_OpcGroups_AllItems_1]  DEFAULT ((1)) FOR [AllItems]
GO
ALTER TABLE [dbo].[OpcGroups] ADD  CONSTRAINT [DF_OpcGroups_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Servers] ADD  CONSTRAINT [DF_Servers_AliasId]  DEFAULT ((0)) FOR [AliasId]
GO
ALTER TABLE [dbo].[Servers] ADD  CONSTRAINT [DF_Aliases_ServerType]  DEFAULT ((0)) FOR [ServerType]
GO
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_Multiplier]  DEFAULT ((1)) FOR [Multiplier]
GO
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_Offset]  DEFAULT ((0)) FOR [Offset]
GO
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_BinMask]  DEFAULT ((0)) FOR [BitMask]
GO
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_DeadBand]  DEFAULT ((0)) FOR [DeadBand]
GO
ALTER TABLE [dbo].[TagSettings] ADD  DEFAULT ((500)) FOR [Priority]
GO
ALTER TABLE [dbo].[TagSettings] ADD  DEFAULT ((0)) FOR [RequiresAck]
GO
ALTER TABLE [dbo].[EventAttributes]  WITH NOCHECK ADD  CONSTRAINT [EventAttributes_FK01] FOREIGN KEY([EventSubId])
REFERENCES [dbo].[EventSub] ([Id])
GO
ALTER TABLE [dbo].[EventAttributes] NOCHECK CONSTRAINT [EventAttributes_FK01]
GO
ALTER TABLE [dbo].[EventAttributes]  WITH NOCHECK ADD  CONSTRAINT [FK_EventAttributes_EventAttribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[EventAttribute] ([Id])
GO
ALTER TABLE [dbo].[EventAttributes] CHECK CONSTRAINT [FK_EventAttributes_EventAttribute]
GO
ALTER TABLE [dbo].[EventAttributes]  WITH CHECK ADD  CONSTRAINT [FK_EventAttributes_EventTypes] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[EventTypes] ([Id])
GO
ALTER TABLE [dbo].[EventAttributes] CHECK CONSTRAINT [FK_EventAttributes_EventTypes]
GO
ALTER TABLE [dbo].[EventAttributes]  WITH CHECK ADD  CONSTRAINT [FK_EventAttributes_VarTypes] FOREIGN KEY([VarType])
REFERENCES [dbo].[VarTypes] ([Id])
GO
ALTER TABLE [dbo].[EventAttributes] CHECK CONSTRAINT [FK_EventAttributes_VarTypes]
GO
ALTER TABLE [dbo].[EventCat2Param]  WITH NOCHECK ADD  CONSTRAINT [EventCat2Param_FK00] FOREIGN KEY([EventCatId])
REFERENCES [dbo].[EventCategories] ([Id])
GO
ALTER TABLE [dbo].[EventCat2Param] NOCHECK CONSTRAINT [EventCat2Param_FK00]
GO
ALTER TABLE [dbo].[EventCat2Param]  WITH NOCHECK ADD  CONSTRAINT [EventCat2Param_FK01] FOREIGN KEY([ParameterId])
REFERENCES [dbo].[Parameters] ([Id])
GO
ALTER TABLE [dbo].[EventCat2Param] NOCHECK CONSTRAINT [EventCat2Param_FK01]
GO
ALTER TABLE [dbo].[EventCategories]  WITH CHECK ADD  CONSTRAINT [FK_EventCategories_EventTypes] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[EventTypes] ([Id])
GO
ALTER TABLE [dbo].[EventCategories] CHECK CONSTRAINT [FK_EventCategories_EventTypes]
GO
ALTER TABLE [dbo].[EventCategoryMap]  WITH CHECK ADD  CONSTRAINT [FK_EventCategoryMap_EventCategories] FOREIGN KEY([SubconditionId])
REFERENCES [dbo].[EventCategories] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventCategoryMap] CHECK CONSTRAINT [FK_EventCategoryMap_EventCategories]
GO
ALTER TABLE [dbo].[EventCategoryMap]  WITH CHECK ADD  CONSTRAINT [FK_EventCategoryMap_EventSub] FOREIGN KEY([EventSubId])
REFERENCES [dbo].[EventSub] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventCategoryMap] CHECK CONSTRAINT [FK_EventCategoryMap_EventSub]
GO
ALTER TABLE [dbo].[EventFilterByArea]  WITH NOCHECK ADD  CONSTRAINT [EventFilterByArea_FK00] FOREIGN KEY([EventSubId])
REFERENCES [dbo].[EventSub] ([Id])
GO
ALTER TABLE [dbo].[EventFilterByArea] NOCHECK CONSTRAINT [EventFilterByArea_FK00]
GO
ALTER TABLE [dbo].[EventFilterByCategory]  WITH NOCHECK ADD  CONSTRAINT [EventFilterByCategory_FK00] FOREIGN KEY([EventCategoryId])
REFERENCES [dbo].[EventCategories] ([Id])
GO
ALTER TABLE [dbo].[EventFilterByCategory] NOCHECK CONSTRAINT [EventFilterByCategory_FK00]
GO
ALTER TABLE [dbo].[EventFilterByCategory]  WITH NOCHECK ADD  CONSTRAINT [EventFilterByCategory_FK01] FOREIGN KEY([EventSubId])
REFERENCES [dbo].[EventSub] ([Id])
GO
ALTER TABLE [dbo].[EventFilterByCategory] NOCHECK CONSTRAINT [EventFilterByCategory_FK01]
GO
ALTER TABLE [dbo].[EventFilterBySourse]  WITH NOCHECK ADD  CONSTRAINT [EventFilterBySourse_FK00] FOREIGN KEY([EventSubId])
REFERENCES [dbo].[EventSub] ([Id])
GO
ALTER TABLE [dbo].[EventFilterBySourse] NOCHECK CONSTRAINT [EventFilterBySourse_FK00]
GO
ALTER TABLE [dbo].[EventLogAttributes]  WITH CHECK ADD  CONSTRAINT [FK_EventLogAttributes_OpcEventLog] FOREIGN KEY([EventId])
REFERENCES [dbo].[OpcEventLog] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventLogAttributes] CHECK CONSTRAINT [FK_EventLogAttributes_OpcEventLog]
GO
ALTER TABLE [dbo].[EventSub]  WITH NOCHECK ADD  CONSTRAINT [EventSub_FK00] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[EventSub] NOCHECK CONSTRAINT [EventSub_FK00]
GO
ALTER TABLE [dbo].[EventTypeMap]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeMap_EventSub] FOREIGN KEY([EventSubId])
REFERENCES [dbo].[EventSub] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventTypeMap] CHECK CONSTRAINT [FK_EventTypeMap_EventSub]
GO
ALTER TABLE [dbo].[EventTypeMap]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeMap_EventTypes] FOREIGN KEY([EventCategoryId])
REFERENCES [dbo].[EventTypes] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventTypeMap] CHECK CONSTRAINT [FK_EventTypeMap_EventTypes]
GO
ALTER TABLE [dbo].[ItemNamePatterns]  WITH CHECK ADD  CONSTRAINT [FK_ItemNamePatterns_OpcGroups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[OpcGroups] ([Id])
GO
ALTER TABLE [dbo].[ItemNamePatterns] CHECK CONSTRAINT [FK_ItemNamePatterns_OpcGroups]
GO
ALTER TABLE [dbo].[ItemProperties]  WITH NOCHECK ADD  CONSTRAINT [ItemProperties_FK00] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[ItemProperties] NOCHECK CONSTRAINT [ItemProperties_FK00]
GO
ALTER TABLE [dbo].[OpcGroups]  WITH CHECK ADD  CONSTRAINT [FK_OpcGroups_Servers] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Servers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OpcGroups] CHECK CONSTRAINT [FK_OpcGroups_Servers]
GO
ALTER TABLE [dbo].[Tag2Group]  WITH NOCHECK ADD  CONSTRAINT [FK_Tag2Group_OpcGroups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[OpcGroups] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tag2Group] CHECK CONSTRAINT [FK_Tag2Group_OpcGroups]
GO
ALTER TABLE [dbo].[Tag2Group]  WITH NOCHECK ADD  CONSTRAINT [FK_Tag2Group_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tag2Group] CHECK CONSTRAINT [FK_Tag2Group_Tags]
GO
ALTER TABLE [dbo].[Tags]  WITH NOCHECK ADD  CONSTRAINT [FK_Tags_Parameters] FOREIGN KEY([ParameterId])
REFERENCES [dbo].[Parameters] ([Id])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_Parameters]
GO
ALTER TABLE [dbo].[Tags]  WITH NOCHECK ADD  CONSTRAINT [FK_Tags_Servers] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_Servers]
GO
ALTER TABLE [dbo].[TagSettings]  WITH NOCHECK ADD  CONSTRAINT [TagSettings_FK00] FOREIGN KEY([EventCatParam])
REFERENCES [dbo].[EventCat2Param] ([Id])
GO
ALTER TABLE [dbo].[TagSettings] NOCHECK CONSTRAINT [TagSettings_FK00]
GO
ALTER TABLE [dbo].[TagSettings]  WITH NOCHECK ADD  CONSTRAINT [TagSettings_FK01] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[TagSettings] NOCHECK CONSTRAINT [TagSettings_FK01]
GO
ALTER TABLE [dbo].[EventSub]  WITH NOCHECK ADD  CONSTRAINT [CK_EventSub_HighSeverityFilter] CHECK  (([HighSeverityFilter]>=[LowSeverityFilter]))
GO
ALTER TABLE [dbo].[EventSub] CHECK CONSTRAINT [CK_EventSub_HighSeverityFilter]
GO
ALTER TABLE [dbo].[EventSub]  WITH NOCHECK ADD  CONSTRAINT [CK_EventSub_LowSeverityFilter] CHECK  (([LowSeverityFilter]>=(0)))
GO
ALTER TABLE [dbo].[EventSub] CHECK CONSTRAINT [CK_EventSub_LowSeverityFilter]
GO
ALTER TABLE [dbo].[EventSub]  WITH NOCHECK ADD  CONSTRAINT [CK_EventSub_TypeFilter] CHECK  (([EventTypeFilter]>=(0) AND [EventTypeFilter]<(8)))
GO
ALTER TABLE [dbo].[EventSub] CHECK CONSTRAINT [CK_EventSub_TypeFilter]
GO
ALTER TABLE [dbo].[OpcGroups]  WITH CHECK ADD  CONSTRAINT [CK_OpcGroups_INP] CHECK  (([ItemNamePattern]>=(0) AND [ItemNamePattern]<=(2)))
GO
ALTER TABLE [dbo].[OpcGroups] CHECK CONSTRAINT [CK_OpcGroups_INP]
GO
ALTER TABLE [dbo].[Servers]  WITH CHECK ADD  CONSTRAINT [CK_Aliases_SrvType] CHECK  (([ServerType]=(0) OR [ServerType]=(1)))
GO
ALTER TABLE [dbo].[Servers] CHECK CONSTRAINT [CK_Aliases_SrvType]
GO
ALTER TABLE [dbo].[VarTypes]  WITH CHECK ADD  CONSTRAINT [CK_VarTypes] CHECK  (([Id]>=(0) AND [Id]<=0xFFFF))
GO
ALTER TABLE [dbo].[VarTypes] CHECK CONSTRAINT [CK_VarTypes]
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckJugsysNewItems]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CheckJugsysNewItems]
AS 
	SELECT 3,ItemName,Source+' '+RootArea,Area
    FROM [ULGES-SQL].[Jugsys_Monitor].[dbo].[view_Tags] 
    AS OuterTags
    WHERE (ItemName NOT IN
   (SELECT     ItemName
    FROM dbo.Tags)) AND (LEN(Source) > 0)
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckJugsysNewItems_New]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CheckJugsysNewItems_New]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if object_id('tempdb..#tmpAe') is not null 
		drop table #tmpAe
	if object_id('tempdb..#tmpDa') is not null 
		drop table #tmpDA

	SELECT  * into #tmpDa FROM [ULGES-SQL].[Jugsys_Monitor].[dbo].view_TagsDa 
	SELECT  * into #tmpAe FROM [ULGES-SQL].[Jugsys_Monitor].[dbo].view_TagsAe

	select * from #tmpDa as t where not exists (select * from tags where tags.ItemName=t.ItemName)
	union
	select * from #tmpAe as t where not exists (select * from tags where tags.ItemName=t.ItemName);


END
GO
/****** Object:  StoredProcedure [dbo].[sp_JugsysNewItems]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_JugsysNewItems] 
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Tags(ServerId,ItemName,Source,Area)
	SELECT 3,ItemName,Source+' '+RootArea,replace(Area,'\\','\') 
    FROM [ULGES-SQL].[Jugsys_Monitor].[dbo].[view_Tags] 
    AS OuterTags
    WHERE (ItemName NOT IN
   (SELECT     ItemName
    FROM dbo.Tags)) AND (LEN(Source) > 0)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_JugsysNewItems_New]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[sp_JugsysNewItems_New]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if object_id('tempdb..#tmpAe') is not null 
		drop table #tmpAe
	if object_id('tempdb..#tmpDa') is not null 
		drop table #tmpDA

	SELECT  * into #tmpDa FROM [ULGES-SQL].[Jugsys_Monitor].[dbo].view_TagsDa 
	SELECT  * into #tmpAe FROM [ULGES-SQL].[Jugsys_Monitor].[dbo].view_TagsAe

	INSERT INTO Tags(ServerId,ItemName,Source,Area)
	SELECT 3,ItemName,Source+' '+RootArea,replace(Area,'\\','\') 
	from #tmpDa as t where not exists (select * from tags where tags.ItemName=t.ItemName)

	INSERT INTO Tags(ServerId,ItemName,Source,Area)
	SELECT 3,ItemName,Source+' '+RootArea,replace(Area,'\\','\') 
	from #tmpAe as t where not exists (select * from tags where tags.ItemName=t.ItemName)
	
	--select * from #tmpDa as t where not exists (select * from tags where tags.ItemName=t.ItemName)
	--union
	--select * from #tmpAe as t where not exists (select * from tags where tags.ItemName=t.ItemName);


END
GO
/****** Object:  StoredProcedure [dbo].[ХранимаяПроцедура2]    Script Date: 30.08.26 01:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ХранимаяПроцедура2]
AS UPDATE      dbo.Tags
SET               ZeroNormalState = 0
WHERE      (ParameterId = 8)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_CheckJugsysNewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Tags"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_CheckJugsysNewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_CheckJugsysNewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_CheckJugsysNewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_CheckJugsysNewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_CheckJugsysNewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[ХранимаяПроцедура1].[Area]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_CheckJugsysNewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_CheckJugsysNewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_CheckJugsysNewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_CheckJugsysNewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_CheckJugsysNewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_CheckJugsysNewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Tags"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 295
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 8
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'ХранимаяПроцедура2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'ХранимаяПроцедура2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'ХранимаяПроцедура2'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventAttributes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventSubId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'EventSubId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventAttributes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventCatId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'EventCatId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventAttributes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'29.02.2012 15:24:18' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'05.03.2012 9:38:00' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventAttributes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventCat2Param' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventCatId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'EventCatId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventCat2Param' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'EventCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ParameterId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ParameterId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventCat2Param' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'28.02.2012 14:46:09' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29.02.2012 15:22:59' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventCat2Param' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'26' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCat2Param'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⑿⋃갊䶘኎➼ь୾' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventCategories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1785' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'䂝�釪ᦉ鍻' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Condition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Condition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventCategories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'4245' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'�쏎찌䇣羠ᎄ幈ﻓ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventCategories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'28.02.2012 9:16:47' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'05.03.2012 9:37:10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventCategories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubconditionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubconditionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubconditionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubconditionName_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubconditionName_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubconditionName_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventFilterByArea' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventSubId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'EventSubId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventFilterByArea' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventFilterByArea' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'29.02.2012 15:33:40' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29.02.2012 15:36:19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventFilterByArea' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByArea'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventFilterByCategory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventSubId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'EventSubId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventFilterByCategory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventCategoryId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'EventCategoryId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventFilterByCategory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'29.02.2012 15:39:17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29.02.2012 15:42:30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventFilterByCategory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterByCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'䏘뾛䔧悩ี晚鸃' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventFilterBySourse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'芯ᨄ䀞䞺슉擗Ќ䩠' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventSubId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'EventSubId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventFilterBySourse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㴲瓲鯠䥠ڦ킋旅' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Source' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Source' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventFilterBySourse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'29.02.2012 15:40:39' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29.02.2012 15:42:01' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventFilterBySourse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventFilterBySourse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventLogAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventLogAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventLogAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventLogAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventLogAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventLogAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventLogAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventLogAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventLogAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventLogAttributes'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventSub' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'AliasId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'AliasId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventSub' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventSub' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'1000' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'BufferTyme' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'BufferTyme' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventSub' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'1000' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'MaxSize' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'MaxSize' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventSub' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reserved' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Timeout'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Timeout'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Timeout'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Timeout'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'Deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'EventTypeFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'EventTypeFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'EventTypeFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'LowSeverityFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'LowSeverityFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'LowSeverityFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'HighSeverityFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'HighSeverityFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub', @level2type=N'COLUMN',@level2name=N'HighSeverityFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'29.02.2012 15:04:52' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'05.03.2012 9:30:50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventSub' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventSub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'EventSub.Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'внутренний, единый для всех AE-серверов  в БД' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'внешний, внутренний для каждого AE-сервера' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventTypeMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3900 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemNamePatterns'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'ItemProperties' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'TagId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'TagId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'ItemProperties' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ItemPropertyName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ItemPropertyName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'ItemProperties' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'ItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'OuterItemPropertyName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'OuterItemPropertyName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'ItemProperties' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties', @level2type=N'COLUMN',@level2name=N'OuterItemPropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05.03.2012 9:40:49' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'05.03.2012 9:41:52' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ItemProperties' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ChangeMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ChangeMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ChangeMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ChangeMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ChangeMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'NewState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'NewState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'NewState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'NewState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'NewState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'NewStateName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'NewStateName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'NewStateName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'NewStateName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'NewStateName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3120 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'EventCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ConditionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ConditionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ConditionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ConditionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ConditionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'SubConditionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'SubConditionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'SubConditionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'SubConditionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'SubConditionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Severity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Severity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Severity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Severity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Severity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Quality'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Quality'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Quality'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Quality'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Quality'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'AckRequired'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'AckRequired'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'AckRequired'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'AckRequired'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'AckRequired'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ActiveTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ActiveTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ActiveTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2295 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ActiveTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ActiveTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Cookie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Cookie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Cookie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Cookie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'Cookie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ActorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ActorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ActorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ActorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'ActorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'DateIns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'DateIns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog', @level2type=N'COLUMN',@level2name=N'DateIns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcEventLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3405 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'RefreshRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'RefreshRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'RefreshRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'RefreshRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'RefreshRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'AsIs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'AsIs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'AsIs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'AsIs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Данные транслируются "как есть",  без любых преобразований' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'AsIs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'AsIs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Соотношение Tags.ItemName с ItemNamePatterns.ItemNamePattern: 0-точное соответствие, 1-совпадение слева, 2-включение подстроки' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'AllItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'AllItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'AllItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'AllItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Включаются все Tags.ItemName для данного сервера, ItemNamePattern не учитывается' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'AllItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups', @level2type=N'COLUMN',@level2name=N'AllItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'➠᫿繑䚺躽楰ὥ獺' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'揕笢믒䱦욄譀湥⟻' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID объекта в tR_Classifier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ObjectType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ObjectType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'3045' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'஥࿻䯭ᖩ쇥⬑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=3 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3045 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ObjectDescription' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ObjectDescription' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=4 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1710 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID параметра в tR_Classifier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'酠＝ࣰ䍭뢰鑎ﶰ瀯' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=5 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2895 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Parameter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Parameter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'3645' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'磕㮝胛䧣⎘≶䩮싞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=6 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3645 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ྦ眶髆䎨�䪇埵귙' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=7 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Единица измерения' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Measure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Measure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1590' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ꡮ櫳鏻䍝梂〸貊셞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=8 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1590 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Текст нормального состояния' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'StateNormName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'StateNormName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2400' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ꩨ姎뷿䐰쮁旳⨽' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=9 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2400 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Текст ненормального состояния' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'StateAbnormName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'StateAbnormName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'28.02.2012 11:47:09' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'28.02.2012 15:00:16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[Parameters].[ParameterName], [Parameters].[Description]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'呈炝㼀䝴ꊂ뀩粦魙' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Aliases' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'AliasId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'AliasId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'AliasId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'AliasId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'AliasId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'Ж쒴≃䒴鲙ꦍ颲뇄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'хост opc-сервера' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'HostName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'HostName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Aliases' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'贠ͭ椺䣀悈랴灰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3975 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'имя  opc-сервера' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ServerName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ServerName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Aliases' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 - OPC DA, 1 - OPC AE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'"OPC DA";"OPC AE"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ServerType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ServerType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Aliases' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'28.02.2012 11:30:12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29.02.2012 15:07:24' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[Servers].[ServerType] DESC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Aliases' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[Tag2Group].[TagId]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tag2Group'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㾾歘촖䠀⢊�렉' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'踊闛䘗骝챦቎ﰱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'AliasId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'AliasId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'퐠檣훮䐄몙帽츚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Tag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Tag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'無鮈ፏ䃪䪿蟥磏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID объекта в системе GES' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ObjectId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ObjectId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'颈녣װ䲭鮇ꞁ쭁䭲' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID параметра' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Parameter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Parameter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'鳀뉍蚃䌳ꎔ�롊촪' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2130 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Множитель' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Multiplier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Multiplier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Multiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'�隅䴅䂠횠䎮痱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Поправка' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Offset' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Offset' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Offset'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Бинарная маска (для дискретных тэгов)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'BinMask' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'BinMask' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ⶼｊ䦮誏늀刐盪' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Зона нуля' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DeadBand' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DeadBand' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3150 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Имя внешнего opc-тэга (OPC DA)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'OuterTagName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'OuterTagName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=4815 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Источник события (SOURCE внешнего OPCAE-сервера)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'OuterSourse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'OuterSourse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1935 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Область (атрибут AREAS внешнего OPCAE-сервера)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'OuterArea' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'OuterArea' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Нормальное состояние=0 (для телесигналов)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'28.02.2012 15:37:23' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'05.03.2012 9:41:52' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=N'(Tag Is Null Or Tag="")' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[Tags].[Area], [Tags].[Id], [Tags].[ServerId] DESC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'鐔ⶀ䱬뎭亁씮⭈' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'TagSettings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㺧ꅐⷣ䠖醡紴儘甬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventCatParam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'EventCatParam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'TagSettings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'EventCatParam'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'湠Ἔ㧩䜌箘璗ⲻ縷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Tag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Tag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'TagSettings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⤓輪䗡�ꮈ䯦�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ConditionValue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ConditionValue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'TagSettings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'500' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'謙ᰵ⒅䃓ᚊꝮ뭇' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Priority' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Priority' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'TagSettings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'岦េ쨊䰹ᾦ뻀暍垳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Message' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Message' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'TagSettings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'桳鰈瀎䍇骧쇡点늓' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'RequiresAck' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'RequiresAck' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'TagSettings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings', @level2type=N'COLUMN',@level2name=N'RequiresAck'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'28.02.2012 16:03:27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'28.02.2012 16:49:17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'TagSettings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TagSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventSub' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'呈炝㼀䝴ꊂ뀩粦魙' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Aliases' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'Ж쒴≃䒴鲙ꦍ颲뇄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'хост opc-сервера' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'HostName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'HostName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Aliases' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'贠ͭ椺䣀悈랴灰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3975 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'имя  opc-сервера' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ServerName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ServerName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Aliases' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventSub' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'1000' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'BufferTyme' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'BufferTyme' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventSub' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'BufferTime'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'1000' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'MaxSize' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'MaxSize' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventSub' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'MaxSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'EventTypeFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'EventTypeFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'EventTypeFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'LowSeverityFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'LowSeverityFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'LowSeverityFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HighSeverityFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HighSeverityFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub', @level2type=N'COLUMN',@level2name=N'HighSeverityFilter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[29] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Servers"
            Begin Extent = 
               Top = 11
               Left = 261
               Bottom = 147
               Right = 412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EventSub"
            Begin Extent = 
               Top = 5
               Left = 476
               Bottom = 264
               Right = 627
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_AESub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AliasId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AliasId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AliasId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AliasId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AliasId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'Alias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'Alias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'Alias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'Alias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'Alias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3600 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3450 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'DeadBand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'RefreshRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'RefreshRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'RefreshRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'RefreshRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'RefreshRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AsIs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AsIs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AsIs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AsIs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AsIs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'ItemNamePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AllItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AllItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AllItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AllItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups', @level2type=N'COLUMN',@level2name=N'AllItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Alias"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 84
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Servers"
            Begin Extent = 
               Top = 23
               Left = 295
               Bottom = 155
               Right = 446
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OpcGroups"
            Begin Extent = 
               Top = 18
               Left = 547
               Bottom = 219
               Right = 712
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2025
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1470
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_DAGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventAttributes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EventSubId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'EventSubId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventAttributes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventCategoryName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventCategoryName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventCategoryName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventCategoryName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'EventCategoryName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'AttributeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'AttributeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'AttributeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'AttributeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'AttributeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'AttributeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'AttributeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'AttributeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'AttributeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'AttributeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'OuterCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'OuterCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'OuterCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2130 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'OuterCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'OuterCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'OuterAttributeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'OuterAttributeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'OuterAttributeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'OuterAttributeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'OuterAttributeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'VarType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'VarType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'VarType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'VarType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs', @level2type=N'COLUMN',@level2name=N'VarType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[23] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "EventTypes"
            Begin Extent = 
               Top = 13
               Left = 628
               Bottom = 121
               Right = 780
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EventAttributes"
            Begin Extent = 
               Top = 104
               Left = 206
               Bottom = 277
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EventAttribute"
            Begin Extent = 
               Top = 169
               Left = 645
               Bottom = 270
               Right = 796
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1860
         Table = 2520
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[view_EventAttribs].[AttributeId], [view_EventAttribs].[OuterCategoryId], [view_EventAttribs].[EventCategoryId]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventAttribs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1755 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventCatrgoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventCatrgoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventCatrgoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2025 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventCatrgoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventCatrgoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventCatrgory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventCatrgory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventCatrgory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2490 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventCatrgory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'EventCatrgory'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1785' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'䂝�釪ᦉ鍻' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=5 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1785 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Condition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Condition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventCategories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'4245' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'�쏎찌䇣羠ᎄ幈ﻓ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=4245 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventCategories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "EventCategories"
            Begin Extent = 
               Top = 25
               Left = 281
               Bottom = 138
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EventTypes"
            Begin Extent = 
               Top = 23
               Left = 25
               Bottom = 136
               Right = 184
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1725
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1785' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'䂝�釪ᦉ鍻' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=5 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1785 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Condition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Condition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EventCategories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=4635 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap', @level2type=N'COLUMN',@level2name=N'SubCondition_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "EventCategories"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EventCategoryMap"
            Begin Extent = 
               Top = 6
               Left = 235
               Bottom = 119
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventCategoryMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'EventSub.Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventSubId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'внутренний, единый для всех AE-серверов  в БД' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'внешний, внутренний для каждого AE-сервера' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap', @level2type=N'COLUMN',@level2name=N'EventCategoryId_Srv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "EventTypes"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EventTypeMap"
            Begin Extent = 
               Top = 6
               Left = 235
               Bottom = 119
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_EventTypeMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "view_DAGroups"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 200
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ItemNamePatterns"
            Begin Extent = 
               Top = 6
               Left = 289
               Bottom = 162
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_ItemNamePatterns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_ItemNamePatterns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OuterTags"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 99
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2400
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_Jugsys_NewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_Jugsys_NewItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[25] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Tags"
            Begin Extent = 
               Top = 6
               Left = 481
               Bottom = 275
               Right = 632
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Tag2Group"
            Begin Extent = 
               Top = 6
               Left = 241
               Bottom = 217
               Right = 392
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "view_DAGroups"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 303
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1080
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_OpcItemConfigs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_OpcItemConfigs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2505 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3705 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3180 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=4110 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'IdParent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'IdParent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'IdParent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'IdParent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch', @level2type=N'COLUMN',@level2name=N'IdParent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[50] 4[24] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tSchm_ObjList (GES.dbo)"
            Begin Extent = 
               Top = 185
               Left = 285
               Bottom = 340
               Right = 569
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tR_Classifier (GES.dbo)"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tR_Classifier_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tSchm_ObjList_1"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 152
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tSchm_Relation (GES.dbo)"
            Begin Extent = 
               Top = 128
               Left = 701
               Bottom = 312
               Right = 948
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2775
         Table = 3840
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[viewOpc_Cell_Switch].[Type], [viewOpc_Cell_Switch].[ParentName] DESC, [viewOpc_Cell_Switch].[ParentTypeId], [viewOpc_Cell_Switch].[TypeId]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tSchm_ObjList (GES.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 305
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tR_Classifier (GES.dbo)"
            Begin Extent = 
               Top = 5
               Left = 364
               Bottom = 223
               Right = 523
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tSchm_ObjList (GES.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 186
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tSchm_ObjList_1"
            Begin Extent = 
               Top = 1
               Left = 367
               Bottom = 208
               Right = 526
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tR_Classifier (GES.dbo)"
            Begin Extent = 
               Top = 320
               Left = 7
               Bottom = 433
               Right = 166
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tR_Classifier_1"
            Begin Extent = 
               Top = 325
               Left = 172
               Bottom = 438
               Right = 331
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2310
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 2280
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Bus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Bus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Bus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2505 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'SwitchName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "list"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PsCls"
            Begin Extent = 
               Top = 6
               Left = 235
               Bottom = 119
               Right = 394
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CellCls"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 233
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SwCls"
            Begin Extent = 
               Top = 120
               Left = 235
               Bottom = 233
               Right = 394
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2805
         Table = 3525
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[viewOpc_Ps_Cell_Switch].[ParentName] DESC, [viewOpc_Ps_Cell_Switch].[SwitchTypeName] DESC, [viewOpc_Ps_Cell_Switch].[SwitchName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewOpc_Ps_Cell_Switch'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㾾歘촖䠀⢊�렉' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'踊闛䘗骝챦቎ﰱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'AliasId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'AliasId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ServerId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'颈녣װ䲭鮇ꞁ쭁䭲' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID параметра' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Parameter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Parameter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Бинарная маска (для дискретных тэгов)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'BinMask' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'BinMask' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'BitMask'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'無鮈ፏ䃪䪿蟥磏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID объекта в системе GES' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ObjectId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ObjectId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=4815 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Источник события (SOURCE внешнего OPCAE-сервера)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'OuterSourse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'OuterSourse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1935 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Область (атрибут AREAS внешнего OPCAE-сервера)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'OuterArea' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'OuterArea' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Tags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'3045' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'஥࿻䯭ᖩ쇥⬑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=3 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3045 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ObjectDescription' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ObjectDescription' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ObjectDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'3645' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'磕㮝胛䧣⎘≶䩮싞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=6 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3645 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'pDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ྦ眶髆䎨�䪇埵귙' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=7 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Единица измерения' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Measure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Measure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Нормальное состояние=0 (для телесигналов)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ZeroNormalState'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1590' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ꡮ櫳鏻䍝梂〸貊셞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=8 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1590 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Текст нормального состояния' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'StateNormName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'StateNormName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateNormName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2400' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ꩨ姎뷿䐰쮁旳⨽' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=9 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2400 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Текст ненормального состояния' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'StateAbnormName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'StateAbnormName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'StateAbnormName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'酠＝ࣰ䍭뢰鑎ﶰ瀯' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=5 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2895 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Parameter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Parameter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Parameters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags', @level2type=N'COLUMN',@level2name=N'ParameterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 288
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 276
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 311
               Right = 613
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 13125
         Alias = 2265
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vParametersTags'
GO
