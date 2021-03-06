GO
USE [master]

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'Mechanical_Keyboard_HE151102')
BEGIN
	ALTER DATABASE [Mechanical_Keyboard_HE151102] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [Mechanical_Keyboard_HE151102] SET ONLINE;
	DROP DATABASE [Mechanical_Keyboard_HE151102];
END

GO

CREATE DATABASE [Mechanical_Keyboard_HE151102]
GO


USE [Mechanical_Keyboard_HE151102]
GO
/****** Object:  Table [dbo].[Accounts_HE151102]    Script Date: 3/22/2022 12:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts_HE151102](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NOT NULL,
	[first_name] [nvarchar](20) NOT NULL,
	[last_name] [nvarchar](20) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[phone] [char](10) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories_HE151102]    Script Date: 3/22/2022 12:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories_HE151102](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[img] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Items_HE151102]    Script Date: 3/22/2022 12:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Items_HE151102](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[prod_id] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_HE151102]    Script Date: 3/22/2022 12:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_HE151102](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[acc_id] [int] NULL,
	[OrderDate] [datetime] NULL,
	[total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_HE151102]    Script Date: 3/22/2022 12:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_HE151102](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[brand] [varchar](20) NULL,
	[price] [float] NULL,
	[c_id] [int] NULL,
	[img_1] [nvarchar](500) NULL,
	[img_2] [nvarchar](500) NULL,
	[img_3] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
	[keyword] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts_HE151102] ON 

INSERT [dbo].[Accounts_HE151102] ([id], [username], [password], [first_name], [last_name], [address], [phone], [created_at], [type]) VALUES (1, N'admin', N'admin', N'Admin', N'Admin', N'Server', N'1111111111', CAST(N'2022-03-10T01:37:20.777' AS DateTime), 1)
INSERT [dbo].[Accounts_HE151102] ([id], [username], [password], [first_name], [last_name], [address], [phone], [created_at], [type]) VALUES (2, N'user1', N'123456', N'Nguyễn ', N'Văn A', N'Ðại Học FPT', N'0983685621', CAST(N'2022-03-10T01:37:20.827' AS DateTime), 0)
INSERT [dbo].[Accounts_HE151102] ([id], [username], [password], [first_name], [last_name], [address], [phone], [created_at], [type]) VALUES (3, N'user2', N'123456', N'Trần Thị', N'B', N'Hà Nội', N'0987352761', CAST(N'2022-03-10T01:37:20.870' AS DateTime), 0)
INSERT [dbo].[Accounts_HE151102] ([id], [username], [password], [first_name], [last_name], [address], [phone], [created_at], [type]) VALUES (4, N'adu', N'adu', N'Eryk', N'Robert', N'Hanoi', N'12312312  ', CAST(N'2022-03-15T02:24:39.033' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Accounts_HE151102] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories_HE151102] ON 

INSERT [dbo].[Categories_HE151102] ([id], [name], [description], [img]) VALUES (1, N'Keyboard', N'Bộ Bàn Phím đầy đủ dùng luôn', N'img/shop01.jpg')
INSERT [dbo].[Categories_HE151102] ([id], [name], [description], [img]) VALUES (2, N'Kit', N'Chỉ bao gồm khung bàn phím', N'img/shop02.jpg')
INSERT [dbo].[Categories_HE151102] ([id], [name], [description], [img]) VALUES (3, N'Switch', N'Nút bấm, là linh hồn của bàn phím cơ', N'img/shop03.jpg')
INSERT [dbo].[Categories_HE151102] ([id], [name], [description], [img]) VALUES (4, N'Custom Tool', N'Giúp bạn cá nhân hóa bàn phím của mình dễ dàng hơn', N'img/shop04.jpg')
INSERT [dbo].[Categories_HE151102] ([id], [name], [description], [img]) VALUES (5, N'Keycap', N'Cho bàn phím đẹp hơn', N'img/shop05.jpg')
INSERT [dbo].[Categories_HE151102] ([id], [name], [description], [img]) VALUES (6, N'Accessory', N'Phụ kiện hỗ trợ trải nghiệm, bảo quản bàn phím cơ', N'img/shop06.jpg')
SET IDENTITY_INSERT [dbo].[Categories_HE151102] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Items_HE151102] ON 

INSERT [dbo].[Order_Items_HE151102] ([id], [order_id], [prod_id], [quantity]) VALUES (1, 1, 3, 2)
INSERT [dbo].[Order_Items_HE151102] ([id], [order_id], [prod_id], [quantity]) VALUES (2, 1, 2, 1)
INSERT [dbo].[Order_Items_HE151102] ([id], [order_id], [prod_id], [quantity]) VALUES (3, 2, 1, 1)
INSERT [dbo].[Order_Items_HE151102] ([id], [order_id], [prod_id], [quantity]) VALUES (4, 2, 2, 5)
INSERT [dbo].[Order_Items_HE151102] ([id], [order_id], [prod_id], [quantity]) VALUES (5, 3, 10, 12)
INSERT [dbo].[Order_Items_HE151102] ([id], [order_id], [prod_id], [quantity]) VALUES (6, 3, 22, 1)
INSERT [dbo].[Order_Items_HE151102] ([id], [order_id], [prod_id], [quantity]) VALUES (7, 4, 15, 3)
INSERT [dbo].[Order_Items_HE151102] ([id], [order_id], [prod_id], [quantity]) VALUES (8, 4, 23, 22)
INSERT [dbo].[Order_Items_HE151102] ([id], [order_id], [prod_id], [quantity]) VALUES (9, 5, 9, 10)
INSERT [dbo].[Order_Items_HE151102] ([id], [order_id], [prod_id], [quantity]) VALUES (10, 5, 7, 17)
INSERT [dbo].[Order_Items_HE151102] ([id], [order_id], [prod_id], [quantity]) VALUES (11, 5, 18, 15)
SET IDENTITY_INSERT [dbo].[Order_Items_HE151102] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders_HE151102] ON 

INSERT [dbo].[Orders_HE151102] ([id], [acc_id], [OrderDate], [total]) VALUES (1, 2, CAST(N'2022-03-10T19:51:41.133' AS DateTime), 4900)
INSERT [dbo].[Orders_HE151102] ([id], [acc_id], [OrderDate], [total]) VALUES (2, 2, CAST(N'2022-03-10T19:51:52.060' AS DateTime), 9450)
INSERT [dbo].[Orders_HE151102] ([id], [acc_id], [OrderDate], [total]) VALUES (3, 3, CAST(N'2022-03-10T19:51:57.023' AS DateTime), 202)
INSERT [dbo].[Orders_HE151102] ([id], [acc_id], [OrderDate], [total]) VALUES (4, 3, CAST(N'2022-03-10T19:52:03.950' AS DateTime), 8450)
INSERT [dbo].[Orders_HE151102] ([id], [acc_id], [OrderDate], [total]) VALUES (5, 2, CAST(N'2022-03-22T00:50:58.383' AS DateTime), 10020)
SET IDENTITY_INSERT [dbo].[Orders_HE151102] OFF
GO
SET IDENTITY_INSERT [dbo].[Products_HE151102] ON 

INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (1, N'FL MK870 ', N'- Layout:  TKL  ; <Br/>- Kết nối: 1 mode;<Br/> - Tính năng : Hotswap, LED RGB; <Br/>', N'FL Esport', 950, 2, N'https://cf.shopee.vn/file/3f771f0d99e049a47767af5838ff9942', N'https://hanoicomputercdn.com/media/product/61374_kit_ban_phim_flesport_k210_mk870_white_case_plate_pcb_led_0001_2.jpg', N'https://ae01.alicdn.com/kf/Hdbbcd37957944917ac7417b5e4abff07e.jpg_.webp', CAST(N'2022-03-10T19:43:25.867' AS DateTime), N' #custom, #good, #87')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (2, N'FK IK75', N'- Layout: 75% có núm; <Br/> -Kết nối: 3 mode; <Br/> - Tính năng: Hotswap. LED RGB ; <Br/>- Nổi bật: Pin 8000 mAh', N'FEKER', 1700, 2, N'https://cf.shopee.co.th/file/e881d310425cfcb489ca4312e3a84a8c', N'https://my-live-01.slatic.net/p/09f041860898f66bee033efc38a32e3e.jpg', N'https://i.ytimg.com/vi/06ztkRs2Wic/maxresdefault.jpg', CAST(N'2022-03-10T19:43:25.947' AS DateTime), N'#75, #led, #light ')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (3, N'IKBC CD87DP', N'- Layout:  TKL ; <Br/> - Kết nối: 1 mode; <Br/> - Tính năng : Keycap pbt double shot, Switch cherry', N'IKBC', 1600, 1, N'https://cf.shopee.vn/file/8fdfd6d1bb25252717be915058c6f076', N'https://cf.shopee.vn/file/0470a39ba8a78ce5a0330a2aa7338df0', N'https://cf.shopee.vn/file/291ae6cfbb4ddb440cce8c55f85881d8', CAST(N'2022-03-10T19:43:25.990' AS DateTime), N'#stock, #good, #87')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (4, N'FL CMK87', N'- Layout:  TKL ; <Br/> - Kết nối: 1 mode; <Br/> - Tính năng : Hotswap, LED RGB', N'FL Esport', 2500, 1, N'https://cf.shopee.vn/file/1754d56d1e7140eb4f8ba3b954fdff46', N'https://encrypted-tbn0.gstatic.com/images?https://cf.shopee.vn/file/1237b01d063fe09adf35551712f9a1d4', N'https://cf.shopee.vn/file/50fdf3a1221b95bb8f1725a5c90accb6', CAST(N'2022-03-12T00:53:23.227' AS DateTime), N'#stock, #good, #87')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (5, N'AKKO 3087', N'- Layout:  TKL  ; <Br/> - Kết nối: 1 mode;<Br/> - Tính năng : Keycap Dye-sub đẹp, Switch được Pre-lube', N'AKKO', 1500, 1, N'https://gearzone.vn/wp-content/uploads/2019/06/ying1.jpg', N'https://ae01.alicdn.com/kf/H2d68ab062b7845a6928e99dba2ab74b1j/Ban-u-Akko-3087-87-Ph-m-B-n-Ph-m-C-85-PBT-Lo-i.jpg_Q90.jpg_.webp', N'https://akko.com.vn/wp-content/uploads/2020/05/akko-world-tour-tokyo-3087-07.jpg', CAST(N'2022-03-12T00:54:20.240' AS DateTime), N'#mode #stock #87')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (6, N'Cherry Blue Switch', N'- Dòng: Clicky ;<Br/> - Nổi bật: cho cảm giác phản hồi gõ tốt, tiếng clicky ồn', N'Cherry', 10, 3, N'http://input.club/wp-content/uploads/2016/08/switch-setup-7.jpg', N'https://www.tncstore.vn/image/catalog/BAI%20VIET/MEDIA%20TNC%20NEWS/Switch/Cherry-MX-Blue-Switch---Animated-GIF_MXBlue-(1).gif', N'https://5.imimg.com/data5/UT/YW/HA/SELLER-73369645/refurbished-original-cherry-mx-blue-switches-500x500.jpg', CAST(N'2022-03-12T01:05:23.673' AS DateTime), N'#stock, #good, #best')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (7, N'Cherry Red Switch', N'- Dòng: Linear; <Br/>- Nổi bật: nút click mượt mà, không phát ra nhiều tiếng động', N'Cherry', 10, 3, N'https://cf.shopee.vn/file/0bac3dd6efc98803b9e60ea7719f61bb', N'https://www.tncstore.vn/image/catalog/BAI%20VIET/MEDIA%20TNC%20NEWS/Switch/Cherry-MX-Red-Switch---Animated-GIF_MXBlue_v001-(1).gif', N'https://bizweb.dktcdn.net/100/270/727/files/switch-ban-phim-co.jpg?v=1538109980764', CAST(N'2022-03-12T01:07:52.437' AS DateTime), N'#stock, #good, #best')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (8, N'Cherry Brown Switch', N'- Dòng: Tactile;<Br/>- Nổi bật: cho cảm giác phản hồi gõ tốt, cân bằng giữa làm việc và game', N'Cherry', 10, 3, N'https://cf.shopee.vn/file/805fbab05700a6f80399d16fd629bac2', N'https://banphimco.com/wp-content/uploads/2020/04/Brown-Switch-2.gif', N'https://www.furiouspaul.com/articles/images/keyboard/brown-key-switches2.jpg', CAST(N'2022-03-12T01:09:55.307' AS DateTime), N'#stock, #good, #best')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (9, N'Cherry Black Switch', N'- Dòng: Linear; <Br/>- Nổi bật: nút click mượt mà, lực bấm cao thỏa mãn tay ấn', N'Cherry', 10, 3, N'https://vietgear.vn/wp-content/uploads/2020/03/fe5MoY-QIPrdtBugwI6lMVG9iK3cbIZJuLmkMwuQu1Q.jpg', N'https://www.cherrymx.de/_Resources/Persistent/0/9/d/a/09da1f934b2447db44c5ef5a28f755238bf5135f/img-explosion-mxblack%402x.png', N'https://cf.shopee.vn/file/b3eedafef51263d3159b2348d10c164a', CAST(N'2022-03-12T01:12:09.510' AS DateTime), N'#stock, #good, #best')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (10, N'KTT Strawberry', N'- Dòng: Linear; <Br/>- Nổi bật: Công tắc rất mượt vì đã được pre-lube. Âm thanh clacky hay.', N'KTT', 8.5, 3, N'https://cf.shopee.vn/file/3e442f61641cc939b9e7e8cdbd276da9', N'https://cf.shopee.vn/file/5ab5c0398c12186f131d9a5796a6ea87', N'https://cf.shopee.vn/file/443057fe33a545bcc699887eedb0f50d', CAST(N'2022-03-12T01:13:54.530' AS DateTime), N'#stock, #best, #custom')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (11, N'Glorious Holy Panda', N'- Dòng: Tactile; <Br/>- Nổi bật: cho cảm giác phản hồi gõ tốt. Dóng khấc sớm hợp gu nhiều người', N'Glorious', 15, 3, N'https://cf.shopee.vn/file/2fee26bfa77c97bdbea4c7f3bb8c5a0d', N'https://cdn.shopify.com/s/files/1/0549/2681/products/layout_1000x.png?v=1599234835', N'https://cf.shopee.vn/file/5cd4c559d378c1356eba11d9903b78fe', CAST(N'2022-03-12T01:17:53.257' AS DateTime), N'#custom, #best')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (12, N'Glorious GMMK Pro', N'- Layout: 75% có núm;<Br/> -Kết nối: 1 mode; <Br/> - Tính năng: Hotswap. LED RGB ; <Br/>- Nổi bật: Built kim loại chắc chắn,layout tinh tế đi kèm giá phải chăng với chất lượng ', N'Glorious', 4300, 2, N'https://cf.shopee.ph/file/0c7054c6f1ee7721d226f59e0b157491', N'https://photo2.tinhte.vn/data/attachment-files/2021/06/5505927_DSC03825.jpg', N'https://www.playzone.vn/image/catalog/san%20pham/glorious/banphim/GMMK/a.JPG', CAST(N'2022-03-12T01:20:08.760' AS DateTime), N'#custom, #best, #led')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (13, N'AKKO Mod007', N'- Layout: 75% có núm;<Br/> -Kết nối: 1 mode;<Br/>- Tính năng: Hotswap. ; <Br/>- Nổi bật: Built kim loại, giá phải chăng với chất lượng ', N'AKKO', 3200, 2, N'https://cf.shopee.vn/file/b217a46c56a3de4157e1152ce9be716e', N'https://akkogear.com.vn/wp-content/uploads/2021/10/kit-ban-phim-co-akko-designer-studio-mod007-02.jpg', N'https://external-preview.redd.it/x8Fl5m0nCRexuhvqNFKjd2v91tkIe4E2zXsRFxpJD0c.png?width=640&crop=smart&format=pjpg&auto=webp&s=a79eb9e9be464b48d36c7330833496344c011f6b', CAST(N'2022-03-12T01:37:42.200' AS DateTime), N'#custom, #led')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (14, N'Keycap set World Tour', N'- Phục vụ nhiều Layout với 135 phím <Br/>- Profile: Cherry dễ làm quen <Br/> - Keycap được in Dye- sub cao cấp bền, màu đẹp', N'AKKO', 900, 5, N'https://cf.shopee.vn/file/6755e0c639faa289b113d532532252f7', N'https://akkogear.com.vn/wp-content/uploads/2020/07/49%E9%94%AE%E5%A2%9E%E8%A1%A5%E7%9B%92%E5%AD%90.jpg', N'https://tandoanh.cdn.vccloud.vn/wp-content/uploads/2021/04/AKKO-3108-World-Tour-Tokyo-R2-AKKO-Switch-H5.jpg', CAST(N'2022-03-12T01:44:39.430' AS DateTime), N'#beauty, #custom')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (15, N'IKBC CD108DP', N'- Layout:  Full Size ; <Br/>- Kết nối: 1 mode;<Br/> - Tính năng : Keycap stock tốt, cảm giác gõ chất lượng với chery switch; <Br/>', N'IKBC', 1900, 1, N'https://cf.shopee.vn/file/c98c94edb6a0d250a4b0593200f8e51b', N'https://www.ubuy.co.id/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvODFONWNBV0gwK0wuX0FDX1NMMTUwMF8uanBn.jpg', N'https://www.playzone.vn/image/catalog/san%20pham/IKBC/cd108/ANH%20T/93874094_226847975259614_4350329965611319296_n.jpg', CAST(N'2022-03-12T01:45:59.573' AS DateTime), N'#stock, #good, #108')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (16, N'IKBC W200', N'- Layout:  TKL  ;<Br/>- Kết nối: 2 mode;<Br/>- Tính năng : Keycap pbt double shot, Switch cherry, kết nối bluetooth', N'IKBC', 2300, 1, N'https://cf.shopee.vn/file/701f31f9e11d0387abe824b0b4c4c704', N'https://vietgear.vn/wp-content/uploads/2020/11/w200-1-450x450.jpg', N'https://voz.vn/attachments/img_6033-jpg.910549/', CAST(N'2022-03-12T01:48:37.213' AS DateTime), N' #stock, #good, #bluetooth')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (17, N'FL680', N'- Layout: 68 phím; <Br/>-Kết nối: 3 mode;<Br/> - Tính năng: Hotswap. LED RGB ; <Br/>- Nổi bật: Thiết kế nhỏ gọn tinh tế. built chắc chắn', N'FL Esport', 2100, 2, N'https://cf.shopee.vn/file/aab276380ff707a06db38317be41cd49', N'https://cf.shopee.vn/file/aab276380ff707a06db38317be41cd49', N'https://cf.shopee.ph/file/885bf62a543db1eaee1e98bf8467d926_tn', CAST(N'2022-03-12T01:50:50.273' AS DateTime), N'#')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (18, N'Túi Đựng Bàn Phím Cơ', N'- Thiết kế dày dặn. <Br/> - chống sốc cực tốt; <Br/> - Thuận tiện mang theo', N'Glorious', 650, 6, N'https://d1vm37nfym7tjl.cloudfront.net/web/image/product.image/6443/image_1024/T%C3%BAi%20%C4%91%E1%BB%B1ng%20b%C3%A0n%20ph%C3%ADm%20c%C6%A1%20Glorious%20Keyboard%20Case?unique=e188c24', N'https://cf.shopee.vn/file/18ca3b31d50d7bc54b69e938581dfe88', N'https://cf.shopee.vn/file/67248c3aef9da0ae312b33d31bbc615f', CAST(N'2022-03-12T02:07:15.100' AS DateTime), N'#go, #out, #support')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (19, N'Cọ Lube Giá Rẻ', N'- Hỗ Trợ lube Switch', N'Kelowa', 7, 4, N'https://zpro.vn/images/product/500x500/co-lube-switch-chuyen-dung.1604632933.jpg', N'https://vn-live-https://cf.shopee.vn/file/5eb84efeb7249a8324f6123dcfa9d5f6_tn', N'https://cf.shopee.vn/file/31069c9b42d4ca6027c388b4d85aa56c', CAST(N'2022-03-12T01:21:47.930' AS DateTime), N'#custom, #mode, #support')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (20, N'Cọ Lube Cao Cấp', N'- Hỗ Trợ lube switch tốt với đầu nhỏ cứng. <Br/> - Hạn chế được OverLube và lube không đều', N'Kelowa', 15, 4, N'https://cf.shopee.vn/file/1ab73dcf74c6ca9ccd61f179a12b6ad8', N'https://cf.shopee.vn/file/22f927fb934ba2d23c1adcf637a61a8b', N'https://i.ytimg.com/vi/4EaKBfLB28U/maxresdefault.jpg', CAST(N'2022-03-12T01:25:00.487' AS DateTime), N'#custom, #mode, #support')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (21, N'Switch Opener', N'- Hỗ Trợ mở Switch dễ dàng hơn. <Br/> - Hạn chết làm hỏng Switch và lá đồng bên trong ', N'Kelowa', 150, 4, N'https://cf.shopee.vn/file/b23218d5985a1ff245309a67b470c031', N'https://massdrop-s3.imgix.net/img_thread/1635704663630.072840235196857765983930-1.jpg?auto=format&fm=jpg&fit=crop&w=420&h=420&dpr=1&chromasub=444&q=70', N'https://cf.shopee.vn/file/c6c6abd16e2f870099cf224c6f588ab3', CAST(N'2022-03-12T01:28:54.323' AS DateTime), N'#custom, #mode, #support')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (22, N'Stem Picker', N'- Kẹp Stem lube Switch tiện dụng', N'Kelowa', 100, 4, N'https://cf.shopee.vn/file/4e4900f2f2cbb9b47f1a8ee58196f1bc', N'https://cf.shopee.vn/file/37333c4b28281f99b0e3c136c56a382b', N'https://lh3.googleusercontent.com/pw/AM-JKLW9EYZjoPLtL4hn_7Ir5R5XjfuhXH_FF6Id91BRxFLDBpGODzZ1rEhVT6hL1iWpbnX3Ckyq0x5OzNNHu5CF47exzHG1riLQ9_5X83NK88vIIjPuLezP-NrwN2mTgSb5sadRG9Dm8MK5dO9TM9k8uhxVbw=w1364-h969-no', CAST(N'2022-03-12T01:30:53.840' AS DateTime), N'#custom, #mode, #support')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (23, N'Switch Puller', N'- Hỗ trợ lấy Switch khỏi bàn phím Hotswap', N'Kelowa', 125, 4, N'https://ae01.alicdn.com/kf/HTB13Askc3mH3KVjSZKzq6z2OXXaI.jpg', N'https://flashquark.com/wp-content/uploads/2021/01/Kelowna-Switch-Puller.jpg', N'https://cf.shopee.vn/file/42efdf3a6f594c2d7774e4707bb1a763', CAST(N'2022-03-12T01:31:21.560' AS DateTime), N'#custom, #mode, #support')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (24, N'Keycap Set Olivia ', N'- Phục vụ nhiều Layout với 135 phím <Br/> - Profile: Cherry dễ làm quen<Br/>- Keycap được làm từ nhựa pbt doubleshot. <Br/> - Phối màu cổ điển bắt mắt', N'Glorious', 950, 5, N'https://anphat.com.vn/media/product/38907_keycap_e_dra_ekc7102_white_olivia__1_.jpg', N'https://cf.shopee.vn/file/cf156b3a95d12d40806eff08394f0571', N'https://cf.shopee.vn/file/b7b5a98e50079450745963f40b3f5c93', CAST(N'2022-03-12T23:17:34.127' AS DateTime), N'#custom, #beauty')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (25, N'Keycap Set Kon Momo', N'- Phục vụ nhiều Layout với 135 phím <Br/> - Profile: Cherry dễ làm quen<Br/> - Keycap được làm Dye-sub. <Br/> - Phối màu bắt mắt cùng hỗ trợ song ngữ nhật tiện dụng', N'Akko', 550, 5, N'https://cf.shopee.vn/file/909dc92dcfdb1a6840dbfae19841b3a1', N'https://cf.shopee.vn/file/47e252c1bf1bb5a4dee8cd0586c5f2b4', N'https://cf.shopee.vn/file/4d681df3286730419d3208b237391c06', CAST(N'2022-03-12T23:19:49.597' AS DateTime), N'#custom, #beauty')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (26, N'Keycap Cherry Beelzebul', N'- Phục vụ nhiều Layout với 135 phím <Br/> - Profile: Cherry dễ làm quen<Br/> - Keycap được làm từ nhựa pbt doubleshot. <Br/> - Phối màu đẹp dễ nhìn', N'Akko', 990, 5, N'https://cf.shopee.vn/file/6c4c31da102a78133aea1dd8a60cc74b', N'https://cf.shopee.vn/file/39c3208dfe0c511d5baa1b62fe8930c9', N'https://cf.shopee.vn/file/b62cae33aacd4685928af34937dbb813', CAST(N'2022-03-12T23:34:48.627' AS DateTime), N'#custom, #beauty')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (27, N'Keycap SA Cacbon', N'- Phục vụ nhiều Layout với 135 phím <Br/> - Profile: SA cho âm thanh gõ đầy đặn <Br/> - Keycap được làm từ nhựa pbt doubleshot. <Br/> - Phối màu nổi bật dễ nhìn, không bẩn', N'Akko', 1200, 5, N'https://cf.shopee.vn/file/4add5a455f17283610c8abca3e33eb59', N'https://cf.shopee.vn/file/0069d7d774eed66412025258c8d491fc', N'https://cf.shopee.vn/file/871097e67fca0320623916115c7b9846', CAST(N'2022-03-12T23:38:03.770' AS DateTime), N'#custom, #beauty')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (28, N'Lót Chuột Phím Custom', N'- Cho Góc PC đẹp hơn', N'Kelowa', 550, 6, N'https://cf.shopee.vn/file/b46f9dff4a2d17cd36c9585174ade44a', N'https://cf.shopee.vn/file/912ced04f273edfd0d748e30ab2e2590', N'https://cf.shopee.vn/file/41dc4f4b9fcad71bf12553e92561d55e', CAST(N'2022-03-13T00:59:57.367' AS DateTime), N'#support')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (29, N'Dây Custom', N'- Hỗ Trợ dây cho chuột và phím. <Br/> - Setup góc làm việc đẹp hơn. <Br/>- Dây bọc dù, đầu kim loại, thêm cục chống nhiễu ', N'Glorious', 1000, 6, N'https://cf.shopee.vn/file/ade565aa62e63b6ec0d6f9b8315b75cc', N'https://cf.shopee.vn/file/3ea056cf104c933c456aba7aec58e917', N'https://cf.shopee.vn/file/7baa0f907de1b17cb9dd45615dee65e2', CAST(N'2022-03-13T01:02:38.997' AS DateTime), N'#support, #beauty')
INSERT [dbo].[Products_HE151102] ([id], [name], [description], [brand], [price], [c_id], [img_1], [img_2], [img_3], [created_at], [keyword]) VALUES (30, N'Akko Mod001', N'- layout:', N'AKKO', 1500, 2, N'https://akkogear.com.vn/wp-content/uploads/2021/06/kit-ban-phim-co-akko-designer-studio-mod001-neon-hotswap-5-pin-rgb-foam-tieu-am-04.jpg', N'https://akkogear.com.vn/wp-content/uploads/2020/05/Akko-Cool-Creator-MOD001-Grey-Parrot-Psittacus-02.jpg', N'https://my-test-11.slatic.net/p/2a7c6b3807b78a0dda1497aab436abcb.jpg', CAST(N'2022-03-15T10:47:46.333' AS DateTime), N'#support, #beauty')
SET IDENTITY_INSERT [dbo].[Products_HE151102] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__F3DBC57242A8E216]    Script Date: 3/22/2022 12:57:16 AM ******/
ALTER TABLE [dbo].[Accounts_HE151102] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts_HE151102] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Accounts_HE151102] ADD  DEFAULT ((0)) FOR [type]
GO
ALTER TABLE [dbo].[Orders_HE151102] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Products_HE151102] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Order_Items_HE151102]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders_HE151102] ([id])
GO
ALTER TABLE [dbo].[Order_Items_HE151102]  WITH CHECK ADD FOREIGN KEY([prod_id])
REFERENCES [dbo].[Products_HE151102] ([id])
GO
ALTER TABLE [dbo].[Orders_HE151102]  WITH CHECK ADD FOREIGN KEY([acc_id])
REFERENCES [dbo].[Accounts_HE151102] ([id])
GO
ALTER TABLE [dbo].[Products_HE151102]  WITH CHECK ADD FOREIGN KEY([c_id])
REFERENCES [dbo].[Categories_HE151102] ([id])
GO
