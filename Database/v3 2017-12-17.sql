USE [HinhHocHoaHinh]
GO
/****** Object:  Table [dbo].[tbl_baiviet]    Script Date: 12/17/2017 12:19:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_baiviet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](200) NOT NULL,
	[tomtat] [nvarchar](1000) NOT NULL,
	[imgthumb] [varchar](100) NOT NULL,
	[noidung] [nvarchar](2000) NOT NULL,
	[ngaydang] [datetime] NOT NULL,
	[maloai] [int] NOT NULL,
 CONSTRAINT [PK_tbl_baiviet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_baiviethot]    Script Date: 12/17/2017 12:19:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_baiviethot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_baiviet] [int] NOT NULL,
	[announcements] [int] NOT NULL,
	[inup] [datetime] NULL,
 CONSTRAINT [PK_tbl_baiviethot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_loaibaiviet]    Script Date: 12/17/2017 12:19:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_loaibaiviet](
	[maloai] [int] IDENTITY(1,1) NOT NULL,
	[tenloai] [nvarchar](50) NOT NULL,
	[id_trang] [int] NOT NULL,
 CONSTRAINT [PK_tbl_loaibaiviet] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_taikhoan]    Script Date: 12/17/2017 12:19:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_taikhoan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_tbl_taikhoan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_trang]    Script Date: 12/17/2017 12:19:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_trang](
	[id_trang] [int] IDENTITY(1,1) NOT NULL,
	[tentrang] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_trang] PRIMARY KEY CLUSTERED 
(
	[id_trang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_baiviet] ON 

INSERT [dbo].[tbl_baiviet] ([id], [ten], [tomtat], [imgthumb], [noidung], [ngaydang], [maloai]) VALUES (1, N'Alberta Smith', N' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pharetra, tellus sit amet congue vulputate, nisi erat iaculis nibh, vitae feugiat sapien ante eget mauris. Cras elit nisl, rhoncus nec iaculis ultricies, feugiat eget sapien. Pellentesque ac felis tellus. Aenean sollicitudin imperdiet arcu, vitae dignissim est posuere id.', N'/Uploads/images/4(1).jpg', N'<p>
	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pharetra, tellus sit amet congue vulputate, nisi erat iaculis nibh, vitae feugiat sapien ante eget mauris. Cras elit nisl, rhoncus nec iaculis ultricies, feugiat eget sapien. Pellentesque ac felis tellus. Aenean sollicitudin imperdiet arcu, vitae dignissim est posuere id.</p>
<p>
	<img alt="" src="/Uploads/images/4(1).jpg" style="width: 500px; height: 281px;" /></p>
', CAST(N'2017-11-11T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[tbl_baiviet] ([id], [ten], [tomtat], [imgthumb], [noidung], [ngaydang], [maloai]) VALUES (3, N'Changes in the Class Schedule', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pharetra, tellus sit amet congue vulputate, nisi erat iaculis nibh, vitae feugiat sapien ante eget mauris. Cras elit nisl, rhoncus nec iaculis ultricies, feugiat eget sapien.', N'', N'<p>	T&ocirc;i l&agrave; ai giữa cuộc đời n&agrave;y ???</p><p>	<img alt="" src="/Uploads/images/2.jpg" style="width: 534px; height: 300px;" /></p><p>	Em l&agrave; ai t&igrave;m đến n&oacute;i đ&acirc;y<br />	H&aacute;t c&aacute;i ĐKM&nbsp;</p><p>	<img alt="" src="/Uploads/images/4(1).jpg" style="width: 200px; height: 112px;" /></p>', CAST(N'2017-11-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[tbl_baiviet] ([id], [ten], [tomtat], [imgthumb], [noidung], [ngaydang], [maloai]) VALUES (4, N'Homework Task for February 04, 2010', N'Lorem ipsum dolor sit amet, con3sectetur adipiscing elit. Etiam pharetra, tellus sit amet congue vulputate, nisi erat iaculis nibh, vitae feugiat sapien ante eget mauris. Cras elit nisl, rhoncus nec iaculis ultricies, feugiat eget sapien.', N'', N'<p>	T&ocirc;i l&agrave; ai giữa cuộc đời n&agrave;y ???</p><p>	<img alt="" src="/Uploads/images/2.jpg" style="width: 534px; height: 300px;" /></p><p>	Em l&agrave; ai t&igrave;m đến n&oacute;i đ&acirc;y<br />	H&aacute;t c&aacute;i ĐKM&nbsp;</p><p>	<img alt="" src="/Uploads/images/4(1).jpg" style="width: 200px; height: 112px;" /></p>', CAST(N'2017-12-11T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[tbl_baiviet] ([id], [ten], [tomtat], [imgthumb], [noidung], [ngaydang], [maloai]) VALUES (6, N'Country Tour Details', N'In fringilla pharetra purus, semper vulputate ligula cursus in. Donec at nunc nec dui laoreet porta eu eu ipsum. Sed eget lacus sit amet risus elementum dictum. Pellentesque sit amet imperdiet nunc. Aenean tellus mi, adipiscing sit amet laoreet eget, lobortis quis nisl. Quisque volutpat urna orci, id gravida nisi. Nullam posuere interdum est sit amet aliquam.', N'images/shutterstock_26085196.jpg', N'<p>	T&ocirc;i l&agrave; ai giữa cuộc đời n&agrave;y ???</p><p>	<img alt="" src="/Uploads/images/2.jpg" style="width: 534px; height: 300px;" /></p><p>	Em l&agrave; ai t&igrave;m đến n&oacute;i đ&acirc;y<br />	H&aacute;t c&aacute;i ĐKM&nbsp;</p><p>	<img alt="" src="/Uploads/images/4(1).jpg" style="width: 200px; height: 112px;" /></p>', CAST(N'2017-01-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[tbl_baiviet] ([id], [ten], [tomtat], [imgthumb], [noidung], [ngaydang], [maloai]) VALUES (7, N'Tôi là ai giữa chốn này ?', N'Đây là bài viết linh tinh', N'', N'<p>
	H&ocirc;m n&agrave;y bạn l&agrave; ai ?</p>
<p>
	<img alt="" src="/Uploads/images/2.jpg" style="width: 200px; height: 112px;" /></p>
', CAST(N'2017-12-14T20:13:30.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[tbl_baiviet] OFF
SET IDENTITY_INSERT [dbo].[tbl_baiviethot] ON 

INSERT [dbo].[tbl_baiviethot] ([id], [id_baiviet], [announcements], [inup]) VALUES (15, 3, 1, CAST(N'2017-12-16T21:03:29.000' AS DateTime))
INSERT [dbo].[tbl_baiviethot] ([id], [id_baiviet], [announcements], [inup]) VALUES (16, 6, 1, CAST(N'2017-12-16T21:07:26.000' AS DateTime))
INSERT [dbo].[tbl_baiviethot] ([id], [id_baiviet], [announcements], [inup]) VALUES (17, 1, 1, CAST(N'2017-12-16T21:08:20.000' AS DateTime))
INSERT [dbo].[tbl_baiviethot] ([id], [id_baiviet], [announcements], [inup]) VALUES (18, 4, 1, CAST(N'2017-12-16T21:10:01.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_baiviethot] OFF
SET IDENTITY_INSERT [dbo].[tbl_loaibaiviet] ON 

INSERT [dbo].[tbl_loaibaiviet] ([maloai], [tenloai], [id_trang]) VALUES (1, N'Lịch sử hình thành và phát triển', 1)
INSERT [dbo].[tbl_loaibaiviet] ([maloai], [tenloai], [id_trang]) VALUES (2, N'Tầm quan trọng của môn học', 1)
INSERT [dbo].[tbl_loaibaiviet] ([maloai], [tenloai], [id_trang]) VALUES (3, N'Vai trò của môn học', 1)
INSERT [dbo].[tbl_loaibaiviet] ([maloai], [tenloai], [id_trang]) VALUES (4, N'Đại cương về phép chiếu', 2)
INSERT [dbo].[tbl_loaibaiviet] ([maloai], [tenloai], [id_trang]) VALUES (5, N'Biểu diễn', 2)
INSERT [dbo].[tbl_loaibaiviet] ([maloai], [tenloai], [id_trang]) VALUES (6, N'Bài toán vị trí', 2)
INSERT [dbo].[tbl_loaibaiviet] ([maloai], [tenloai], [id_trang]) VALUES (7, N'Bài toán lượng giác', 2)
INSERT [dbo].[tbl_loaibaiviet] ([maloai], [tenloai], [id_trang]) VALUES (8, N'Bài toán giao', 2)
INSERT [dbo].[tbl_loaibaiviet] ([maloai], [tenloai], [id_trang]) VALUES (9, N'Tài nguyên', 3)
INSERT [dbo].[tbl_loaibaiviet] ([maloai], [tenloai], [id_trang]) VALUES (10, N'Hỗ trợ', 4)
SET IDENTITY_INSERT [dbo].[tbl_loaibaiviet] OFF
SET IDENTITY_INSERT [dbo].[tbl_taikhoan] ON 

INSERT [dbo].[tbl_taikhoan] ([id], [username], [password], [role]) VALUES (1, N'admin', N'admin', 0)
SET IDENTITY_INSERT [dbo].[tbl_taikhoan] OFF
SET IDENTITY_INSERT [dbo].[tbl_trang] ON 

INSERT [dbo].[tbl_trang] ([id_trang], [tentrang]) VALUES (1, N'Giới thiệu môn học')
INSERT [dbo].[tbl_trang] ([id_trang], [tentrang]) VALUES (2, N'Các bài toán')
INSERT [dbo].[tbl_trang] ([id_trang], [tentrang]) VALUES (3, N'Tài nguyên')
INSERT [dbo].[tbl_trang] ([id_trang], [tentrang]) VALUES (4, N'Hỗ trợ')
SET IDENTITY_INSERT [dbo].[tbl_trang] OFF
ALTER TABLE [dbo].[tbl_baiviet]  WITH CHECK ADD  CONSTRAINT [FK_tbl_baiviet_tbl_loaibaiviet] FOREIGN KEY([maloai])
REFERENCES [dbo].[tbl_loaibaiviet] ([maloai])
GO
ALTER TABLE [dbo].[tbl_baiviet] CHECK CONSTRAINT [FK_tbl_baiviet_tbl_loaibaiviet]
GO
ALTER TABLE [dbo].[tbl_loaibaiviet]  WITH CHECK ADD  CONSTRAINT [FK_tbl_loaibaiviet_tbl_trang] FOREIGN KEY([id_trang])
REFERENCES [dbo].[tbl_trang] ([id_trang])
GO
ALTER TABLE [dbo].[tbl_loaibaiviet] CHECK CONSTRAINT [FK_tbl_loaibaiviet_tbl_trang]
GO
