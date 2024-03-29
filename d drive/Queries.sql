USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 7/24/2019 1:06:19 PM ******/
CREATE DATABASE [ECommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerce', FILENAME = N'C:\Users\apurva.shepal\ECommerce.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECommerce_log', FILENAME = N'C:\Users\apurva.shepal\ECommerce_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ECommerce] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ECommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ECommerce]
GO
/****** Object:  UserDefinedFunction [dbo].[udfCalculateDiscount]    Script Date: 7/24/2019 1:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[udfCalculateDiscount]
(
	-- Add the parameters for the function here

    @quantity INT,
    @price float,
    @discount Float

)
RETURNS 	 float
 
AS
BEGIN
	-- Declare the return variable here


	-- Add the T-SQL statements to compute the return value here
	
	-- Return the result of the function
	RETURN @quantity * @price * (1 -  @discount*100)/100;

END

GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/24/2019 1:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountNo] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[phone] [int] NULL,
	[email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeliveryDetails]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeliveryDetails](
	[DeliveryId] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[DeliveryAddress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[pin] [int] NULL,
	[AccountNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountId] [varchar](20) NOT NULL,
	[DiscountName] [varchar](50) NULL,
	[DiscountPercent] [float] NULL,
	[Validtill] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DiscountCoupon]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DiscountCoupon](
	[DiscountId] [int] NOT NULL,
	[CouponName] [varchar](50) NULL,
	[validity] [date] NULL,
	[DiscountPercentage] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory](
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](50) NULL,
	[quantity] [int] NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderTable]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderTable](
	[OrderId] [int] NOT NULL,
	[Amount] [int] NULL,
	[CartNum] [int] NULL,
	[AccountNo] [int] NULL,
	[DiscountId] [varchar](20) NULL,
	[OrderDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ShippingId] [int] NOT NULL,
	[ShipmentStatus] [varchar](20) NULL,
	[OrderId] [int] NULL,
	[DeliveryId] [int] NULL,
	[ShipmentDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShippingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartNum] [int] NOT NULL,
	[CartStatus] [varchar](20) NULL,
	[ItemID] [int] NULL,
	[quantity] [int] NULL,
	[AccountNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DeliveryDetails]  WITH CHECK ADD FOREIGN KEY([AccountNo])
REFERENCES [dbo].[Account] ([AccountNo])
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD FOREIGN KEY([CartNum])
REFERENCES [dbo].[ShoppingCart] ([CartNum])
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([DiscountId])
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([DiscountId])
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[DeliveryDetails] ([DeliveryId])
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderTable] ([OrderId])
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderTable] ([OrderId])
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderTable] ([OrderId])
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[Inventory] ([ItemId])
GO
/****** Object:  StoredProcedure [dbo].[udspCallFunction]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- ===========================================
CREATE PROCEDURE [dbo].[udspCallFunction]

	
	@ItemId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
 declare @quantity INT;
    Declare @price Float;
    Declare @discount float;
	Declare @discountedPrice float;
	Declare @ID int;
	SET NOCOUNT ON;

select @quantity  = quantity from ShoppingCart;
select @price =  Amount  from OrderTable;
select @discount = Discountpercent from Discount;
select @Id =  OrderId from OrderTable;


    -- Insert statements for procedure here
	
select	@discountedPrice =  dbo.udfCalculateDiscount(@quantity,@price,@discount);
update OrderTable set Amount = @discountedPrice where OrderId = @ItemId;


END

GO
/****** Object:  StoredProcedure [dbo].[udstpRefund]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[udstpRefund]
	-- Add the parameters for the stored procedure here
	@InvoiceId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @orderstate varchar(50);
	Declare @AccountNo int;
	Declare @OrderID int;
	Declare @Amount float;
    -- Insert statements for procedure here
	Select @Orderstate =   ShipmentStatus from ShippingDetails
	Select @AccountNo = AccountNo from Invoice ;
	Select @OrderId = OrderId from Invoice;
	Select @Amount = Amount from OrderTable;
	if @OrderState = 'Returned' OR 'Delivered'
	begin
	update Account set Credit= @Amount where AccountNo= @AccountNo;
	update  ShippingDetails set ShipmentStatus ='Refunded' where  OrderId = @OrderId ;
	
	End

    Else
		Begin

		Print 'No REfunds';
       	End
	
	

END

GO
USE [master]
GO
ALTER DATABASE [ECommerce] SET  READ_WRITE 
GO


create View yearlyReport as
select O.OrderId,A.Name, O.Amount from OrderTable O,Account A  where OrderDate between  DATEADD(YEAR, -1, convert(varchar, getdate(), 6)) AND convert(varchar, getdate(), 6) AND O.AccountNo= A.AccountNo ;


select * from yearlyReport


Create View MonthlyReport As
select O.OrderId,A.Name, O.Amount from OrderTable O,Account A  where OrderDate between  DATEADD(MONTH, -1, convert(varchar, getdate(), 6)) AND convert(varchar, getdate(), 6) AND O.AccountNo= A.AccountNo ;

select * from MonthlyReport



create View DailyReport As
select O.OrderId,A.Name,I.ItemName from OrderTable O,Account A,ShoppingCart s,Inventory I  where OrderDate between  DATEADD(DAY, -1, convert(varchar, getdate(), 6)) AND convert(varchar, getdate(), 6) AND O.AccountNo= A.AccountNo AND s.ItemID = I.ItemId ;

select * from DailyReport  

CREATE SYNONYM [dbo].[Daily] FOR [ECommerce].[dbo].[DailyReport]
CREATE SYNONYM [dbo].[Monthly] FOR [ECommerce].[dbo].[MonthlyReport]
CREATE SYNONYM [dbo].[Yearly] FOR [ECommerce].[dbo].[YearlyReport]


SET NOCOUNT ON 
DECLARE @Sum float, @Amount Float
DECLARE my_cursor CURSOR FOR
SELECT Amount FROM OrderTable Where Amount > 0
OPEN my_cursor
FETCH NEXT FROM my_cursor INTO @Amount
WHILE @@FETCH_STATUS = 0
BEGIN
      SELECT SUM(@Amount)
    
	  FETCH NEXT FROM my_cursor INTO @Amount
         
END
CLOSE my_cursor
DEALLOCATE my_cursor


USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 7/24/2019 1:06:19 PM ******/
CREATE DATABASE [ECommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerce', FILENAME = N'C:\Users\apurva.shepal\ECommerce.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECommerce_log', FILENAME = N'C:\Users\apurva.shepal\ECommerce_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ECommerce] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ECommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ECommerce]
GO
/****** Object:  UserDefinedFunction [dbo].[udfCalculateDiscount]    Script Date: 7/24/2019 1:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[udfCalculateDiscount]
(
	-- Add the parameters for the function here

    @quantity INT,
    @price float,
    @discount Float

)
RETURNS 	 float
 
AS
BEGIN
	-- Declare the return variable here


	-- Add the T-SQL statements to compute the return value here
	
	-- Return the result of the function
	RETURN @quantity * @price * (1 -  @discount*100)/100;

END

GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/24/2019 1:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountNo] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[phone] [int] NULL,
	[email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeliveryDetails]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeliveryDetails](
	[DeliveryId] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[DeliveryAddress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[pin] [int] NULL,
	[AccountNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountId] [varchar](20) NOT NULL,
	[DiscountName] [varchar](50) NULL,
	[DiscountPercent] [float] NULL,
	[Validtill] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DiscountCoupon]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DiscountCoupon](
	[DiscountId] [int] NOT NULL,
	[CouponName] [varchar](50) NULL,
	[validity] [date] NULL,
	[DiscountPercentage] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory](
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](50) NULL,
	[quantity] [int] NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderTable]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderTable](
	[OrderId] [int] NOT NULL,
	[Amount] [int] NULL,
	[CartNum] [int] NULL,
	[AccountNo] [int] NULL,
	[DiscountId] [varchar](20) NULL,
	[OrderDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ShippingId] [int] NOT NULL,
	[ShipmentStatus] [varchar](20) NULL,
	[OrderId] [int] NULL,
	[DeliveryId] [int] NULL,
	[ShipmentDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShippingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartNum] [int] NOT NULL,
	[CartStatus] [varchar](20) NULL,
	[ItemID] [int] NULL,
	[quantity] [int] NULL,
	[AccountNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DeliveryDetails]  WITH CHECK ADD FOREIGN KEY([AccountNo])
REFERENCES [dbo].[Account] ([AccountNo])
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD FOREIGN KEY([CartNum])
REFERENCES [dbo].[ShoppingCart] ([CartNum])
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([DiscountId])
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([DiscountId])
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[DeliveryDetails] ([DeliveryId])
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderTable] ([OrderId])
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderTable] ([OrderId])
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderTable] ([OrderId])
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[Inventory] ([ItemId])
GO
/****** Object:  StoredProcedure [dbo].[udspCallFunction]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- ===========================================
CREATE PROCEDURE [dbo].[udspCallFunction]

	
	@ItemId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
 declare @quantity INT;
    Declare @price Float;
    Declare @discount float;
	Declare @discountedPrice float;
	Declare @ID int;
	SET NOCOUNT ON;

select @quantity  = quantity from ShoppingCart;
select @price =  Amount  from OrderTable;
select @discount = Discountpercent from Discount;
select @Id =  OrderId from OrderTable;


    -- Insert statements for procedure here
	
select	@discountedPrice =  dbo.udfCalculateDiscount(@quantity,@price,@discount);
update OrderTable set Amount = @discountedPrice where OrderId = @ItemId;


END

GO
/****** Object:  StoredProcedure [dbo].[udstpRefund]    Script Date: 7/24/2019 1:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[udstpRefund]
	-- Add the parameters for the stored procedure here
	@InvoiceId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @orderstate varchar(50);
	Declare @AccountNo int;
	Declare @OrderID int;
	Declare @Amount float;
    -- Insert statements for procedure here
	Select @Orderstate =   ShipmentStatus from ShippingDetails
	Select @AccountNo = AccountNo from Invoice ;
	Select @OrderId = OrderId from Invoice;
	Select @Amount = Amount from OrderTable;
	if @OrderState = 'Returned' OR 'Delivered'
	begin
	update Account set Credit= @Amount where AccountNo= @AccountNo;
	update  ShippingDetails set ShipmentStatus ='Refunded' where  OrderId = @OrderId ;
	
	End

    Else
		Begin

		Print 'No REfunds';
       	End
	
	

END

GO
USE [master]
GO
ALTER DATABASE [ECommerce] SET  READ_WRITE 
GO


create View yearlyReport as
select O.OrderId,A.Name, O.Amount from OrderTable O,Account A  where OrderDate between  DATEADD(YEAR, -1, convert(varchar, getdate(), 6)) AND convert(varchar, getdate(), 6) AND O.AccountNo= A.AccountNo ;


select * from yearlyReport


Create View MonthlyReport As
select O.OrderId,A.Name, O.Amount from OrderTable O,Account A  where OrderDate between  DATEADD(MONTH, -1, convert(varchar, getdate(), 6)) AND convert(varchar, getdate(), 6) AND O.AccountNo= A.AccountNo ;

select * from MonthlyReport



create View DailyReport As
select O.OrderId,A.Name,I.ItemName from OrderTable O,Account A,ShoppingCart s,Inventory I  where OrderDate between  DATEADD(DAY, -1, convert(varchar, getdate(), 6)) AND convert(varchar, getdate(), 6) AND O.AccountNo= A.AccountNo AND s.ItemID = I.ItemId ;

select * from DailyReport  

CREATE SYNONYM [dbo].[Daily] FOR [ECommerce].[dbo].[DailyReport]
CREATE SYNONYM [dbo].[Monthly] FOR [ECommerce].[dbo].[MonthlyReport]
CREATE SYNONYM [dbo].[Yearly] FOR [ECommerce].[dbo].[YearlyReport]


SET NOCOUNT ON 
DECLARE @Sum float, @Amount Float
DECLARE my_cursor CURSOR FOR
SELECT Amount FROM OrderTable Where Amount > 0
OPEN my_cursor
FETCH NEXT FROM my_cursor INTO @Amount
WHILE @@FETCH_STATUS = 0
BEGIN
      SELECT SUM(@Amount)

	  FETCH NEXT FROM my_cursor INTO @Amount
         
END
CLOSE my_cursor
DEALLOCATE my_cursor


     Print SUM(@Amount)



