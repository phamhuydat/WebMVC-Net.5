USE [master]
GO
/****** Object:  Database [ASP_DATA]    Script Date: 6/11/2023 10:38:59 PM ******/
CREATE DATABASE [ASP_DATA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASP_DATA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS05\MSSQL\DATA\ASP_DATA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASP_DATA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS05\MSSQL\DATA\ASP_DATA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ASP_DATA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASP_DATA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASP_DATA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASP_DATA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASP_DATA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASP_DATA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASP_DATA] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASP_DATA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ASP_DATA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASP_DATA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASP_DATA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASP_DATA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASP_DATA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASP_DATA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASP_DATA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASP_DATA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASP_DATA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ASP_DATA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASP_DATA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASP_DATA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASP_DATA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASP_DATA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASP_DATA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASP_DATA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASP_DATA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ASP_DATA] SET  MULTI_USER 
GO
ALTER DATABASE [ASP_DATA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASP_DATA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASP_DATA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASP_DATA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASP_DATA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASP_DATA] SET QUERY_STORE = OFF
GO
USE [ASP_DATA]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/11/2023 10:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](70) NOT NULL,
	[User_Name] [varchar](50) NOT NULL,
	[Password] [varchar](100) NULL,
	[Phone] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Admin]    Script Date: 6/11/2023 10:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[Email] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/11/2023 10:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IdCategory] [int] IDENTITY(1,1) NOT NULL,
	[NameCaregory] [nvarchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/11/2023 10:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[NameCus] [nvarchar](50) NOT NULL,
	[Address_Delivery] [nvarchar](max) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Total_Money] [float] NOT NULL,
	[Idstatus] [int] NOT NULL,
	[IdCustomer] [int] NOT NULL,
 CONSTRAINT [PK__Order__C38F30098667CA28] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 6/11/2023 10:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdOrder] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
	[UntiPriceSale] [float] NOT NULL,
	[QuantitySale] [int] NOT NULL,
 CONSTRAINT [PK__Order_De__3214EC07F3C28526] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/11/2023 10:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[Name_product] [nvarchar](200) NOT NULL,
	[Price] [float] NOT NULL,
	[Discription] [ntext] NOT NULL,
	[Image_description] [varchar](200) NOT NULL,
	[Discription2] [ntext] NOT NULL,
	[Image_description2] [varchar](200) NOT NULL,
	[Discount] [float] NOT NULL,
	[Image] [varchar](200) NOT NULL,
	[IdCategory] [int] NOT NULL,
 CONSTRAINT [PK__Product__2E8946D46D6DF894] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/11/2023 10:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsStatus] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [FullName], [User_Name], [Password], [Phone]) VALUES (11, N'Lê Thanh Toàn', N'toan', N'96e79218965eb72c92a549dd5a330112', N'0123123214')
INSERT [dbo].[Account] ([Id], [FullName], [User_Name], [Password], [Phone]) VALUES (15, N'Phạm Huy Đạt', N'dat', N'96e79218965eb72c92a549dd5a330112', N'0123412456')
INSERT [dbo].[Account] ([Id], [FullName], [User_Name], [Password], [Phone]) VALUES (16, N'Phan Thanh Trí', N'Tri', N'96e79218965eb72c92a549dd5a330112', N'0634563445')
INSERT [dbo].[Account] ([Id], [FullName], [User_Name], [Password], [Phone]) VALUES (18, N'Huỳnh Ngọc Tỷ', N'ty', N'96e79218965eb72c92a549dd5a330112', N'0124125152')
INSERT [dbo].[Account] ([Id], [FullName], [User_Name], [Password], [Phone]) VALUES (19, N'Phạm Quang Mẫn', N'man', N'96e79218965eb72c92a549dd5a330112', N'0124512515')
INSERT [dbo].[Account] ([Id], [FullName], [User_Name], [Password], [Phone]) VALUES (20, N'Văn Tèo ', N'teo', N'96e79218965eb72c92a549dd5a330112', N'07758443256')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Account_Admin] ON 

INSERT [dbo].[Account_Admin] ([Id], [UserName], [password], [Email]) VALUES (1, N'MANAGER', N'quanly123', N'quanly@gmail.com')
INSERT [dbo].[Account_Admin] ([Id], [UserName], [password], [Email]) VALUES (2, N'EMPLOYEE', N'nhanvien123', N'nhanvien@gmail.com')
SET IDENTITY_INSERT [dbo].[Account_Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([IdCategory], [NameCaregory]) VALUES (1, N'Iphone')
INSERT [dbo].[Category] ([IdCategory], [NameCaregory]) VALUES (2, N'Ipad')
INSERT [dbo].[Category] ([IdCategory], [NameCaregory]) VALUES (3, N'Mac')
INSERT [dbo].[Category] ([IdCategory], [NameCaregory]) VALUES (4, N'Watch')
INSERT [dbo].[Category] ([IdCategory], [NameCaregory]) VALUES (5, N'Sound')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([IdOrder], [OrderDate], [NameCus], [Address_Delivery], [Phone], [Email], [Total_Money], [Idstatus], [IdCustomer]) VALUES (71, CAST(N'2023-06-06T10:50:26.290' AS DateTime), N'Phạm Huy Đạt', N'Cần Thơ, Phong Điền, số 621', N'0775933074', N'dat@gmail.com', 19190000, 2, 15)
INSERT [dbo].[Order] ([IdOrder], [OrderDate], [NameCus], [Address_Delivery], [Phone], [Email], [Total_Money], [Idstatus], [IdCustomer]) VALUES (77, CAST(N'2023-06-06T10:54:59.217' AS DateTime), N'Phạm Quang Mẫn', N'Cần Thơ, Thốt Nốt, số 124', N'0152151121', N'man@gmail.com', 6190000, 2, 19)
INSERT [dbo].[Order] ([IdOrder], [OrderDate], [NameCus], [Address_Delivery], [Phone], [Email], [Total_Money], [Idstatus], [IdCustomer]) VALUES (78, CAST(N'2023-06-06T20:07:20.890' AS DateTime), N'Lê Toàn', N'Cần Thơ, Vĩnh Thạnh, số nhà 425', N'0947556322', N'toan@gmail.com', 69440000, 5, 11)
INSERT [dbo].[Order] ([IdOrder], [OrderDate], [NameCus], [Address_Delivery], [Phone], [Email], [Total_Money], [Idstatus], [IdCustomer]) VALUES (82, CAST(N'2023-06-09T14:18:49.423' AS DateTime), N'Huỳnh Ngọc Tỷ', N'Cà Mau, Đầm Dơi, số 124', N'0472766567', N'ty@gmail.com', 43380000, 2, 18)
INSERT [dbo].[Order] ([IdOrder], [OrderDate], [NameCus], [Address_Delivery], [Phone], [Email], [Total_Money], [Idstatus], [IdCustomer]) VALUES (84, CAST(N'2023-06-09T19:56:59.853' AS DateTime), N'Lê Thanh  Toàn', N'Cần Thơ, Bình Thuỷ, CMT8', N'0124124353', N'toan@gmail.com', 51560000, 5, 11)
INSERT [dbo].[Order] ([IdOrder], [OrderDate], [NameCus], [Address_Delivery], [Phone], [Email], [Total_Money], [Idstatus], [IdCustomer]) VALUES (86, CAST(N'2023-06-10T07:49:52.247' AS DateTime), N'Huy Dat', N'Cần Thơ, Phong Điền, số 621', N'0158888533', N'dat@gmail.com', 19190000, 2, 15)
INSERT [dbo].[Order] ([IdOrder], [OrderDate], [NameCus], [Address_Delivery], [Phone], [Email], [Total_Money], [Idstatus], [IdCustomer]) VALUES (87, CAST(N'2023-06-10T08:29:53.173' AS DateTime), N'Đạt', N'Cần Thơ, Bình Thuỷ, số 123', N'0977336456', N'toan@gmail.com', 6190000, 2, 15)
INSERT [dbo].[Order] ([IdOrder], [OrderDate], [NameCus], [Address_Delivery], [Phone], [Email], [Total_Money], [Idstatus], [IdCustomer]) VALUES (99, CAST(N'2023-06-11T18:08:47.640' AS DateTime), N'Huỳnh Ngọc Tỷ', N'Cần Thơ, Bình Thuỷ, số nhà 123', N'0775844073', N'toan@gmail.com', 29490000, 2, 18)
INSERT [dbo].[Order] ([IdOrder], [OrderDate], [NameCus], [Address_Delivery], [Phone], [Email], [Total_Money], [Idstatus], [IdCustomer]) VALUES (101, CAST(N'2023-06-11T20:04:29.633' AS DateTime), N'Lê Thanh Toàn', N'Cà Mau, Càng Long, số 123', N'0345363478', N'tonii@gmail.com', 50080000, 2, 11)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Details] ON 

INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (22, 71, 3, 19190000, 1)
INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (25, 77, 19, 6190000, 1)
INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (26, 78, 2, 21690000, 1)
INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (27, 78, 16, 47750000, 1)
INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (33, 82, 2, 21690000, 1)
INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (34, 82, 5, 21690000, 1)
INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (36, 84, 13, 18590000, 1)
INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (37, 84, 10, 10990000, 3)
INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (39, 86, 3, 19190000, 1)
INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (40, 87, 19, 6190000, 1)
INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (56, 99, 15, 29490000, 1)
INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (58, 101, 2, 21690000, 1)
INSERT [dbo].[Order_Details] ([Id], [IdOrder], [IdProduct], [UntiPriceSale], [QuantitySale]) VALUES (59, 101, 9, 28390000, 1)
SET IDENTITY_INSERT [dbo].[Order_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (1, N'iPhone 14 Pro Max 128GB', 26790000, N'                                                                                                                                                                                                                                                                                                                        iPhone 14 Pro Max 128GB là một trong những sản phẩm sở hữu nhiều nâng cấp vượt trội gây sốt với các tín đồ iFan trong thời gian vừa qua.
Dung lượng 128GB: Kho dữ liệu cho phép lưu trữ tới 35.000 hình ảnh 12MP, tương đương 500 phút quay video HD và tải về máy 30.000 bài nhạc MP3.
Màn hình: Diện tích 6.7’’ với công nghệ Super Retina XDR OLED cho chất lượng hiển thị sắc nét, ProMotion 120Hz cuộn mượt mà không độ trễ.
Hiệu năng: Chipset A16 (4nm) lần đầu tiên xuất hiện cho siêu hiệu suất đỉnh cao, thách thức mọi ứng dụng đồ họa nặng.
Camera: Cảm biến 48MP ngoạn mục mang tới chất lượng điện ảnh, tích hợp nhiều tính năng và chế độ mới chuyên nghiệp.
Thiết kế: Dynamic Island thay thế tai thỏ truyền thống để mở rộng màn hình và hỗ trợ tác vụ đa nhiệm.  
Tính năng màn hình luôn bật: Chế độ Always-On display giữ màn hình luôn sáng mà vẫn tiết kiệm pin tối đa.
Tính năng an toàn: 2 tính năng SOS mới giúp iFans trải nghiệm nâng tầm về độ an toàn trong những tình huống khẩn cấp.
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    ', N'asset/img/Product/product-items/iPhone/iphone-14-promax-128gb(1).jpg', N'                                                                                                                                                                                                                                                                                                                        Thiết kế camera trước dạng “tai thỏ” đã quá quen thuộc với người dùng khi liên tục xuất hiện trên 4 thế hệ smartphone gần nhất (kể từ iPhone X series tới iPhone 13 series). Tuy nhiên Apple đã loại bỏ thiết kế này trên phiên bản iPhone 14 Pro và thay thế với diện mạo hình viên thuốc độc đáo hay còn được biết tới là “Dynamic Island”. Phần cắt này cũng chiếm ít không gian hơn so với notch truyền thống trên các mẫu iPhone 13 Pro.

Tính năng mới có thể biến đổi thành các hình dạng và kích thước khác nhau phù hợp với cuộc gọi đến, cảnh báo, thông báo, xác thực Face ID, hẹn giờ, điều hướng từng chặng, v.v. Bạn có thể truy cập các điều khiển phương tiện mà không cần kéo Trung tâm thông báo xuống. Dynamic Island rất được lòng những người dùng iPhone lâu năm vì không chỉ trông đẹp hơn notch mà còn cung cấp tiện ích thực tế giúp tối thiểu hóa thao tác sử dụng.
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    ', N'asset/img/Product/product-items/iPhone/iphone-14-promax-128gb(2).jpg', 34990000, N'asset/img/Product/product-items/iPhone/iphone-14-pro-max-128gb_240.png', 1)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (2, N'iPhone 14 Pro 128GB', 21690000, N'iPhone 14 Pro mang đến những trải nghiệm khác biệt. Dynamic Island giúp bạn dễ dàng truy cập thông tin và theo dõi các hoạt động. Camera 48MP cho độ chi tiết đáng kinh ngạc khi bạn chụp ảnh trong ProRAW. Pin ấn tượng kèm iOS 16, iPhone 14 Pro là ví dụ tốt nhất cho việc tích hợp phần cứng và phần mềm đẳng cấp thế giới của Apple.', N'asset/img/Product/product-items/iPhone/iphone-14-pro-128gb_240(1).jpg', N'Thiết kế camera trước dạng “tai thỏ” đã quá quen thuộc với người dùng khi liên tục xuất hiện trên 4 thế hệ smartphone gần nhất (kể từ iPhone X series tới iPhone 13 series). Tuy nhiên Apple đã loại bỏ thiết kế này trên phiên bản iPhone 14 Pro và thay thế với diện mạo hình viên thuốc độc đáo hay còn được biết tới là “Dynamic Island”. Phần cắt này cũng chiếm ít không gian hơn so với notch truyền thống trên các mẫu iPhone 13 Pro.

Tính năng mới có thể biến đổi thành các hình dạng và kích thước khác nhau phù hợp với cuộc gọi đến, cảnh báo, thông báo, xác thực Face ID, hẹn giờ, điều hướng từng chặng, v.v. Bạn có thể truy cập các điều khiển phương tiện mà không cần kéo Trung tâm thông báo xuống. Dynamic Island rất được lòng những người dùng iPhone lâu năm vì không chỉ trông đẹp hơn notch mà còn cung cấp tiện ích thực tế giúp tối thiểu hóa thao tác sử dụng.', N'asset/img/Product/product-items/iPhone/iphone-14-pro-128gb_240(2).jpg', 27990000, N'asset/img/Product/product-items/iPhone/iphone-14-pro-128gb_240.png', 1)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (3, N'iPhone 14 128GB', 19190000, N'iPhone 14 128GB là phiên bản được rất nhiều người dùng yêu thích bởi sở hữu mức giá “dễ thở" nhất. Dòng máy cũng có nhiều cải tiến về chất lượng camera và hiệu năng xử lý. Chi tiết về đặc điểm nổi bật của iPhone 14 128GB bạn hãy theo dõi trong nội dung dưới đây. ', N'asset/img/Product/product-items/iPhone/0009181_iphone-14-128gb_240(1).jpg', N'Với hiệu năng có thể nói là cực kì lớn mà iPhone 14 128GB sở hữu, người dùng sẽ có trải nghiệm vô cùng tuyệt vời với chế độ ổn định nâng cao. Nhờ chế độ Action Mode, người dùng sẽ có những thước video ổn định, không bị rung lắc. Điều này giúp bạn thỏa sức sáng tạo những nội dung video, quay TikTok mượt mà, sắc nét và có được đoạn hình ảnh chân thực nhất ngay cả khi bạn đang chạy trên con đường gồ ghề.', N'asset/img/Product/product-items/iPhone/0009181_iphone-14-128gb_240(2).jpg', 24990000, N'asset/img/Product/product-items/iPhone/0009181_iphone-14-128gb_240.png', 1)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (5, N'iPhone 14 Plus 128GB', 21690000, N'“Nhỏ mà có võ”, 128GB được coi là mức dung lượng “khủng” đủ chỗ trống để chứa khoảng 35.000 bức ảnh được chụp từ camera 12MP cũng như tối đa 45 giờ xem video 1080p dưới định dạng HEVC của Apple. Với mức dung lượng tối thiểu 128GB, bạn có thể cài đặt khoảng 3.368 ứng dụng ở kích thước trung bình 33MB, đồng thời có nhiều không gian trống cho sách điện tử, nhạc, ảnh và video.', N'asset/img/Product/product-items/iPhone/0009495_iphone-14-plus-128gb_240(1).jpg', N'iPhone 14 Plus 128GB quay trở lại đường đua công nghệ nhằm giải quyết nhu cầu của những người muốn sử dụng màn hình lớn tương đương iPhone 14 Pro Max nhưng vẫn tối ưu chi phí bỏ ra.

iPhone 14 Plus được trang bị công nghệ màn OLED Super Retina XDR với độ lớn lên đến 6,7 inch, độ phân giải đạt 2778 x 1284 pixel đem đến trải nghiệm hiển thị sắc nét, sống động và chân thực tối đa. Ngoài ra, dòng máy iPhone 14 Plus được tích hợp đèn flash True Tone hỗ trợ điều chỉnh tự động theo ánh sáng môi trường. Màn hình được phủ lớp Oleophobic chống bám vân tay mang lại cảm giác cao cấp cho người dùng.', N'asset/img/Product/product-items/iPhone/0009495_iphone-14-plus-128gb_240(2).jpg', 27990000, N'asset/img/Product/product-items/iPhone/0009495_iphone-14-plus-128gb_240.png', 1)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (6, N'iPad gen 9 10.2 inch WiFi 64GB', 6990000, N'iPad Gen 9 (2021) Mạnh mẽ. Dễ sử dụng. Đa năng. Học sinh thích học với iPad mới. Với chip A13 Bionic mạnh mẽ, thời lượng pin bền bỉ cả ngày, màn hình Retina 10.2 inch tuyệt đẹp, Wi-Fi siêu nhanh, camera trước Ultra Wide với tính năng Trung Tâm Màn Hình, và tương thích với Apple Pencil và the Smart Keyboard. iPad giúp học sinh làm việc và học tập nhiều hơn và dễ dàng hơn. Tất cả tính năng với mức giá ấn tượng.', N'asset/img/Product/product-items/iPad/0006205_ipad-gen-9-102-inch-wifi-64gb_240(1).jpg', N'Ứng dụng có sẵn trên App Store. Nội dung được cung cấp có thể thay đổi. Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập  để biết thêm thông tin. Phụ kiện được bán riêng. Khả năng tương thích tùy thuộc thế hệ sản phẩm. Cần có gói cước dữ liệu. Mạng LTE chuẩn Gigabit, 4G LTE Advanced, 4G LTE và gọi Wi-Fi chỉ khả dụng ở một số thị trường và được cung cấp qua một số nhà mạng. Tốc độ phụ thuộc vào thông lượng lý thuyết và có thể thay đổi tùy địa điểm và nhà mạng. Để biết thông tin về hỗ trợ mạng LTE, vui lòng liên hệ nhà mạng và truy cập .', N'asset/img/Product/product-items/iPad/0006205_ipad-gen-9-102-inch-wifi-64gb_240(2).jpg', 9990000, N'asset/img/Product/product-items/iPad/0006205_ipad-gen-9-102-inch-wifi-64gb_240.png', 2)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (8, N'iPad Pro M2 11 inch WiFi 128GB', 23990000, N'Đây là lần đầu các mẫu iPad được thiết kế đặc biệt để giảm thiểu tác động của chúng đối với môi trường. Với chất liệu 100% vàng tái chế, áp dụng cho lớp mạ của nhiều bảng mạch in, cũng như các nguyên tố nhôm, thiếc và đất hiếm tái chế, kèm với bao bì mới chất liệu sợi, loại bỏ lớp bọc nhựa bên ngoài đến 99%, Apple đang thực sự nghiêm túc với mục tiêu loại bỏ hoàn toàn nhựa khỏi tất cả bao bì vào năm 2025.', N'asset/img/Product/product-items/iPad/0007071_ipad-pro-m2-11-inch-wifi-128gb_240(1).jpeg', N'M2, sự khởi đầu của thế hệ chip M-series tiếp theo của Apple, mang đến hiệu năng và khả năng đột phá hơn nữa cho iPad Pro thế hệ 2022. M2 có CPU 8 nhân — nhanh hơn tới 15% so với M1 — với những cải tiến về cả lõi hiệu suất và hiệu quả, cùng GPU 10 lõi, mang lại hiệu suất đồ họa nhanh hơn tới 35% cho những người dùng khó tính nhất.', N'asset/img/Product/product-items/iPad/0007071_ipad-pro-m2-11-inch-wifi-128gb_240(2).jpeg', 20790000, N'asset/img/Product/product-items/iPad/0007071_ipad-pro-m2-11-inch-wifi-128gb_240.png', 2)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (9, N'iPad Pro M2 12.9 inch WiFi 128GB', 28390000, N'iPad Pro M1 12.9" (2021) Wifi+4G vẫn giữ thiết kế quen thuộc như những phiên bản tiền nhiệm. Tuy nhiên, Apple đã mang đến một vài điểm khác biệt như 4 cạnh bo cong vuông vức, màn hình viền mỏng hơn. Kích thước 12.9 inch của máy cũng tương tự phiên bản năm 2020.', N'asset/img/Product/product-items/iPad/0007301_ipad-pro-m2-129-inch-wifi-128gb_240(1).jpeg', N'Sản phẩm này được trang bị tấm nền Mini LED giúp hiển thị màu tốt hơn, tạo ra những điểm nhấn nổi bật, chi tiết tinh tế. Đồng thời hạn chế khả năng cháy màn hình so với các công nghệ trước đó.

iPad Pro M1 12.9" (2021) Wifi+4G sở hữu công nghệ màn hình Liquid Retina XDA mang đến cho người dùng những những trải nghiệm hình ảnh vô cùng chân thực với độ chi tiết ấn tượng. Thiết bị có độ sáng màn hình lên đến 1.600 nits với tỷ lệ tương phản là 1.000.000:1.

', N'asset/img/Product/product-items/iPad/0007301_ipad-pro-m2-129-inch-wifi-128gb_240(2).jpeg', 31990000, N'asset/img/Product/product-items/iPad/0007301_ipad-pro-m2-129-inch-wifi-128gb_240.png', 2)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (10, N'iPad Gen 10th 10.9 inch WiFi 64GB', 10990000, N'Thoạt nhìn, người dùng có thể nhận nhầm iPad Gen 10 với hai dòng iPad nâng cao Air và Pro bởi ngoại hình vuông vức, không viền, không có nút Home, khác biệt hoàn toàn với sản phẩm tiền nhiệm - chiếc iPad Gen 9. Nút nguồn được chuyển lên cạnh trên và tích hợp Touch ID nên rất thuận tiện khi sử dụng. ', N'asset/img/Product/product-items/iPad/0009725_ipad-gen-10th-109-inch-wifi-64gb_240(1).jpg', N'A14 Bionic có 16 nhân xử lý trí tuệ nhân tạo (Neutral Engine), gấp đôi số lượng so với chip A13 của thế hệ trước đó, mang lại cho nó nhiều sức mạnh hơn để xử lý các tác vụ máy học nâng cao. Điều này giúp tăng khả năng học máy của nó lên tới 80%.', N'asset/img/Product/product-items/iPad/0009725_ipad-gen-10th-109-inch-wifi-64gb_240(2).jpg', 12990000, N'asset/img/Product/product-items/iPad/0009725_ipad-gen-10th-109-inch-wifi-64gb_240.png', 2)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (13, N'MacBook Air M1 2020 (8GB RAM | 256GB SSD)', 18590000, N'Là một chiếc ultrabook cao cấp, MacBook Air mang trên mình tất cả thẩm mỹ tinh tế của Apple trong thiết kế sản phẩm. MacBook Air M1 được hoàn thiện từ chất liệu nhôm nguyên khối, không chỉ nhẹ mà còn rất sang trọng. Trọng lượng chỉ 1,29kg cũng giúp người dùng tiện lợi mang đi sử dụng ở mọi nơi. Khách hàng có thể lựa chọn ba phiên bản màu khác nhau phù hợp với cả tính mỗi người, bao gồm xám, bạc và vàng.

', N'asset/img/Product/product-items/Mac/0000723_macbook-air-m1-2020-8gb-ram-256gb-ssd_240(1).jpg', N'Cảm giác mở máy bằng một tay vẫn giữ được sự mượt mà, cho thấy khả năng hoàn thiện bản lề cực tốt của Apple. Khi mở máy ra, người dùng sẽ thấy bàn phím Magic Keyboard có hành trình phím 1mm, hỗ trợ đèn nền và TouchPad có kích thước lớn, giúp các thao tác trên máy trở nên trơn tru và có phản hồi tốt. Hai dải loa stereo được bố trị bên cạnh bàn phím, có âm lượng và chất âm tốt, hỗ trợ người dùng mọi tác vụ giải trí. Đặc biệt, nhờ không có quạt gió nên người dùng sẽ không tìm thấy khe tản nhiệt trên thiết bị này, tạo ra cảm giác thiết kế liền mạch cho sản phẩm.', N'asset/img/Product/product-items/Mac/0000723_macbook-air-m1-2020-8gb-ram-256gb-ssd_240(2).jpg', 28990000, N'asset/img/Product/product-items/Mac/0000723_macbook-air-m1-2020-8gb-ram-256gb-ssd_240.png', 3)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (14, N'MacBook Air M2 2022 (8GB RAM | 256GB SSD)', 26790000, N'Điều đầu tiên gây ấn tượng với giới công nghệ ngay từ khi ra mắt của MacBook Air M2 chính là ngoại hình của máy, thậm chí nhiều ý kiến cho rằng phần thiết kế này còn đẹp hơn cả dòng Pro. Nếu  đã từng tạo nên cơn sốt trên thế giới về độ mỏng thì sang tới dòng M2, độ dày của máy còn được tối giản hơn. MacBook Air M2 chỉ mỏng 11.3mm, nặng chỉ khoảng 1.3kg, trong khi Surface Laptop 4 “Ultra-Thin” dày 14.5mm, Dell XPS 13 2022 dày 14.8mm.', N'asset/img/Product/product-items/Mac/0008502_macbook-air-m2-2022-8gb-ram-256gb-ssd_240(1).jpeg', N'Bên cạnh đó, phần vỏ ngoài vuông vức thay vì kiểu vát mỏng ở phần thân máy như các dòng  trước, làm từ vỏ nhôm tái chế không chỉ tạo nên độ chắc chắn mà còn tăng thêm tính thời thượng cho sản phẩm. Nhiều người dùng cho rằng các phiên bản của MacBook Air M2 tương tự như một chiếc iPad có gắn bàn phím.

MacBook Air M2 có tất cả 4 màu: Midnight, Starlight, Space Gray, Silver. Trong số đó, màu Midnight được kỳ vọng tạo nên cơn sốt trong cộng đồng Apple-fan. Xét về tính thời trang thì đây sẽ là lựa chọn đáng để cân nhắc.', N'asset/img/Product/product-items/Mac/0008502_macbook-air-m2-2022-8gb-ram-256gb-ssd_240(2).jpeg', 32990000, N'asset/img/Product/product-items/Mac/0008502_macbook-air-m2-2022-8gb-ram-256gb-ssd_240.png', 3)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (15, N'MacBook Pro 13 inch M2 (10 core| 8GB RAM| 256GB SSD)', 29490000, N'MacBook Pro M2 8GB 256GB được hãng Táo Khuyết trang bị chip Apple M2 với sức mạnh khủng, giúp xử lý mọi tác vụ nặng mượt mà vượt trội. Đây là thế hệ chip Silicon mới, được Apple ra mắt chính thức tại sự kiện WWDC 2022 vào đầu tháng 6.', N'asset/img/Product/product-items/Mac/0008682_macbook-pro-13-inch-m2-10-core-8gb-ram-256gb-ssd_240(1).jpg', N'MacBook Pro M2 8GB/256GB vẫn sử dụng màn hình LED retina 13.3 inch. Đây là loại màn hình có độ phân giải 2560 x 1600 pixels với góc nhìn rộng, cho phép hiển thị hình ảnh sắc nét, sống động từng chi tiết.

Màn hình trên thiết bị công nghệ này còn sử dụng dải màu rộng P3 cùng 1 tỷ màu và độ sáng lên đến 500 nits. Thiết kế này mang lại khả năng tái tạo màu sắc vô cùng chuẩn xác, phù hợp với những người chuyên thiết kế hình ảnh, đồ họa,…

Công nghệ True Tone trên màn hình Retina cũng giúp căn chỉnh nhiệt độ màu theo điều kiện ánh sáng môi trường. Nhờ đó mà mọi khuôn hình được hiển thị một cách tự nhiên, giúp bảo vệ tối đa thị giác của người dùng.', N'asset/img/Product/product-items/Mac/0008682_macbook-pro-13-inch-m2-10-core-8gb-ram-256gb-ssd_240(2).jpg', 35990000, N'asset/img/Product/product-items/Mac/0008682_macbook-pro-13-inch-m2-10-core-8gb-ram-256gb-ssd_240.png', 3)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (16, N'MacBook Pro 14 inch M2 Pro (16 Core| 16GB| 512GB)', 47750000, N'MacBook Pro 14 inch với chip M2 Pro và M2 Max đưa sức mạnh và tốc độ lên một tầm cao mới, dù đang được cắm sạc hay chạy bằng pin. Với màn hình Liquid Retina XDR tuyệt đẹp, tất cả các cổng kết nối bạn cần và thời lượng pin dùng cả ngày,1 chiếc máy tính xách tay chuyên nghiệp này sẽ đồng hành cùng bạn ở bất cứ nơi đâu.

 ', N'asset/img/Product/product-items/Mac/0011267_macbook-pro-14-inch-m2-pro-16-core-16gb-512gb_240(1).jpeg', N'Về ngoại hình, MacBook Pro 14" M2 Pro không có quá nhiều sự khác biệt trong thiết kế so với phiên bản tiền nhiệm. Tuy nhiên, đây vẫn là một sản phẩm vô cùng ấn tượng với kiểu dáng vuông vắn và được hoàn thiện từ các vật liệu nhôm tái chế thân thiện với môi trường. Chiếc máy vẫn giữ nguyên thiết kế của chiếc Macbook Pro 14" - M1 Pro 2021, với lớp vỏ kim loại nguyên khối bằng nhôm, kiểu dáng phẳng, viền màn hình mỏng và chiếc notch tai thỏ quen thuộc.', N'asset/img/Product/product-items/Mac/0011267_macbook-pro-14-inch-m2-pro-16-core-16gb-512gb_240(2).jpeg', 55000000, N'asset/img/Product/product-items/Mac/0011267_macbook-pro-14-inch-m2-pro-16-core-16gb-512gb_240.jpeg', 3)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (18, N'Apple Watch Series 7 Nhôm GPS', 7990000, N'Apple Watch Series 7 (GPS) Màn hình Retina Luôn Bật lớn nhất, tiên tiến nhất giúp mọi tác vụ bạn thực hiện với Apple Watch Series 7 trông lớn hơn và đẹp hơn. Series 7 là Apple Watch bền bỉ nhất từng được chế tạo, với mặt trước bằng thủy tinh chống nứt tốt hơn. Các tính năng tiên tiến giúp bạn đo mức ôxi trong máu, đo điện tâm đồ (ECG) bất kỳ lúc nào, truy cập ứng dụng theo dõi giấc ngủ và ứng dụng chú tâm. Bạn cũng có thể theo dõi hàng chục bài tập thể chất, bao gồm Thái Cực Quyền và pilates mới.', N'asset/img/Product/product-items/Watch/0000896_apple-watch-se-2022-nhom-gps_240(1).jpg', N'Apple Watch Series 7 tương thích với iPhone 6s hoặc các phiên bản cao hơn sử dụng iOS 15 hoặc các bản cập nhật cao hơn. Số đo từ ứng dụng Ôxi Trong Máu không được dùng cho mục đích y tế, kể cả tự chẩn đoán hoặc xin ý kiến bác sĩ và chỉ được thiết kế cho hoạt động luyện tập thông thường và mục đích chăm sóc sức khỏe. Ứng dụng ECG chỉ khả dụng trên Apple Watch Series 4 và các phiên bản cao hơn (không bao gồm Apple Watch SE) sử dụng iOS và watchOS phiên bản mới nhất. Truy cập  để biết thông tin về khả năng tương thích. Không được sử dụng ECG cho người dưới 22 tuổi. Với ứng dụng ECG, Apple Watch có khả năng tạo ra kết quả ECG tương tự như điện tâm đồ một đạo trình.', N'asset/img/Product/product-items/Watch/0000896_apple-watch-se-2022-nhom-gps_240(2).jpg', 11990000, N'asset/img/Product/product-items/Watch/0000896_apple-watch-se-2022-nhom-gps_240.png', 4)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (19, N'Apple Watch SE Nhôm 2022 GPS', 6190000, N'                        So với thế hệ đầu tiên, Apple Watch SE 2022 không có nhiều thay đổi trong thiết kế, nhưng nếu nhìn kĩ ta có thể thấy phiên bản 2022 đã có viền dày hơn, làm từ nhôm tái chế, đi kèm với dây cao su mềm mại và ôm sát cổ tay người dùng, cho cảm giác dễ chịu khi đeo.
                    ', N'asset/img/Product/product-items/Watch/0001025_apple-watch-series-7-nhom-gps_240(1).jpg', N'                        Với phiên bản này, nó có kích thước kích thước dài - rộng - ngang lần lượt là 44 x 38 x 10.7 mm, màn hình OLED có độ phân giải: 448 x 368 pixels, độ sáng cao lên đến 1000 nits mang lại chất lượng hình ảnh rõ ràng, sắc nét đến từng chi tiết và trải nghiệm vuốt chạm mượt mà. Mặt kính cường lực Ion-X strengthened glass càng giúp cho đồng hồ thêm bền, hạn chế vỡ nứt hay trầy xước.
                    ', N'asset/img/Product/product-items/Watch/0001025_apple-watch-series-7-nhom-gps_240(2).jpg', 8990000, N'asset/img/Product/product-items/Watch/0001025_apple-watch-series-7-nhom-gps_240.png', 4)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (22, N'Apple Watch Series 8 41mm nhôm GPS', 8990000, N'Apple Watch Series 8 sở hữu các cảm biến và ứng dụng sức khỏe tối tân, vì vậy bạn có thể đo điện tâm đồ (ECG), 1 đo nhịp tim và nồng độ oxy trong máu, 2 theo dõi sự thay đổi nhiệt độ3 để nắm bắt thông tin chuyên sâu về chu kỳ kinh nguyệt. 4 Các tính năng Phát Hiện Va Chạm, theo dõi giai đoạn ngủ và các chỉ số tập luyện chuyên sâu giúp bạn luôn năng động, khỏe mạnh, an toàn, và kết nối.', N'asset/img/Product/product-items/Watch/0001031_apple-watch-series-8-41mm-nhom-gps_240(1).jpeg', N'Với màn hình Retina, độ sáng lên đến 1000 nits - lớn hơn 20% so với Apple Watch SE - Apple Watch Series 8 mang đến khả năng hiển thị vô cùng sắc nét. Cùng với tính năng Always on Display - luôn bật sáng giúp người dùng sẽ dễ dàng, thuận tiện khi xem các thông báo, thông tin hiển thị trên đồng hồ.', N'asset/img/Product/product-items/Watch/0001031_apple-watch-series-8-41mm-nhom-gps_240(2).jpeg', 11990000, N'asset/img/Product/product-items/Watch/0001031_apple-watch-series-8-41mm-nhom-gps_240.png', 4)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (23, N'Apple Watch Ultra LTE 49mm Alpine Loop size S', 19990000, N'Apple Watch Ultra LTE 49mm Alpine size S ra mắt cùng với rất nhiều siêu phẩm của nhà Apple như: iPhone 14 Series, Apple Watch series 8, Apple Watch SE 2 hay AirPods Pro 2 vào tháng 9/2022. 

Apple Watch Ultra LTE 49mm Alpine size S được đánh giá là sản phẩm có chiều dài dây ngắn gọn, vô cùng phù hợp với người có cổ tay nhỏ, đặc biệt là chị em phụ nữ.  Cùng với nhiều tính năng ưu việt về sức khỏe, hỗ trợ tập luyện, cảnh báo và an toàn Apple Watch Ultra LTE 49mm Alpine size S đang được nhiều khách hàng quan tâm và tìm hiểu. ', N'asset/img/Product/product-items/Watch/0008913_apple-watch-ultra-lte-49mm-alpine-loop-size-s_240(1).jpeg', N'Apple Watch Ultra LTE 49mm Alpine Loop Size S có chiều dài dây ngắn nhất từ 130 - 160mm. Chiều dài dây của phiên bản này phù hợp với những người có cổ tay nhỏ, đặc biệt là phái nữ. Người dùng Apple Watch Ultra LTE 49mm Alpine Loop Size S sẽ dễ dàng điều chỉnh và đeo gọn gàng hơn vì không bị thừa quá nhiều dây.

Bên cạnh đó, sản phẩm này còn được thiết kế dây đeo Alpine Loop, được làm từ 2 lớp vải dệt liền mạch, nhẹ, độ bền cao. Cùng với móc khóa chữ G làm bằng titan chống ăn mòn cao giúp bạn đeo chắc chắn và bền bỉ hơn. ', N'asset/img/Product/product-items/Watch/0008913_apple-watch-ultra-lte-49mm-alpine-loop-size-s_240(2).jpeg', 23990000, N'asset/img/Product/product-items/Watch/0008913_apple-watch-ultra-lte-49mm-alpine-loop-size-s_240.png', 4)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (24, N'AirPods Max', 12590000, N'AirPods Max định nghĩa lại tai nghe chụp tai. Driver loa do Apple thiết kế cho âm thanh có độ trung thực cao. Mọi chi tiết, từ gọng đeo đến đệm tai, đều được thiết kế vừa vặn lạ thường. Tính năng Chủ Động Khử Tiếng Ồn dẫn đầu thị trường giúp ngăn chặn các âm thanh bên ngoài lọt vào tai trong khi Chế Độ Xuyên Âm cho phép bạn nghe âm thanh xung quanh.', N'asset/img/Product/product-items/Sounds/0012005_airpods-max_240(1).jpg', N'Apple đã bọc một lớp chất liệu mềm bên ngoài khung thép không gỉ để tạo cảm giác linh hoạt, mềm mại mà vẫn đảm bảo tính bền bỉ cứng cáp trong thiết kế tổng thể chung. Ngoài ra, chủ nhân của AirPods Max có thể điều chỉnh độ dài hai bên headband cho tới khi ưng ý và phù hợp với kích cỡ riêng của bản thân.', N'asset/img/Product/product-items/Sounds/0012005_airpods-max_240(2).jpg', 13990000, N'asset/img/Product/product-items/Sounds/0012005_airpods-max_240.jpg', 5)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (26, N'AirPods 2', 2650000, N'AirPods gen 2 with Charging Case (hộp sạc thường). AirPods 2 là kết hợp của thiết kế mang tính biểu tượng và âm thanh chất lượng cao. Đem đến trải nghiệm tai nghe không dây độc đáo và cảm giác vừa vặn, thoải mái cả ngày dài cho mọi người. Kết nối tức thì khi đeo vào tai. Đều tuyệt vời.', N'asset/img/Product/product-items/Sounds/0006052_airpods-2_240(1).jpeg', N'AirPods 2 - Wireless Charging Case vẫn sở hữu thiết kế quen thuộc, đặc trưng cho sản phẩm của Apple. Nhìn thoáng qua sẽ thấy chiếc tai nghe này không khác mấy so với AirPods đời đầu. Thế nhưng thực tế, Apple đã tùy biến, tinh chỉnh để mang lại âm thanh có độ tập trung hơn và tạo cảm giác thoải mái khi đeo. ', N'asset/img/Product/product-items/Sounds/0006052_airpods-2_240(2).jpeg', 4390000, N'asset/img/Product/product-items/Sounds/0006052_airpods-2_240.jpeg', 5)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (27, N'Tai nghe Apple AirPods 3 sạc có dây Lightning', 4350000, N'AirPod 3 Lightning được đánh giá là phiên bản cải tiến cao cấp của người anh em AirPods 2 trước đó và là phiên bản kế thừa của AirPods Pro. Điều đó được thể hiện rõ nét trong thiết kế hộp sạc và tai nghe.', N'asset/img/Product/product-items/Sounds/0006057_tai-nghe-apple-airpods-3-sac-co-day-lightning_240(1).jpeg', N'AirPods 3 có khả năng chống nước hiệu quả ở cả tai nghe và hộp sạc (đạt chuẩn chống nước IPX4). Sản phẩm có thể chịu được những tia nước bắn ở cường độ nhẹ. Vì vậy, tai nghe vẫn có thể được sử dụng cả khi bạn phải hoạt động dưới trời mưa nhỏ.', N'asset/img/Product/product-items/Sounds/0006057_tai-nghe-apple-airpods-3-sac-co-day-lightning_240(2).jpeg', 5490000, N'asset/img/Product/product-items/Sounds/0006057_tai-nghe-apple-airpods-3-sac-co-day-lightning_240.jpeg', 5)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (28, N'AirPods Pro 2', 5990000, N'AirPods Pro 2 sở hữu công nghệ Chủ Động Khử Tiếng Ồn cao hơn đến 2 lần, cùng với chế độ Xuyên Âm Thích Ứng và Âm Thanh Không Gian Cá Nhân Hóa và tính năng theo dõi đầu chủ động để tạo ra âm thanh chân thực. AirPods Pro hiện có nhiều kích cỡ đầu tai nghe (XS, S, M, L) để lựa chọn và thời gian nghe lên đến 6 giờ.', N'asset/img/Product/product-items/Sounds/0000211_airpods-pro-2_240(1).jpg', N'Apple AirPods Pro 2 sở hữu thiết kế quen thuộc như những phiên bản tiền nhiệm với thiết kế hộp sạc đặc trưng. Hộp sạc nãy sẽ bao gồm cổng sạc Lightning, loa cảnh báo, đèn báo pin, nơi móc dây đeo, giúp bạn dễ dàng mang theo, mà không sợ bị rơi.', N'asset/img/Product/product-items/Sounds/0000211_airpods-pro-2_240(2).jpg', 6790000, N'asset/img/Product/product-items/Sounds/0000211_airpods-pro-2_240.png', 5)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (30, N'iPhone 13', 16790000, N'iPhone 13 với hệ thống camera kép tiên tiến nhất từng có trên iPhone. Chip A15 Bionic thần tốc. Bước nhảy vọt về thời lượng pin. Thiết kế bền bỉ. Mạng 5G siêu nhanh. Cùng với màn hình Super Retina XDR sáng hơn. 

Tính năng nổi bật
• Màn hình Super Retina XDR 6.1 inch
• Chế độ Điện Ảnh làm tăng thêm độ sâu trường ảnh nông và tự động thay đổi tiêu cự trong video
• Hệ thống camera kép tiên tiến với camera Wide và Ultra Wide 12MP; Phong Cách Nhiếp Ảnh, HDR thông minh thế hệ 4, chế độ Ban Đêm, khả năng quay video HDR Dolby Vision 4K
• Camera trước TrueDepth 12MP với chế độ Ban Đêm và khả năng quay video HDR Dolby Vision 4K
• Chip A15 Bionic cho hiệu năng thần tốc
• Thời gian xem video lên đến 19 giờ
• Thiết kế bền bỉ với Ceramic Shield
• Khả năng chống nước đạt chuẩn IP68 đứng đầu thị trường
• Mạng 5G cho tốc độ tải xuống siêu nhanh, xem video và nghe nhạc trực tuyến chất lượng cao
• iOS 15 tích hợp nhiều tính năng mới cho phép bạn làm được nhiều việc hơn bao giờ hết với iPhone', N'asset/img/Product/product-items/iPhone/0000596_iphone-13_240(1).jpg', N'Thiết kế nhiều màu sắc với camera chéo nổi bật 

Theo thông báo từ phía Apple, iPhone 13 năm nay sẽ có kích thước màn hình 6.1 inch. Nhìn chung, ngôn ngữ thiết kế vẫn sẽ không có quá nhiều thay đổi so với thế hệ tiền nhiệm iPhone 12, vẫn là các cạnh vát phẳng vuông góc. 

Tuy nhiên, hãng đã rút gọn phần notch nhỏ hơn 20%, để tăng thêm diện tích hiển thị cho người dùng. Mặt trước làm từ kính cường lực Ceramic Shield có độ bền hơn tới 4 lần so với kính cường lực thông thường. 

iPhone 13 năm nay được trang bị tấm nền Super Retina XDR OLED sáng hơn 28% so với năm ngoái, đạt tối đa 1200 nits khi hiển thị các video và ảnh HDR. Với sự trang bị này bạn có thể trải nghiệm đa tác vụ từ học tập, làm việc cho tới giải trí tối ưu.', N'asset/img/Product/product-items/iPhone/0000596_iphone-13_240(2).jpg', 24990000, N'asset/img/Product/product-items/iPhone/0000596_iphone-13_240.png', 1)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (33, N'iPhone 13 Mini', 16990000, N'iPhone 13 mini với hệ thống camera kép tiên tiến nhất từng có trên . Chip A15 Bionic thần tốc. Thời lượng pin tăng vọt. Thiết kế bền bỉ. Mạng 5G siêu nhanh. Cùng với màn hình Super Retina XDR sáng hơn.

Tính năng nổi bật

Màn hình Super Retina XDR 5.4 inch
Chế độ Điện Ảnh làm tăng thêm độ sâu trường ảnh nông và tự động thay đổi tiêu cự trong video
Hệ thống camera kép tiên tiến với camera Wide và Ultra Wide 12MP; Phong Cách Nhiếp Ảnh, HDR thông minh thế hệ 4, chế độ Ban Đêm, khả năng quay video HDR Dolby Vision 4K
Camera trước TrueDepth 12MP với chế độ Ban Đêm và khả năng quay video HDR Dolby Vision 4K
Chip A15 Bionic cho hiệu năng thần tốc
Thời gian xem video lên đến 17 giờ
Thiết kế bền bỉ với Ceramic Shield
Khả năng chống nước đạt chuẩn IP68 đứng đầu thị trường
Mạng 5G cho tốc độ tải xuống siêu nhanh, xem video và nghe nhạc trực tuyến chất lượng cao
iOS 15 tích hợp nhiều tính năng mới cho phép bạn làm được nhiều việc hơn bao giờ hết với iPhone', N'asset/img/Product/product-items/iPhone/0000597_iphone-13-mini_240(1).jpg', N'Chip Apple A15 Bionic mới nhất tiếp tục dẫn đầu về hiệu năng. Apple cho biết con chip này có CPU nhanh hơn 50% và GPU nhanh hơn 30% so với đối thủ. A15 Bionic được Apple đánh giá là con chip có khả năng tối ưu hóa năng lượng, bảo vệ quyền riêng tư và hỗ trợ chơi game mượt mà. Con chip này có thể thực hiện được 15.8 nghìn tỷ phép toán mỗi giây, cho trải nghiệm đỉnh hơn nhiều khi sử dụng các ứng dụng bên thứ 3.

iPhone 13 Mini có ba tùy chọn bộ nhớ trong bao gồm 128GB, 256GB và 512GB. Chiếc iPhone này tiếp tục hỗ trợ băng tần mạng 5G tiên tiến, tương thích với hơn 200 nhà mạng phổ biến trên toàn thế giới, bao gồm cả 3 nhà mạng lớn tại Việt Nam là Viettel, VinaPhone và MobiFone.', N'asset/img/Product/product-items/iPhone/0000597_iphone-13-mini_240(2).jpg', 21990000, N'asset/img/Product/product-items/iPhone/0000597_iphone-13-mini_240.png', 1)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (34, N'iPhone 12', 14990000, N'iPhone 12 đẩy nhanh mọi tác vụ với A14 Bionic, chip nhanh nhất trên điện thoại thông minh. Hệ thống camera kép mới. Với màn hình Super Retina XDR tuyệt đẹp, nay bạn có thể chiêm ngưỡng từng chi tiết hình ảnh vô cùng sống động.

Tính năng nổi bật
Màn hình Super Retina XDR 6.1 inch
 Ceramic Shield, chất liệu kính bền chắc nhất từng có trên điện thoại thông minh
 A14 Bionic, chip nhanh nhất từng có trên điện thoại thông minh
 Hệ thống camera kép tiên tiến 12MP với các camera Ultra Wide và Wide, chế độ Ban Đêm, Deep Fusion, HDR thông minh thế hệ 3, khả năng quay video HDR Dolby Vision 4K
 Camera trước TrueDepth 12MP với chế độ Ban Đêm và khả năng quay video HDR Dolby Vision 4K
 Khả năng chống nước đạt chuẩn IP68 đứng đầu thị trường
 iOS 14 với các tiện ích được thiết kế lại trên Màn Hình Chính, Thư Viện Ứng Dụng hoàn toàn mới, App Clips cùng nhiều tính năng khác', N'asset/img/Product/product-items/iPhone/0006794_iphone-12-64gb_240(1).jpg', N'Sở hữu một vẻ bên ngoài sang trọng, bóng bẩy và lịch lãm là vậy, thế nhưng iPhone 12 128GB lại mang trong mình một sức mạnh cực kì khủng khiếp, vượt trội hơn tất cả những mẫu smartphone đang có mặt trên thị trường. Tất cả là nhờ có bộ vi xử lý Apple A14 Bionic được sản xuất trên tiến trình 5nm mới nhất, không chỉ manh mà còn tiết kiệm điện năng tới tối đa. Con chip này được đánh giá là bộ vi xử lý mạnh mẽ nhất, nhanh nhất hiện nay với cấu tạo từ 6 lõi CPU, 11,8 tỷ bóng bán dẫn, 4 lõi GPU mới, và nhanh hơn A13 Bionic tới 40%. Công nghệ kết nối mạng 5G mới cùng với Wi-Fi 6 cũng đã được đưa vào iPhone 12, hứa hẹn sẽ mang tới một khả năng kết nối Internet vượt trội hoàn toàn.', N'asset/img/Product/product-items/iPhone/0006794_iphone-12-64gb_240(2).jpg', 22990000, N'asset/img/Product/product-items/iPhone/0006794_iphone-12-64gb_240.png', 1)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (35, N'iPhone 11', 10390000, N'iPhone 11 với hệ thống camera kép với Ultra Wide. Chế độ Ban Đêm và chất lượng video tuyệt vời.  Chống nước và chống bụi. Thời lượng pin lâu. Với 6 màu tuyệt đẹp. Trải nghiệm iPhone 11.

Tính năng nổi bật
Màn hình Liquid Retina HD LCD 6.1 inch
Chống nước và chống bụi (chống nước ở độ sâu 2 mét trong vòng tối đa 30 phút, đạt mức IP68)
 Hệ thống camera kép 12MP với camera Ultra Wide và Wide; chế độ Ban Đêm, chế độ Chân Dung, và khả năng quay video 4K tốc độ tối đa 60 fps
 Camera trước TrueDepth 12MP với chế độ Chân Dung, có khả năng quay video 4K, và quay video chậm
 Xác thực bảo mật với Face ID
 Chip A13 Bionic với Neural Engine thế hệ thứ ba
 Khả năng sạc nhanh
 Sạc không dây
 iOS 14 với các tiện ích được thiết kế lại trên Màn Hình Chính, Thư Viện Ứng Dụng hoàn toàn mới, App Clips cùng nhiều tính năng khác', N'asset/img/Product/product-items/iPhone/0012164_iphone-11-64gb_240(1).jpg', N'iPhone 11 vẫn sở hữu thiết kế tràn viền với “tai thỏ” giống iPhone X. Viền bezel phía trên và dưới cũng được làm gọn lại nhằm tối đa màn hình sử dụng. Cùng với đó, 4 góc của máy cũng được bo tròn nhẹ tạo cảm giác chắc chắn khi cầm trên tay. Mặt lưng iPhone 11 làm từ chất liệu kính nên rất sang trọng, tinh tế. Khác với các dòng iPhone trước, sản phẩm này sẽ có 6 màu bản bạc, vàng, xanh lá, trắng, đen đỏ.

Công nghệ màn hình LCD Retina mang đến chất lượng tốt nhất. Độ phân giải màn hình 1125 x 2436 pixels hiển thị màu sắc chính xác và cho hình ảnh sắc nét. Màn hình rộng 6.1 inch giúp người sử dụng thoải mái trải nghiệm xem phim, lướt web… Đặc biệt Apple đã trang bị tần số quét từ 90 đến 120 Hz với 463 điểm màu.', N'asset/img/Product/product-items/iPhone/0012164_iphone-11-64gb_240(2).jpg', 14990000, N'asset/img/Product/product-items/iPhone/0012164_iphone-11-64gb_240.jpg', 1)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (36, N'iPhone 12 128GB', 17590000, N'                        iPhone 12 đẩy nhanh mọi tác vụ với A14 Bionic, chip nhanh nhất trên điện thoại thông minh. Hệ thống camera kép mới. Với màn hình Super Retina XDR tuyệt đẹp, nay bạn có thể chiêm ngưỡng từng chi tiết hình ảnh vô cùng sống động.

Tính năng nổi bật
Màn hình Super Retina XDR 6.1 inch
 Ceramic Shield, chất liệu kính bền chắc nhất từng có trên điện thoại thông minh
 A14 Bionic, chip nhanh nhất từng có trên điện thoại thông minh
 Hệ thống camera kép tiên tiến 12MP với các camera Ultra Wide và Wide, chế độ Ban Đêm, Deep Fusion, HDR thông minh thế hệ 3, khả năng quay video HDR Dolby Vision 4K
 Camera trước TrueDepth 12MP với chế độ Ban Đêm và khả năng quay video HDR Dolby Vision 4K
 Khả năng chống nước đạt chuẩn IP68 đứng đầu thị trường
 iOS 14 với các tiện ích được thiết kế lại trên Màn Hình Chính, Thư Viện Ứng Dụng hoàn toàn mới, App Clips cùng nhiều tính năng khác
                    ', N'asset/img/Product/product-items/iPhone/0006794_iphone-12-64gb_240(1).jpg', N'                        Màn hình của iPhone 12 128GB được trang bị công nghệ tấm nền OLED Super Retina XDR, mang lại cho iPhone 12 một chất lượng hiển thị xuất sắc nhất từ trước đến nay. Đi cùng với đó là độ phân giải Full HD 2,532 x 1,170; cho mật độ điểm ảnh cực tốt lên tới 460ppi. Với màn hình được nâng cấp và cải tiến như vậy, những vị chủ nhân sở hữu iPhone 12 có thể thoải mái thưởng thức những bộ phim hoặc chơi game mà không cần phải lo nghĩ về bất cứ điều gì.
                    ', N'asset/img/Product/product-items/iPhone/0006794_iphone-12-64gb_240(2).jpg', 24990000, N'asset/img/Product/product-items/iPhone/0006849_iphone-12-128gb_240.png', 1)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (37, N'iPhone 11 128GB', 12090000, N'                                                                        iPhone 11 với hệ thống camera kép với Ultra Wide. Chế độ Ban Đêm và chất lượng video tuyệt vời.  Chống nước và chống bụi. Thời lượng pin lâu. Với 6 màu tuyệt đẹp. Trải nghiệm iPhone 11.

Tính năng nổi bật
Màn hình Liquid Retina HD LCD 6.1 inch
Chống nước và chống bụi (chống nước ở độ sâu 2 mét trong vòng tối đa 30 phút, đạt mức IP68)
 Hệ thống camera kép 12MP với camera Ultra Wide và Wide; chế độ Ban Đêm, chế độ Chân Dung, và khả năng quay video 4K tốc độ tối đa 60 fps
 Camera trước TrueDepth 12MP với chế độ Chân Dung, có khả năng quay video 4K, và quay video chậm
 Xác thực bảo mật với Face ID
 Chip A13 Bionic với Neural Engine thế hệ thứ ba
 Khả năng sạc nhanh
 Sạc không dây
 iOS 14 với các tiện ích được thiết kế lại trên Màn Hình Chính, Thư Viện Ứng Dụng hoàn toàn mới, App Clips cùng nhiều tính năng khác
                    
                    
                    ', N'asset/img/Product/product-items/iPhone/0012165_iphone-11-128gb_240(1).jpeg', N'                                                                        iPhone 11 với hệ thống camera kép với Ultra Wide. Chế độ Ban Đêm và chất lượng video tuyệt vời.  Chống nước và chống bụi. Thời lượng pin lâu. Với 6 màu tuyệt đẹp. Trải nghiệm iPhone 11.

Tính năng nổi bật
Màn hình Liquid Retina HD LCD 6.1 inch
Chống nước và chống bụi (chống nước ở độ sâu 2 mét trong vòng tối đa 30 phút, đạt mức IP68)
 Hệ thống camera kép 12MP với camera Ultra Wide và Wide; chế độ Ban Đêm, chế độ Chân Dung, và khả năng quay video 4K tốc độ tối đa 60 fps
 Camera trước TrueDepth 12MP với chế độ Chân Dung, có khả năng quay video 4K, và quay video chậm
 Xác thực bảo mật với Face ID
 Chip A13 Bionic với Neural Engine thế hệ thứ ba
 Khả năng sạc nhanh
 Sạc không dây
 iOS 14 với các tiện ích được thiết kế lại trên Màn Hình Chính, Thư Viện Ứng Dụng hoàn toàn mới, App Clips cùng nhiều tính năng khác
                    
                    
                    ', N'asset/img/Product/product-items/iPhone/0012165_iphone-11-128gb_240(2).jpeg', 16990000, N'asset/img/Product/product-items/iPhone/0012165_iphone-11-128gb_240.jpeg', 1)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (39, N'iPad mini 6', 11590000, N'iPad mini 6 (2021) iPad mini mới. Thiết kế màn hình toàn phần với màn hình Liquid Retina 8.3 inch. Chip A15 Bionic mạnh mẽ với Neural Engine. Camera trước Ultra Wide 12MP với tính năng Trung Tâm Màn Hình. Cổng kết nối USB-C. Mạng 5G siêu nhanh. Ghi chú, đánh dấu tài liệu hoặc phác thảo ngay khi những ý tưởng lớn xuất hiện trong đầu với Apple Pencil (thế hệ thứ 2) có khả năng gắn kết bằng nam châm và sạc không dây.

Tính năng nổi bật

Màn hình Liquid Retina 8.3 inch tuyệt đẹp với True Tone và dải màu rộng
Chip A15 Bionic với Neural Engine
Xác thực bảo mật với Touch ID
Camera sau Wide 12MP, camera trước Ultra Wide 12MP với tính năng Trung Tâm Màn Hình
Hiện có các màu tím, ánh sao, hồng và xám bạc
Loa stereo ở cạnh trên và cạnh dưới 
Mạng 5G cho tốc độ tải xuống, xem video và nghe nhạc trực tuyến nhanh như chớp
Luôn kết nối với Wi-Fi 6 siêu nhanh
Thời lượng pin lên tới 10 giờ
Cổng kết nối USB-C để sạc và kết nối phụ kiện
Tương thích với Apple Pencil (thế hệ thứ 2)
iPadOS 15 sở hữu sức mạnh độc đáo, dễ sử dụng và được thiết kế cho tính đa năng của iPad', N'asset/img/Product/product-items/iPad/0000593_ipad-mini-6_240(1).jpg', N'Nối tiếp sự thành công của những thế hệ trước, Apple đã cho ra mắt iPad mini 6 trong sự kiện tháng 9/2021 của mình. Sản phẩm gây ấn tượng khi có sự lột xác về mặt thiết kế, kèm theo nhiều sự nâng cấp đáng chú ý. Chiếc tablet thế hệ thứ 6 này sẽ phục vụ tối ưu nhu cầu của người dùng ngay cả khi sở hữu kích thước vừa phải, nhỏ gọn.', N'asset/img/Product/product-items/iPad/0000593_ipad-mini-6_240(2).jpg', 14990000, N'asset/img/Product/product-items/iPad/0000593_ipad-mini-6_240.png', 2)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (43, N'iPad Air 5', 13990000, N'iPad Air 5 (2022) iPad Air. Với màn hình Liquid Retina 10.9 inch sống động. Chip Apple M1 đột phá cho hiệu năng nhanh hơn, giúp iPad Air trở nên siêu mạnh mẽ để sáng tạo và chơi game di động. Sở hữu Touch ID, camera tiên tiến, 5G và Wi-Fi 6 nhanh như chớp, cổng USB-C, cùng khả năng hỗ trợ Magic Keyboard và Apple Pencil (thế hệ thứ 2).

Tính năng nổi bật

Màn hình Liquid Retina 10.9 inch với True Tone, dải màu rộng P3 và lớp phủ chống phản chiếu
Chip Apple M1 với Neural Engine
Camera Wide 12MP
Camera trước Ultra Wide 12MP với tính năng Trung Tâm Màn Hình
Ổ lưu trữ lên đến 256GB
Hiện có màu Xanh Dương, Tím, Hồng, Ánh Sao và Xám Bạc
Loa stereo ở cạnh trên và cạnh dưới
Xác thực bảo mật với Touch ID
Pin dùng cả ngày
Wi-Fi 6 và mạng 5G
Cổng kết nối USB-C để sạc và kết nối phụ kiện
Tương thích với Magic Keyboard, Smart Keyboard Folio và Apple Pencil (thế hệ thứ 2)
iPadOS 15 sở hữu sức mạnh độc đáo, dễ sử dụng và được thiết kế cho tính đa năng của iPad', N'asset/img/Product/product-items/iPad/0000595_ipad-air-5_240(1).jpg', N'Mỗi khi một chiếc iPad mới vừa ra lò như một cơn chấn động thật sự bùng nổ. Đến năm 2022, chúng ta lại tiếp tục bùng nổ với chiếc iPad mới mang tên iPad Air 5 với nhiều cải tiến đáng giá. Thế hệ thứ 5 này mang đến cho bạn những điểm gì vượt trội hay có gì sáng giá để sở hữu, hãy để lại phần bình luận ở bên dưới nhé.', N'asset/img/Product/product-items/iPad/0000595_ipad-air-5_240(2).jpg', 16990000, N'asset/img/Product/product-items/iPad/0000595_ipad-air-5_240.png', 2)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (44, N'iPad Air 4', 15990000, N'iPad Air 2020. Màn hình Liquid Retina 10.9 inch tuyệt đẹp và công nghệ True Tone cho bạn những trải nghiệm thị giác thật dễ chịu. Chip A14 Bionic mới cùng công nghệ Neural Engine là nền tảng sức mạnh giúp bạn biên tập video 4K, soạn nhạc và giải trí cùng các trò chơi đẳng cấp, mọi tác vụ đều trở nên vô cùng đơn giản. Touch ID nhanh nhạy và dễ sử dụng với tính năng bảo mật cao, hệ thống camera hiện đại, USB-C, hỗ trợ đa dạng phụ kiện kể cả Magic Keyboard và Apple Pencil (thế hệ thứ 2).

Tính năng nổi bật

Màn hình Liquid Retina 10.9 inch sắc nét với True Tone và dải màu rộng P3
Chip A14 Bionic với Neural Engine
Xác thực bảo mật với Touch ID
Camera sau 12MP, camera trước FaceTime HD 7MP
Hiện có các màu Bạc, Xám Bạc, Hồng Kim, Xanh Lá và Xanh Da Trời
Âm thanh stereo rộng
Wi-Fi 6 (802.11ax) và dữ liệu di động LTE Gigabit
Thời lượng pin lên đến 10 giờ
Cổng kết nối USB-C để sạc và kết nối phụ kiện
Hỗ trợ Magic Keyboard, Smart Keyboard Folio và Apple Pencil (thế hệ thứ 2)
iPadOS 14 mang đến cho bạn các chức năng mới được thiết kế dành riêng cho iPad', N'asset/img/Product/product-items/iPad/0000594_ipad-air-4_240(1).jpg', N'Những năm qua, Apple vẫn đang là thương hiệu thống lĩnh trên thị trường với danh mục sản phẩm vô cùng đa dạng. Bên cạnh những mẫu iPhone thiết kế thời thượng, các dòng máy tính bảng nhà “Táo khuyết” cũng được nhiều người dùng ưa chuộng. Năm 2013, Apple lần đầu tiên giới thiệu mẫu iPad Air thế hệ đầu tiên. Mới đây, công ty đã cho ra mắt mẫu iPad Air 10.9 inch (2020) – 4G – 64GB hoàn toàn mới. Với hiệu suất xử lý đa tác vụ và thiết kế mỏng, nhẹ vô cùng, các tín đồ nhà Táo không thể bỏ qua sản phẩm tuyệt vời này.', N'asset/img/Product/product-items/iPad/0000594_ipad-air-4_240(2).jpg', 19990000, N'asset/img/Product/product-items/iPad/0000594_ipad-air-4_240.png', 2)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (46, N'iMac M1 2021 24 inch', 27990000, N'Apple iMac M1 2021 24 inch 7-Core GPU 8GB RAM 256GB SSD

iMac 24 inch (2021) Thay đổi ngoạn mục với chip Apple M1, iMac nay mỏng ấn tượng và mạnh không thể tưởng. Được tạo tác để nổi bật trong mọi môi trường và phù hợp hoàn toàn với cuộc sống của bạn.

Tính năng nổi bật
Màn hình Retina 4.5K 24 inch với gam màu rộng P3 và độ sáng 500 nit
Chip Apple M1 đem đến hiệu năng mạnh mẽ với CPU 8 lõi và GPU 7 hoặc 8 lõi
Thiết kế mỏng ấn tượng 11.5mm với sắc màu sống động
Camera FaceTime HD 1080p với M1 ISP để quay video chất lượng ấn tượng
Dãy ba micro chuẩn phòng thu để thực hiện cuộc gọi và ghi âm tiếng trong như pha lê
Hệ thống âm thanh sáu loa cho trải nghiệm âm thanh chất lượng cao và mạnh mẽ ấn tượng
Bộ lưu trữ SSD siêu nhanh lên đến 512GB
Hai cổng Thunderbolt / USB và lên đến hai cổng USB
Wi-Fi 6 siêu nhanh và công nghệ không dây Bluetooth 5.0
Phối màu hoàn hảo giữa Magic Mouse và Magic Keyboard hoặc Magic Keyboard và Touch ID
macOS sở hữu thiết kế ấn tượng, dễ sử dụng và phối hợp mượt mà với iPhone
Có các màu xanh dương, xanh lá, hồng, bạc, vàng, cam và tím', N'asset/img/Product/product-items/Mac/0000807_imac-m1-2021-24-inch-7-core-gpu8gb256gb_240(1).jpg', N'Máy tính để bàn Apple M1 sở hữu card đồ hoạ tích hợp 8 nhân, cung cấp tốc độ xử lý về hình ảnh đồ hoạ nhanh gấp 2 lần so với phiên bản tiền nhiệm, đáp ứng tốt nhu cầu sử dụng các phần mềm như Photoshop, Lightroom, Final Cut, Xcode,...

Máy tính để bàn đồ hoạ - kỹ thuật này có RAM 8 GB mang đến khả năng đa nhiệm ổn định, chuyển qua lại giữa các phần mềm đang sử dụng mượt mà, nhanh chóng không lo bị giật, lag.', N'asset/img/Product/product-items/Mac/0000807_imac-m1-2021-24-inch-7-core-gpu8gb256gb_240(2).jpg', 34990000, N'asset/img/Product/product-items/Mac/0000807_imac-m1-2021-24-inch-7-core-gpu8gb256gb_240.jpg', 3)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (48, N'iMac 2020 27" MXWT2', 34750000, N'iMac 27 inch màn hình Retina 5K giờ đây tích hợp bộ xử lý tối tân, bộ nhớ nhanh hơn, đồ họa mạnh mẽ và lưu trữ SSD siêu nhanh.  Màn hình Retina 5K sống động tốt hơn bao giờ hết với công nghệ True Tone và mặt kính có cấu trúc nano (tùy chọn).  Với hệ điều hành macOS và các ứng dụng được tích hợp sẵn, iMac 27 inch là chiếc máy tính đa năng sáng tạo, mạnh mẽ hơn bao giờ hết.

Tính năng nổi bật
Màn hình Retina 5K 27 inch (theo đường chéo) với độ phân giải 5120×2880
Mặt kính có cấu trúc Nano (tùy chọn)
Bộ xử lý Intel Core i5 sáu lõi hoặc Intel Core i7 tám lõi thế hệ thứ 10
Đồ họa AMD Radeon Pro 5300 hoặc 5500 XT
Lưu trữ SSD siêu nhanh
Hai cổng Thunderbolt 3 (USB-C)
Bốn cổng USB-A
Cổng Gigabit Ethernet
Camera FaceTime HD 1080p
Wi-Fi 802.11ac và Bluetooth 5.0
Magic Mouse 2
Magic Keyboard
macOS Big Sur với thiết kế mới đầy táo bạo cùng nhiều cập nhật quan trọng cho các ứng dụng Safari, Messages và Maps', N'asset/img/Product/product-items/Mac/0000833_imac-2020-27-mxwt2-31-6c8gb-256gbrp5300x-soa_240(1).jpg', N'Hiển thị mọi thứ cực sống động với màn hình Retina độ phân giải lên đến (5120 x 2880), màn hình 27 inch. Màn hình iMac có độ sáng 500 nits, và khả năng hiển thị đến một tỷ màu cho hình ảnh rực rỡ để bạn tận hưởng những thước phim chất lượng, màu sắc có độ chính xác cao để làm đồ họa, thiết kế...

Với công nghệ True Tone, Apple đưa trải nghiệm xem của bạn lên tầm cao mới nhờ khả năng tự điều chỉnh màu sắc để phù hợp với môi trường quan sát. Màn hình iMac đáp ứng tốt nhu cầu đồ họa chuyên nghiệp, dựng hình 3D, cắt chỉnh film....', N'asset/img/Product/product-items/Mac/0000833_imac-2020-27-mxwt2-31-6c8gb-256gbrp5300x-soa_240(2).jpg', 42990000, N'asset/img/Product/product-items/Mac/0000833_imac-2020-27-mxwt2-31-6c8gb-256gbrp5300x-soa_240.png', 3)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (52, N'Mac Studio M1 Max', 49990000, N'Mac Studio. Một cỗ máy siêu gọn nhẹ, phù hợp hoàn hảo với bàn làm việc với khả năng kết nối được cải tiến cho studio của bạn. Bạn có thể chọn giữa M1 Max siêu nhanh hoặc M1 Ultra hoàn toàn mới — chip mạnh nhất từ trước đến nay được thiết kế cho máy tính cá nhân.

Tính năng nổi bật
Chip Apple M1 Max hoặc M1 Ultra tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU
CPU lên đến 20 lõi sở hữu hiệu năng nhanh hơn đến 3.8x để giúp bạn vượt qua mọi giới hạn
GPU lên đến 64 lõi cho hiệu năng nhanh hơn đến 4.5x để xử lý các luồng công việc có đồ họa khủng như kết xuất mô hình 3D
Neural Engine lên đến 32 lõi cho công nghệ máy học hiện đại
Bộ nhớ thống nhất lên đến 128GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy
Ổ lưu trữ SSD siêu nhanh lên đến 8TB giúp mở các ứng dụng và tập tin chỉ trong tích tắc
Kết nối không dây nhanh với Wi-Fi 6
Lên đến sáu cổng Thunderbolt 4, hai cổng USB-A, cổng HDMI, cổng Ethernet 10Gb, khe thẻ nhớ SDXC và jack cắm âm thanh 3.5 mm
macOS Monterey cho phép bạn kết nối, chia sẻ và sáng tạo hơn bao giờ hết, với các bản cập nhật FaceTime đầy thú vị và Safari đã được thiết kế lại
Thiết kế cực kỳ nhỏ gọn với kích thước 7.7 inch vuông, cao 3.7 inch, màu bạc', N'asset/img/Product/product-items/Mac/0010612_mac-studio-m1-max_240(1).jpg', N'Mac Studio M1 Max 10 core CPU là sản phẩm máy tính mới nhất vừa được nhà Apple cho ra mắt. Sở hữu ngoại hình cực kỳ nhỏ gọn nhưng được trang bị cấu hình siêu vượt trội sẵn sàng cùng người dùng chinh phục mọi tác vụ khó nhằn nhất.', N'asset/img/Product/product-items/Mac/0010612_mac-studio-m1-max_240(2).jpg', 59990000, N'asset/img/Product/product-items/Mac/0010612_mac-studio-m1-max_240.jpg', 3)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (54, N'Mac Mini M2', 15390000, N'                        Nay với chip M2, Mac mini mang đến tốc độ bạn cần. Từ những bản thuyết trình phong phú đến chơi game nhập vai, M2 xử lý tất tật từ công việc đến giải trí. Với một dãy cổng đa dạng giúp kết nối tất cả các thiết bị yêu thích của bạn, Mac mini sẵn sàng cho mọi tác vụ.

Tính năng nổi bật – Mac mini M2

Chip M2 cho tốc độ và hiệu năng vượt trội
CPU 8 lõi cho hiệu năng nhanh hơn đến 18% để xử lý nhanh chóng các tác vụ hàng ngày1
GPU 10 lõi cho hiệu năng nhanh hơn đến 35% để xử lý các ứng dụng và game đòi hỏi cao về đồ họa1
Neural Engine 16 lõi cho công nghệ máy học hiện đại
Bộ nhớ thống nhất từ 8GB đến 24GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy
Ổ lưu trữ SSD siêu nhanh giúp mở các ứng dụng và tập tin chỉ trong tích tắc
Hỗ trợ kết nối tối đa hai màn hình
Hệ thống tản nhiệt tiên tiến mang lại hiệu năng đột phá
Kết nối không dây nhanh với Wi-Fi 6E2
Hai cổng Thunderbolt 4, một cổng HDMI, hai cổng USB-A, jack cắm tai nghe, Ethernet Gigabit hoặc 10Gb
Thiết kế vuông 7,7 inch màu bạc cực kỳ nhỏ gọn
macOS Ventura mang đến cho bạn những phương thức mới và hiệu quả để hoàn thành nhiều việc hơn, chia sẻ và cộng tác trên tất cả các thiết bị Apple
                    ', N'asset/img/Product/product-items/Mac/0011564_mac-mini-m2-10-core-gpu-8gb-ram-256gb-ssd_240(1).jpeg', N'                        Sở hữu vẻ ngoài sang trọng đặc trưng nhà Táo khuyết kết hợp cùng hiệu năng đỉnh cao với con chip Apple M2, Mac mini M2 2023 10-core GPU dễ dàng chinh phục mọi tác vụ từ cơ bản tới nâng cao, phục vụ tốt nhu cầu học tập, làm việc và giải trí của người dùng.
                    ', N'asset/img/Product/product-items/Mac/0011564_mac-mini-m2-10-core-gpu-8gb-ram-256gb-ssd_240(2).jpeg', 19990000, N'asset/img/Product/product-items/Mac/0011564_mac-mini-m2-10-core-gpu-8gb-ram-256gb-ssd_240.jpeg', 3)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (55, N'Apple Watch Series 3 Nhôm', 4990000, N'Apple Watch Series 3 (GPS) Theo dõi tình trạng sức khỏe. Theo dõi các bài tập luyện và mọi hoạt động trong ngày của bạn. Luôn kết nối với mọi người và cập nhật những thông tin bạn quan tâm. Apple Watch Series 3 giúp bạn làm mọi việc ngay từ cổ tay.

Tính năng nổi bật
Xem nhanh thông tin quan trọng trên màn hình Retina
Theo dõi nhịp tim bất cứ lúc nào với ứng dụng Nhịp Tim
Nhận thông báo về nhịp tim nhanh và chậm
Nhận cuộc gọi và trả lời tin nhắn ngay từ cổ tay
Đồng bộ nhạc và podcast yêu thích
Theo dõi hoạt động hàng ngày của bạn trên Apple Watch và xem xu hướng của bạn trong ứng dụng Thể Dục trên iPhone
Đo lường các hoạt động thể dục của bạn như chạy, đi bộ, đạp xe, tập yoga, bơi lội và khiêu vũ
Thiết kế chống thấm nước khi bơi lội
SOS Khẩn Cấp giúp bạn gọi xin trợ giúp ngay từ cổ tay
S3 có bộ xử lý lõi kép
watchOS 7 sở hữu tính năng theo dõi giấc ngủ, chỉ đường khi đi xe đạp và mặt đồng hồ có thể tùy chỉnh mới
Vỏ nhôm hiện có hai màu ', N'asset/img/Product/product-items/Watch/0000897_apple-watch-series-3-nhom_240(1).jpeg', N'Apple Watch S3 LTE 42 mm viền nhôm dây cao su là phiên bản đồng hồ thông minh hỗ trợ eSim vừa được giới thiệu. Đồng hồ có thiết kế trẻ trung, hiện đại cùng nhiều tiện ích về sức khỏe, thể thao dành cho người dùng. ', N'asset/img/Product/product-items/Watch/0000897_apple-watch-series-3-nhom_240(2).png', 5990000, N'asset/img/Product/product-items/Watch/0000897_apple-watch-series-3-nhom_240.png', 4)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (56, N'Apple Watch Series 6 Nhôm GPS', 6990000, N'Apple Watch Series 6 Nhôm (GPS) Với cảm biến và ứng dụng mới để đo nồng độ ôxi trong máu, thông báo nhịp tim cùng các tính năng tiên tiến khác về sức khỏe, Apple Watch Series 6 là chiếc đồng hồ bảo vệ bạn.

Phiên bản GPS cho phép bạn nhận cuộc gọi và trả lời tin nhắn ngay từ cổ tay
 Đo nồng độ ôxi trong máu của bạn bằng một cảm biến và ứng dụng hoàn toàn mới
 Theo dõi nhịp tim bất cứ lúc nào với ứng dụng Nhịp Tim
 Nhận thông báo về nhịp tim nhanh và chậm
 Màn hình Retina Luôn Bật sáng hơn 2,5 lần lúc ở ngoài trời khi bạn hạ cổ tay xuống
 S6 SiP nhanh hơn tới 20 phần trăm so với Series 5
 5GHz Wi-Fi và chip U1 Ultra-Wideband
 Theo dõi hoạt động hàng ngày của bạn trên Apple Watch và xem xu hướng của bạn trong ứng dụng Thể
Dục trên iPhone
Đo lường các hoạt động thể dục của bạn như chạy, đi bộ, đạp xe, tập yoga, bơi lội và khiêu vũ
 Thiết kế chống thấm nước khi bơi lội
 Đồng bộ nhạc và podcast yêu thích
 La bàn được tích hợp sẵn cùng các số đo độ cao theo thời gian thực
 Có thể phát hiện nếu bạn bị té ngã mạnh, rồi tự động gọi dịch vụ cứu hộ khẩn cấp giúp bạn
SOS Khẩn Cấp giúp bạn nhận được sự trợ giúp ngay từ cổ tay
watchOS 7 sở hữu tính năng theo dõi giấc ngủ, chỉ đường khi đi xe đạp và mặt đồng hồ có thể tùy chỉnh mới
Vỏ nhôm có thêm nhiều màu mới
Vỏ nhôm hoặc thép không gỉ với nhiều màu mới', N'asset/img/Product/product-items/Watch/0011777_apple-watch-series-6-nhom-gps_240(1).jpg', N'Một sản phẩm có thể hoạt động trơn tru, mượt mà thì không chỉ nhờ con chip mạnh mà còn phải nhờ vào hệ điều hành tối ưu và tương thích hoàn toàn với con chip, Apple đã làm được điều đó trên các sản phẩm của họ.

Không chỉ vậy, hệ điều hành WatchOS 7 còn mang đến nhiều tính năng mới hiện đại hơn, giúp cho người dùng trải nghiệm cuộc sống hoàn hảo hơn. (Phiên bản hệ điều hành WatchOS 7 phù hợp với thời điểm sản phẩm mới ra mắt).', N'asset/img/Product/product-items/Watch/0011777_apple-watch-series-6-nhom-gps_240(2).jpg', 11990000, N'asset/img/Product/product-items/Watch/0011777_apple-watch-series-6-nhom-gps_240.png', 4)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (58, N'Apple Watch SE Nhôm GPS + Cellular', 7490000, N'Apple Watch SE 2022 Nhôm GPS + Cellular: Các tính năng mới hoàn toàn. Giá vẫn nhẹ nhàng. Các tính năng thiết yếu giúp bạn luôn kết nối, năng động, khỏe mạnh, và an toàn.

Tính năng nổi bật

Nhận cuộc gọi và trả lời tin nhắn ngay từ cổ tay
Nhanh hơn đến 20% so với Apple Watch SE phiên bản trước1
Các tính năng an toàn tiên tiến, bao gồm Phát Hiện Ngã, SOS Khẩn Cấp2 và Phát Hiện Va Chạm
Theo dõi hoạt động hàng ngày của bạn trên Apple Watch và xem xu hướng của bạn trong ứng dụng Thể Dục trên iPhone
Ứng dụng Bài Tập cải tiến bổ sung các hình thức tập luyện nâng cao
Nhận thông báo nhịp tim cao và thấp và thông báo nhịp không đều3
Nghe nhạc và podcast bạn yêu thích (dùng với các phiên bản hỗ trợ GPS)
Thiết kế chống nước khi bơi
Tính năng theo dõi các giai đoạn ngủ giúp bạn biết thời gian Giấc Ngủ REM, Giấc Ngủ Chính, và Giấc Ngủ Sâu
WatchOS 9 sở hữu ứng dụng Bài Tập cải tiến, ứng dụng Thuốc và Các Giai Đoạn Ngủ mới, cùng thông tin chuyên sâu hơn về sức khỏe tim mạch', N'asset/img/Product/product-items/Watch/0001204_apple-watch-se-gps-cellular-44mm_240(1).jpg', N'Apple Watch SE có sẵn rất nhiều mặt đồng hồ để bạn có thể thay đổi theo sở thích bất cứ lúc nào. Chiếc đồng hồ sẽ luôn là đồng hồ mới tùy theo cá tính của bạn. Ngoài ra bạn còn có thể hiển thị nhiều thông tin trên mặt đồng hồ như thời tiết, độ ẩm, la bàn. Nếu vẫn cảm thấy chưa đủ, kho ứng dụng App Store sẽ mang đến cho bạn một kho mặt đồng hồ khổng lồ.', N'asset/img/Product/product-items/Watch/0001204_apple-watch-se-gps-cellular-44mm_240(2).jpg', 11990000, N'asset/img/Product/product-items/Watch/0001204_apple-watch-se-gps-cellular-44mm_240.png', 4)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (60, N'Apple Watch Ultra LTE 49mm Trail Loop size M/L', 20390000, N'Tính năng nổi bật
Các tính năng và cảm biến chuyên dụng, cùng với ba dây đeo mới được thiết kế cho các hoạt động khám phá, phiêu lưu, và rèn luyện sức bền
Vỏ titan hàng không chuyên dụng 49mm cân bằng hoàn hảo giữa các yêu cầu về trọng lượng, độ bền và khả năng chống ăn mòn
Màn hình Apple Watch lớn nhất và sáng nhất giúp bạn nhìn thấy rõ ràng hơn trong mọi điều kiện
Thời lượng pin lên đến 36 giờ ở chế độ sử dụng thông thường, cùng với thiết lập nguồn điện thấp cho thời lượng pin còn lâu hơn nữa
Hệ thống GPS tần số kép chuẩn xác cung cấp vị trí chính xác để tính toán khoảng cách, tốc độ, và lộ trình.
Chống nước ở độ sâu 100m2
Dung sai nhiệt độ hoạt động lớn hơn khi đeo trên cổ tay, thích ứng tuyệt vời với các điều kiện môi trường vô cùng đa dạng
Nút Tác Vụ tùy chỉnh có thể đánh dấu Tọa Độ Điểm La Bàn, bắt đầu Quay Về, đánh dấu các phần trong bài tập luyện, bật đèn pin, và hơn thế nữa
Các tính năng an toàn tiên tiến, bao gồm Còi Báo, Quay Về, Phát Hiện Ngã, SOS Khẩn Cấp và Phát Hiện Va Chạm
Ứng dụng Bài Tập cải tiến với các chỉ số mới, chế độ xem mới, và nhiều hình thức tập luyện nâng cao
Ứng dụng La Bàn được thiết kế lại hoàn toàn với tọa độ điểm và Quay Về
Thiết bị đo độ sâu và cảm biến nhiệt độ nước tự động kích hoạt khi bạn lặn.
Được thiết kế cho hoạt động lặn giải trí với bình dưỡng khí và lặn tự do từ 40 mét trở xuống
Mạng di động tích hợp giúp bạn luôn kết nối với mọi người và cập nhật thông tin bạn quan tâm nhất
Các cảm biến sức khỏe tối tân cho phép bạn đo điện tâm đồ (ECG) và đo nhịp tim, theo dõi sự thay đổi nhiệt độ7 để nắm bắt thông tin chuyên sâu về chu kỳ kinh nguyệt, và đo nồng độ oxy trong máu
Theo dõi hoạt động hàng ngày của bạn trên Apple Watch và xem xu hướng của bạn trong ứng dụng Thể Dục trên iPhone
Nghe trực tuyến hoặc đồng bộ nhạc và podcast yêu thích
watchOS 9 sở hữu ứng dụng Bài Tập cải tiến, ứng dụng Thuốc và Các Giai Đoạn Ngủ mới, cùng thông tin chuyên sâu hơn về sức khỏe tim mạch', N'asset/img/Product/product-items/Watch/0009011_apple-watch-ultra-lte-49mm-trail-loop-size-ml_240(1).jpeg', N'Đồng hồ thông minh Apple Watch Ultra sở hữu màn hình lớn, độ phân giải 410 x 502 pixels, hoạt động trên tấm nền OLED cao cấp, mang đến một không gian hiển thị rộng rãi với độ sắc nét cực kỳ cao. Chưa hết, thiết bị còn hỗ trợ độ sáng màn hình cao, giúp bạn tha hồ hoạt động ở ngoài trời mà vẫn có thể xem mọi chi tiết trên đồng hồ một cách rõ ràng.', N'asset/img/Product/product-items/Watch/0009011_apple-watch-ultra-lte-49mm-trail-loop-size-ml_240(2).jpeg', 23990000, N'asset/img/Product/product-items/Watch/0009011_apple-watch-ultra-lte-49mm-trail-loop-size-ml_240.png', 4)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (62, N'EarPods with Lightning', 550000, N'Earpods Lightning MMTN2 chính hãng – Thiết kế thông minh cùng trang bị microphone và các phím điều chỉnh tiện dụng
Tai nghe Apple Earpods Lightning MMTN2 là một sản phẩm không thể thiếu nếu như các bạn là tín đồ của Apple. Apple Earpods Lightning một sản phẩm tuyệt hảo phù hợp với các dòng điện thoại iPhone, iPad, iPod hỗ trợ iOS 10 trở lên. Đến với ShopDunk để sở hữu một tai nghe Earpods Lightning MMTN2 tiện lợi cao và các thiết bị âm thanh giá rẻ tốt nhất.', N'asset/img/Product/product-items/Sounds/0001060_earpods-with-lightning_240(1).jpg', N'Apple Earpods Lightning – Thiết kế hai đầu tai hình hạt đậu ôm trọn trong tai hiện đại và tối ưu cho âm thanh
Tai nghe Earpods với Lightning Connection được thiết kế với màu trắng trang nhã cho bạn thể hiện phong cách trẻ trung, năng động, sành điệu tạo cảm giác thời thượng cho chính người sử dụng. Hai đầu tai được thiết kế giống như hai hạt đậu, ôm gọn trong tai giúp tai nghe cách âm tốt nhất cho bạn tận hưởng trọn vẹn từng khoảnh khắc âm nhạc.', N'asset/img/Product/product-items/Sounds/0001060_earpods-with-lightning_240(2).jpg', 790000, N'asset/img/Product/product-items/Sounds/0001060_earpods-with-lightning_240.png', 5)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (63, N'AirPods Pro (2021)', 4850000, N'AirPods Pro (2021) có tính năng Chủ Động Khử Tiếng Ồn giúp người nghe đắm chìm trong thế giới âm thanh. Chế Độ Xuyên Âm giúp bạn nghe được âm thanh của thế giới xung quanh. AirPods Pro chống mồ hôi và chống nước và kích cỡ tai nghe tùy chỉnh được tạo sự thoải mái cả ngày dài.

Tính năng nổi bật
Tính năng Chủ Động Khử Tiếng Ồn giúp ngăn chặn các âm thanh bên ngoài lọt vào tai để bạn có thể đắm chìm vào âm nhạc
Chế Độ Xuyên Âm giúp bạn nghe và tương tác với thế giới xung quanh
Chế độ âm thanh không gian với tính năng theo dõi chuyển động của đầu đưa âm thanh đến quanh bạn
EQ thích ứng sẽ tự động điều chỉnh nhạc hướng vào tai bạn
Đầu silicon mềm mại với ba kích cỡ khác nhau tạo sự thoải mái và ôm khít
Cảm biến lực giúp bạn dễ dàng điều khiển chương trình giải trí, trả lời hoặc kết thúc cuộc gọi, và thực hiện nhiều tác vụ khác
Chống mồ hôi và chống nước
Tổng thời gian nghe hơn 24 giờ với Hộp Sạc MagSafe
Thiết lập dễ dàng, có khả năng nhận biết khi đeo, và tự động chuyển đổi để mang lại trải nghiệm tuyệt vời
Dễ dàng chia sẻ âm thanh giữa hai bộ AirPods trên iPhone, iPad, iPod touch hoặc Apple TV', N'asset/img/Product/product-items/Sounds/0012020_airpods-pro-2021_240(1).jpg', N'Thiết kế Airpods Pro 2021 cải tiến tăng độ êm nhẹ khi đeo
AirPods Pro 2021 được Apple tái thiết kế nhằm mang đến trải nghiệm nghe nhạc êm ái, không gây đau tai cho bạn. Mỗi bên củ tai Apple AirPod có thiết kế nhét trong, với ba kích thước đệm tai silicone khác nhau cho bạn tự chọn kích thước vừa nhất. Phần đệm tai cũng được Apple thiết kế để ngăn tạp âm lọt vào trong, cho bạn một trải nghiệm nghe nhạc trọn vẹn.', N'asset/img/Product/product-items/Sounds/0012020_airpods-pro-2021_240(2).jpg', 6790000, N'asset/img/Product/product-items/Sounds/0012020_airpods-pro-2021_240.jpg', 5)
INSERT [dbo].[Product] ([IdProduct], [Name_product], [Price], [Discription], [Image_description], [Discription2], [Image_description2], [Discount], [Image], [IdCategory]) VALUES (64, N'Tai nghe Apple AirPods 3 sạc không dây MagSafe', 4650000, N'AirPods 3 (gen 3) Giới thiệu AirPods hoàn toàn mới. Sở hữu tính năng âm thanh không gian đưa âm nhạc đến quanh bạn, EQ thích ứng điều chỉnh nhạc hướng vào tai bạn và thời lượng pin lâu hơn. Tai nghe có khả năng chống mồ hôi và chống nước, mang đến cho bạn trải nghiệm tuyệt vời.

Tính năng nổi bật
Chế độ âm thanh không gian với tính năng theo dõi chuyển động của đầu đưa âm thanh đến quanh bạn
EQ thích ứng sẽ tự động điều chỉnh nhạc hướng vào tai bạn
Thiết kế có đường viền hoàn toàn mới
Cảm biến lực giúp bạn dễ dàng điều khiển chương trình giải trí, trả lời hoặc kết thúc cuộc gọi, và thực hiện nhiều tác vụ khác
Chống mồ hôi và chống nước
Thời gian nghe lên đến 6 giờ với một lần sạc
Tổng thời gian nghe lên đến 30 giờ với Hộp Sạc MagSafe
Thiết lập dễ dàng, có khả năng nhận biết khi đeo, và tự động chuyển đổi để mang lại trải nghiệm tuyệt vời
Dễ dàng chia sẻ âm thanh giữa hai bộ AirPods trên iPhone, iPad, iPod touch hoặc Apple TV', N'asset/img/Product/product-items/Sounds/0000230_tai-nghe-apple-airpods-3-sac-khong-day-magsafe_240(2).jpg', N'Một trong những thế hệ tai nghe không dây được ưa chuộng nhất trên thị trường hiện nay là Apple AirPods 3 Magsafe. Tuy mới chỉ có được ra mắt giữa tháng 10 vừa qua nhưng AirPods 3 của Apple đã nhận được nhiều sự ưa chuộng từ phía người dùng và nhanh chóng trở nên phổ biến trên thị trường thời gian vừa rồi. Với thiết kế gọn nhẹ, bền bỉ cùng chất lượng âm thanh đỉnh cao, AirPods 3 chắc chắn là mẫu tai nghe Apple hoàn hảo mà bạn rất nên sở hữu.', N'asset/img/Product/product-items/Sounds/0000230_tai-nghe-apple-airpods-3-sac-khong-day-magsafe_240(1).jpg', 4650000, N'asset/img/Product/product-items/Sounds/0000230_tai-nghe-apple-airpods-3-sac-khong-day-magsafe_240.png', 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [IsStatus]) VALUES (1, N'chờ Xác Nhận')
INSERT [dbo].[Status] ([Id], [IsStatus]) VALUES (2, N'Xác Nhận')
INSERT [dbo].[Status] ([Id], [IsStatus]) VALUES (3, N'Vận Chuyển')
INSERT [dbo].[Status] ([Id], [IsStatus]) VALUES (4, N'Đã Giao')
INSERT [dbo].[Status] ([Id], [IsStatus]) VALUES (5, N'Đã Hủy')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
/****** Object:  Index [PK_Account_1]    Script Date: 6/11/2023 10:39:00 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [PK_Account_1] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__681E8A60D26DF1C0]    Script Date: 6/11/2023 10:39:00 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[User_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([Idstatus])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [fk_Order_Details_Order] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Order] ([IdOrder])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [fk_Order_Details_Order]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [fk_Order_Details_Prodcut] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([IdProduct])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [fk_Order_Details_Prodcut]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fk_prodcut_Category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([IdCategory])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fk_prodcut_Category]
GO
USE [master]
GO
ALTER DATABASE [ASP_DATA] SET  READ_WRITE 
GO
