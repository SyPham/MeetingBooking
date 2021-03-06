USE [MeetingRoomBooking]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 5/27/2019 1:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[AreaID] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [nvarchar](255) NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[Position] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_Area_1] PRIMARY KEY CLUSTERED 
(
	[AreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 5/27/2019 1:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[FacultyID] [int] IDENTITY(1,1) NOT NULL,
	[FacultyName] [nvarchar](255) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[Visible] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[UpdateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LineRoom]    Script Date: 5/27/2019 1:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineRoom](
	[LineRoomID] [int] IDENTITY(1,1) NOT NULL,
	[LineRoomName] [nvarchar](255) NULL,
	[Content] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[TimeStart] [datetime] NULL,
	[TimeEnd] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
	[NumberPerson] [int] NULL,
	[Posititon] [int] NULL,
	[RoomID] [int] NULL,
 CONSTRAINT [PK_LineRoom] PRIMARY KEY CLUSTERED 
(
	[LineRoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/27/2019 1:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](50) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Seat] [int] NULL,
	[PhoneCall] [bit] NULL,
	[VideoCall] [bit] NULL,
	[Position] [int] NULL,
	[AreaID] [int] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[NumberPeople] [int] NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/27/2019 1:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NULL,
	[Visible] [bit] NULL,
	[Permission] [int] NULL,
	[Position] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[FullName] [nvarchar](255) NULL,
	[Mobi] [nvarchar](50) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[FacultyID] [int] NULL,
	[Roles] [bit] NULL,
	[UpdateTime] [datetime] NULL,
	[UpdateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([AreaID], [AreaName], [Avatar], [Description], [CreateTime], [UpdateTime], [Position], [CreateBy], [UpdateBy], [Visible]) VALUES (1, N'Cơ Sở 1-DKB', N'\Content\Images\room1.jpg', N'Địa chỉ: 530 Đại lộ Bình Dương, P. Hiệp Thành, Tp. Thủ Dầu Một, Bình Dương

Điện thoại: (0274) 3822847 – (0274) 3870795 ', NULL, CAST(N'2019-05-25 09:50:32.797' AS DateTime), NULL, NULL, N'Sơn Nguyễn.Hôk', 1)
INSERT [dbo].[Area] ([AreaID], [AreaName], [Avatar], [Description], [CreateTime], [UpdateTime], [Position], [CreateBy], [UpdateBy], [Visible]) VALUES (2, N'Cơ Sở 2-DKB', N'\Content\Images\room2.jpg', N'Cơ sở 2: 333 đường Thuận Giao 16,phường Thuận Giao, thị xã Thuận An, tỉnh Bình Dương', NULL, CAST(N'2019-05-25 08:03:05.470' AS DateTime), NULL, NULL, N'Sơn Nguyễn.Hôk', 0)
SET IDENTITY_INSERT [dbo].[Area] OFF
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([FacultyID], [FacultyName], [Avatar], [Description], [Position], [Visible], [CreateTime], [UpdateTime], [CreateBy], [UpdateBy]) VALUES (1, N'Khoa Đại Cương', N'\Content\Images\room1.jpg', N'Khoa Đại Cương DKB', NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Faculty] ([FacultyID], [FacultyName], [Avatar], [Description], [Position], [Visible], [CreateTime], [UpdateTime], [CreateBy], [UpdateBy]) VALUES (3, N'Khoa Tài Chính-Ngân Hàng', N'\Content\Images\room3.jpg', N'Khoa Tài Chính-Ngân Hàng DKB', NULL, 0, NULL, CAST(N'2019-05-24 11:40:46.750' AS DateTime), NULL, N'Sơn Nguyễn.Hôk')
INSERT [dbo].[Faculty] ([FacultyID], [FacultyName], [Avatar], [Description], [Position], [Visible], [CreateTime], [UpdateTime], [CreateBy], [UpdateBy]) VALUES (4, N'Khoa Kỹ thuật-Công Nghệ', N'\Content\Images\room4.jpg', N'Khoa Kỹ thuật-Công Nghệ DKB', NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Faculty] ([FacultyID], [FacultyName], [Avatar], [Description], [Position], [Visible], [CreateTime], [UpdateTime], [CreateBy], [UpdateBy]) VALUES (5, N'Khoa Quản Trị', N'\Content\Images\room5.jpg', N'Khoa Quản Trị DKB', NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Faculty] OFF
SET IDENTITY_INSERT [dbo].[LineRoom] ON 

INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (38, N'Họp cho vui', N'Chơi thôi', N'Chuẩn bị máy chiếu để xem phim', 1, CAST(N'2019-05-21 07:50:00.000' AS DateTime), CAST(N'2019-05-21 08:30:00.000' AS DateTime), N'admin', CAST(N'2019-05-18 07:42:04.753' AS DateTime), NULL, NULL, 21, NULL, 1)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (39, N'Test trùng hợp', N'sa', N'', 1, CAST(N'2019-05-21 08:50:00.000' AS DateTime), CAST(N'2019-05-21 09:30:00.000' AS DateTime), N'admin', CAST(N'2019-05-18 07:45:37.627' AS DateTime), NULL, NULL, 21, NULL, 2)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (41, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-03-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 3)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (42, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 4)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (43, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 5)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (44, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 6)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (45, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 8)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (46, N'Họp cho vui', N'Chơi thôi', N'Chuẩn bị máy chiếu để xem phim', 1, CAST(N'2019-05-21 07:50:00.000' AS DateTime), CAST(N'2019-05-21 08:30:00.000' AS DateTime), N'admin', CAST(N'2019-05-18 07:42:04.753' AS DateTime), NULL, NULL, 21, NULL, 8)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (47, N'Test trùng hợp', N'sa', N'', 1, CAST(N'2019-05-21 08:50:00.000' AS DateTime), CAST(N'2019-05-21 09:30:00.000' AS DateTime), N'admin', CAST(N'2019-05-18 07:45:37.627' AS DateTime), NULL, NULL, 21, NULL, 9)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (48, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 11)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (49, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 1)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (50, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 2)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (51, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 3)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (52, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 4)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (53, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 5)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (54, N'Họp cho vui', N'Chơi thôi', N'Chuẩn bị máy chiếu để xem phim', 1, CAST(N'2019-05-21 07:50:00.000' AS DateTime), CAST(N'2019-05-21 08:30:00.000' AS DateTime), N'admin', CAST(N'2019-05-18 07:42:04.753' AS DateTime), NULL, NULL, 21, NULL, 6)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (55, N'Test trùng hợp', N'sa', N'', 1, CAST(N'2019-05-21 08:50:00.000' AS DateTime), CAST(N'2019-05-21 09:30:00.000' AS DateTime), N'admin', CAST(N'2019-05-18 07:45:37.627' AS DateTime), NULL, NULL, 21, NULL, 6)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (56, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 8)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (57, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 9)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (58, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 11)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (59, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 1)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (60, N'Test', N'', N'', 1, CAST(N'2019-05-21 15:45:00.000' AS DateTime), CAST(N'2019-05-21 16:45:00.000' AS DateTime), N'admin', CAST(N'2019-05-20 15:47:04.377' AS DateTime), NULL, NULL, 23, NULL, 2)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (61, N'Test', N'meeting test', N'', 1, CAST(N'2019-05-23 13:27:00.000' AS DateTime), CAST(N'2019-05-23 14:27:00.000' AS DateTime), N'admin', CAST(N'2019-05-23 13:29:20.830' AS DateTime), NULL, NULL, 12, NULL, 1)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (62, N'tes', N'', N'', 1, CAST(N'2019-05-23 13:27:00.000' AS DateTime), CAST(N'2019-05-30 14:27:00.000' AS DateTime), N'admin', CAST(N'2019-05-23 13:30:04.763' AS DateTime), NULL, NULL, 12, NULL, 4)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (63, N'sa', N'content', N'', 1, CAST(N'2019-05-30 14:32:00.000' AS DateTime), CAST(N'2019-05-31 15:32:00.000' AS DateTime), N'admin', CAST(N'2019-05-23 13:33:35.997' AS DateTime), NULL, NULL, 3, NULL, 4)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (64, N'sâsa', N'sa', N'', 1, CAST(N'2019-05-26 13:33:00.000' AS DateTime), CAST(N'2019-05-26 14:33:00.000' AS DateTime), N'admin', CAST(N'2019-05-23 13:34:29.403' AS DateTime), NULL, NULL, 3, NULL, 8)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (65, N'ds', N'', N'', 1, CAST(N'2019-05-27 14:10:00.000' AS DateTime), CAST(N'2019-05-27 14:56:00.000' AS DateTime), N'haiit', CAST(N'2019-05-23 13:59:23.170' AS DateTime), NULL, NULL, 4, NULL, 8)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (67, N'dsa', N'', N'', 1, CAST(N'2019-05-24 11:42:00.000' AS DateTime), CAST(N'2019-05-24 12:42:00.000' AS DateTime), N'lyit', CAST(N'2019-05-24 11:43:10.940' AS DateTime), NULL, NULL, 3, NULL, 1)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (69, N'test', N'content', N'note', 1, CAST(N'2019-05-25 08:25:00.000' AS DateTime), CAST(N'2019-05-25 09:25:00.000' AS DateTime), N'admin', CAST(N'2019-05-25 08:27:01.217' AS DateTime), NULL, NULL, 9, NULL, 1)
INSERT [dbo].[LineRoom] ([LineRoomID], [LineRoomName], [Content], [Description], [Status], [TimeStart], [TimeEnd], [CreateBy], [CreateTime], [UpdateBy], [UpdateTime], [NumberPerson], [Posititon], [RoomID]) VALUES (70, N'res', N'', N'', 1, CAST(N'2019-05-27 10:09:00.000' AS DateTime), CAST(N'2019-05-27 11:09:00.000' AS DateTime), N'admin', CAST(N'2019-05-27 10:12:43.553' AS DateTime), NULL, NULL, 3, NULL, 1)
SET IDENTITY_INSERT [dbo].[LineRoom] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomID], [RoomName], [Avatar], [Description], [Seat], [PhoneCall], [VideoCall], [Position], [AreaID], [UpdateBy], [UpdateTime], [CreateBy], [CreateTime], [NumberPeople], [Visible]) VALUES (1, N'Phòng K101', N'/Uploads/Images/517201991914AM.jpg', N'', 50, 1, 0, NULL, 1, N'Sơn Nguyễn.Hôk', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Avatar], [Description], [Seat], [PhoneCall], [VideoCall], [Position], [AreaID], [UpdateBy], [UpdateTime], [CreateBy], [CreateTime], [NumberPeople], [Visible]) VALUES (2, N'Phòng K102', N'\Content\Images\room2.jpg', NULL, 25, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Avatar], [Description], [Seat], [PhoneCall], [VideoCall], [Position], [AreaID], [UpdateBy], [UpdateTime], [CreateBy], [CreateTime], [NumberPeople], [Visible]) VALUES (3, N'Phòng K103', N'\Content\Images\room3.jpg', NULL, 10, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Avatar], [Description], [Seat], [PhoneCall], [VideoCall], [Position], [AreaID], [UpdateBy], [UpdateTime], [CreateBy], [CreateTime], [NumberPeople], [Visible]) VALUES (4, N'Phòng K104', N'/Uploads/Images/5272019115805AM.jpg', N'', 22, 0, 0, NULL, 1, N'Sơn Nguyễn', CAST(N'2019-05-13 22:21:07.493' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Avatar], [Description], [Seat], [PhoneCall], [VideoCall], [Position], [AreaID], [UpdateBy], [UpdateTime], [CreateBy], [CreateTime], [NumberPeople], [Visible]) VALUES (5, N'Phòng K201', N'\Content\Images\room5.jpg', N'', 5, 1, 1, NULL, 2, N'Nguyễn Văn Quyền', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Avatar], [Description], [Seat], [PhoneCall], [VideoCall], [Position], [AreaID], [UpdateBy], [UpdateTime], [CreateBy], [CreateTime], [NumberPeople], [Visible]) VALUES (8, N'Phòng K202', N'\Content\Images\room9.jpg', N'', 30, 0, 0, NULL, 2, N'Nguyễn Văn Quyền', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Avatar], [Description], [Seat], [PhoneCall], [VideoCall], [Position], [AreaID], [UpdateBy], [UpdateTime], [CreateBy], [CreateTime], [NumberPeople], [Visible]) VALUES (9, N'Phòng K203', N'\Content\Images\room10.jpg', NULL, 20, 1, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Avatar], [Description], [Seat], [PhoneCall], [VideoCall], [Position], [AreaID], [UpdateBy], [UpdateTime], [CreateBy], [CreateTime], [NumberPeople], [Visible]) VALUES (20, N'Phòng K203', N'/Uploads/Images/5242019113454AM.jpg', N'', 123, 1, 1, NULL, 2, N'Sơn Nguyễn.Hôk', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Avatar], [Description], [Seat], [PhoneCall], [VideoCall], [Position], [AreaID], [UpdateBy], [UpdateTime], [CreateBy], [CreateTime], [NumberPeople], [Visible]) VALUES (21, N'Phòng K204', N'/Uploads/Images/5242019113454AM.jpg', N'', 23, 1, 1, NULL, 2, N'Sơn Nguyễn.Hôk', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Room] OFF
INSERT [dbo].[User] ([UserID], [Password], [Visible], [Permission], [Position], [CreateBy], [CreateTime], [FullName], [Mobi], [Avatar], [Email], [FacultyID], [Roles], [UpdateTime], [UpdateBy]) VALUES (N'admin', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, 1, 1, N'sonit', CAST(N'2019-05-25 10:15:15.673' AS DateTime), N'Sơn Nguyễn', N'0348539913', N'/Content/Images/nopic.png', N'ngocson9556@gmail.com', 1, 1, NULL, N'Sơn Nguyễn')
INSERT [dbo].[User] ([UserID], [Password], [Visible], [Permission], [Position], [CreateBy], [CreateTime], [FullName], [Mobi], [Avatar], [Email], [FacultyID], [Roles], [UpdateTime], [UpdateBy]) VALUES (N'lyit', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, NULL, NULL, N'Sơn Nguyễn.Hôk', NULL, N'Nguyễn Bùi Cẩm Ly', N'0976666060', N'/Content/Images/nopic.png', N'lyit@gmail.com', 1, 1, NULL, N'Sơn Nguyễn.Hôk')
INSERT [dbo].[User] ([UserID], [Password], [Visible], [Permission], [Position], [CreateBy], [CreateTime], [FullName], [Mobi], [Avatar], [Email], [FacultyID], [Roles], [UpdateTime], [UpdateBy]) VALUES (N'user', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, NULL, NULL, N'quyenit', NULL, N'Nguyễn Văn Quyền', N'0972332803', N'/Uploads/Images/518201911252PM.jpg', N'vanquyenktktbd@gmail.com', 4, 0, NULL, N'Sơn Nguyễn.Hôk')
