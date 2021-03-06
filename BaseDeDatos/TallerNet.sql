USE [master]
GO
/****** Object:  Database [TallerNet]    Script Date: 3/07/2022 22:17:07 ******/
CREATE DATABASE [TallerNet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TallerNet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TallerNet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TallerNet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TallerNet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TallerNet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TallerNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TallerNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TallerNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TallerNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TallerNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TallerNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [TallerNet] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TallerNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TallerNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TallerNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TallerNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TallerNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TallerNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TallerNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TallerNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TallerNet] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TallerNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TallerNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TallerNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TallerNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TallerNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TallerNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TallerNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TallerNet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TallerNet] SET  MULTI_USER 
GO
ALTER DATABASE [TallerNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TallerNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TallerNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TallerNet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TallerNet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TallerNet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TallerNet] SET QUERY_STORE = OFF
GO
USE [TallerNet]
GO
/****** Object:  User [useradmin]    Script Date: 3/07/2022 22:17:07 ******/
CREATE USER [useradmin] FOR LOGIN [useradmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [useradmin]
GO
/****** Object:  Schema [Logger]    Script Date: 3/07/2022 22:17:07 ******/
CREATE SCHEMA [Logger]
GO
/****** Object:  Schema [logs]    Script Date: 3/07/2022 22:17:07 ******/
CREATE SCHEMA [logs]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 3/07/2022 22:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[IdArticulo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Costo] [decimal](18, 2) NOT NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[IdArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 3/07/2022 22:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[IdPedido] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[CodUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidoDetalle]    Script Date: 3/07/2022 22:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoDetalle](
	[IdPedidoDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[IdArticulo] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_PedidoDetalle] PRIMARY KEY CLUSTERED 
(
	[IdPedidoDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Usuario]    Script Date: 3/07/2022 22:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[CodUsuario] [nvarchar](50) NOT NULL,
	[Clave] [nvarchar](50) NOT NULL,
	[Fec_Registro] [datetime] NOT NULL,
	[Activo] [nvarchar](50) NOT NULL,
	[Nombres] [nvarchar](150) NOT NULL,
	[Perfil] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Logger].[Logs]    Script Date: 3/07/2022 22:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Logger].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[MessageTemplate] [nvarchar](max) NULL,
	[Level] [nvarchar](max) NULL,
	[TimeStamp] [datetime] NULL,
	[Exception] [nvarchar](max) NULL,
	[Properties] [nvarchar](max) NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulo] ON 

INSERT [dbo].[Articulo] ([IdArticulo], [Nombre], [Precio], [Costo], [FechaRegistro]) VALUES (1, N'BOTAS', CAST(100.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Articulo] ([IdArticulo], [Nombre], [Precio], [Costo], [FechaRegistro]) VALUES (2, N'MONITOR', CAST(300.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Articulo] ([IdArticulo], [Nombre], [Precio], [Costo], [FechaRegistro]) VALUES (3, N'MOUSE', CAST(50.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Articulo] ([IdArticulo], [Nombre], [Precio], [Costo], [FechaRegistro]) VALUES (4, N'TECLADO', CAST(100.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Articulo] ([IdArticulo], [Nombre], [Precio], [Costo], [FechaRegistro]) VALUES (7, N'CASE', CAST(400.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(N'2022-05-20T10:23:24.860' AS DateTime))
INSERT [dbo].[Articulo] ([IdArticulo], [Nombre], [Precio], [Costo], [FechaRegistro]) VALUES (8, N'LAPTOP', CAST(2000.00 AS Decimal(18, 2)), CAST(1600.00 AS Decimal(18, 2)), CAST(N'2022-05-20T10:28:15.667' AS DateTime))
INSERT [dbo].[Articulo] ([IdArticulo], [Nombre], [Precio], [Costo], [FechaRegistro]) VALUES (9, N'e8bb2c65-dd0c-4cbf-b2e5-10a18bf8c636', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-05-20T10:28:37.290' AS DateTime))
INSERT [dbo].[Articulo] ([IdArticulo], [Nombre], [Precio], [Costo], [FechaRegistro]) VALUES (10, N'4f37e77e-5aee-4d55-a7bf-da75402437b9', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-05-20T10:29:07.583' AS DateTime))
INSERT [dbo].[Articulo] ([IdArticulo], [Nombre], [Precio], [Costo], [FechaRegistro]) VALUES (11, N'46fb1085-f8c0-4f20-9657-ad2e87d90b84', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-05-20T10:33:57.867' AS DateTime))
INSERT [dbo].[Articulo] ([IdArticulo], [Nombre], [Precio], [Costo], [FechaRegistro]) VALUES (12, N'cdff9501-2174-4716-818f-3dcd0ce1e98f', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-05-20T10:35:26.860' AS DateTime))
INSERT [dbo].[Articulo] ([IdArticulo], [Nombre], [Precio], [Costo], [FechaRegistro]) VALUES (13, N'string', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-07-04T03:05:37.240' AS DateTime))
INSERT [dbo].[Articulo] ([IdArticulo], [Nombre], [Precio], [Costo], [FechaRegistro]) VALUES (14, N'string', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-07-04T03:05:37.240' AS DateTime))
SET IDENTITY_INSERT [dbo].[Articulo] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedido] ON 

INSERT [dbo].[Pedido] ([IdPedido], [Fecha], [CodUsuario]) VALUES (1, CAST(N'2022-06-06T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Pedido] ([IdPedido], [Fecha], [CodUsuario]) VALUES (2, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 7)
SET IDENTITY_INSERT [dbo].[Pedido] OFF
GO
SET IDENTITY_INSERT [dbo].[PedidoDetalle] ON 

INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [IdArticulo], [Cantidad]) VALUES (1, 1, 2, 10)
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [IdArticulo], [Cantidad]) VALUES (2, 1, 4, 2)
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [IdArticulo], [Cantidad]) VALUES (4, 1, 3, 2)
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [IdArticulo], [Cantidad]) VALUES (5, 2, 7, 5)
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [IdArticulo], [Cantidad]) VALUES (6, 2, 8, 2)
SET IDENTITY_INSERT [dbo].[PedidoDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Usuario] ON 

INSERT [dbo].[Tbl_Usuario] ([IdUsuario], [CodUsuario], [Clave], [Fec_Registro], [Activo], [Nombres], [Perfil]) VALUES (2, N'MLOPEZ', N'123456', CAST(N'2022-05-20T10:23:30.393' AS DateTime), N'1', N'Maria Lopez', N'adm')
INSERT [dbo].[Tbl_Usuario] ([IdUsuario], [CodUsuario], [Clave], [Fec_Registro], [Activo], [Nombres], [Perfil]) VALUES (3, N'f6737503-2ae4-4a28-8960-6becef3f0ce1', N'f6737503-2ae4-4a28-8960-6becef3f0ce1', CAST(N'2022-05-20T10:28:26.567' AS DateTime), N'0', N'Maria', N'adm')
INSERT [dbo].[Tbl_Usuario] ([IdUsuario], [CodUsuario], [Clave], [Fec_Registro], [Activo], [Nombres], [Perfil]) VALUES (4, N'e8bb2c65-dd0c-4cbf-b2e5-10a18bf8c636', N'e8bb2c65-dd0c-4cbf-b2e5-10a18bf8c636', CAST(N'2022-05-20T10:28:42.293' AS DateTime), N'1', N'Luis', N'adm')
INSERT [dbo].[Tbl_Usuario] ([IdUsuario], [CodUsuario], [Clave], [Fec_Registro], [Activo], [Nombres], [Perfil]) VALUES (5, N'4f37e77e-5aee-4d55-a7bf-da75402437b9', N'4f37e77e-5aee-4d55-a7bf-da75402437b9', CAST(N'2022-05-20T10:29:12.600' AS DateTime), N'0', N'Roberta', N'adm')
INSERT [dbo].[Tbl_Usuario] ([IdUsuario], [CodUsuario], [Clave], [Fec_Registro], [Activo], [Nombres], [Perfil]) VALUES (6, N'46fb1085-f8c0-4f20-9657-ad2e87d90b84', N'46fb1085-f8c0-4f20-9657-ad2e87d90b84', CAST(N'2022-05-20T10:34:10.460' AS DateTime), N'1', N'Jose', N'adm')
INSERT [dbo].[Tbl_Usuario] ([IdUsuario], [CodUsuario], [Clave], [Fec_Registro], [Activo], [Nombres], [Perfil]) VALUES (7, N'jperez', N'123456', CAST(N'2022-05-20T10:35:39.320' AS DateTime), N'1', N'Juan Perez', N'adm')
SET IDENTITY_INSERT [dbo].[Tbl_Usuario] OFF
GO
SET IDENTITY_INSERT [Logger].[Logs] ON 

INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (1, N'User profile is available. Using ''"C:\Users\herna\AppData\Local\ASP.NET\DataProtection-Keys"'' as key repository and Windows DPAPI to encrypt keys at rest.', N'User profile is available. Using ''{FullName}'' as key repository and Windows DPAPI to encrypt keys at rest.', N'Information', CAST(N'2022-07-03T01:29:38.377' AS DateTime), NULL, N'<properties><property key=''FullName''>C:\Users\herna\AppData\Local\ASP.NET\DataProtection-Keys</property><property key=''SourceContext''>Microsoft.AspNetCore.DataProtection.KeyManagement.XmlKeyManager</property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (2, N'Application started. Press Ctrl+C to shut down.', N'Application started. Press Ctrl+C to shut down.', N'Information', CAST(N'2022-07-03T01:29:39.233' AS DateTime), NULL, N'<properties><property key=''SourceContext''>Microsoft.Hosting.Lifetime</property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (3, N'Hosting environment: "Development"', N'Hosting environment: {envName}', N'Information', CAST(N'2022-07-03T01:29:39.237' AS DateTime), NULL, N'<properties><property key=''envName''>Development</property><property key=''SourceContext''>Microsoft.Hosting.Lifetime</property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (4, N'Content root path: "D:\Galaxy Trining\MiguelSalvador\ApiRest\Galaxy.ApiRest"', N'Content root path: {contentRoot}', N'Information', CAST(N'2022-07-03T01:29:39.237' AS DateTime), NULL, N'<properties><property key=''contentRoot''>D:\Galaxy Trining\MiguelSalvador\ApiRest\Galaxy.ApiRest</property><property key=''SourceContext''>Microsoft.Hosting.Lifetime</property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (5, N'Request starting HTTP/1.1 GET http://localhost:25632/weatherforecast  ', N'{HostingRequestStartingLog:l}', N'Information', CAST(N'2022-07-03T01:29:39.487' AS DateTime), NULL, N'<properties><property key=''Protocol''>HTTP/1.1</property><property key=''Method''>GET</property><property key=''ContentType''></property><property key=''ContentLength''></property><property key=''Scheme''>http</property><property key=''Host''>localhost:25632</property><property key=''PathBase''></property><property key=''Path''>/weatherforecast</property><property key=''QueryString''></property><property key=''HostingRequestStartingLog''>Request starting HTTP/1.1 GET http://localhost:25632/weatherforecast  </property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Diagnostics</property><property key=''RequestId''>4000000f-0006-ff00-b63f-84710c7967bb</property><property key=''RequestPath''>/weatherforecast</property><property key=''SpanId''>|3a2f313a-4706a131010f4bee.</property><property key=''TraceId''>3a2f313a-4706a131010f4bee</property><property key=''ParentId''></property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (6, N'Request starting HTTP/1.1 GET http://localhost:25632/  ', N'{HostingRequestStartingLog:l}', N'Information', CAST(N'2022-07-03T01:29:39.487' AS DateTime), NULL, N'<properties><property key=''Protocol''>HTTP/1.1</property><property key=''Method''>GET</property><property key=''ContentType''></property><property key=''ContentLength''></property><property key=''Scheme''>http</property><property key=''Host''>localhost:25632</property><property key=''PathBase''></property><property key=''Path''>/</property><property key=''QueryString''></property><property key=''HostingRequestStartingLog''>Request starting HTTP/1.1 GET http://localhost:25632/  </property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Diagnostics</property><property key=''RequestId''>40000003-0003-fd00-b63f-84710c7967bb</property><property key=''RequestPath''>/</property><property key=''SpanId''>|3a2f313b-4706a131010f4bee.</property><property key=''TraceId''>3a2f313b-4706a131010f4bee</property><property key=''ParentId''></property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (7, N'Executing endpoint ''"Galaxy.ApiRest.Controllers.WeatherForecastController.Get (Galaxy.ApiRest)"''', N'Executing endpoint ''{EndpointName}''', N'Information', CAST(N'2022-07-03T01:29:39.907' AS DateTime), NULL, N'<properties><property key=''EndpointName''>Galaxy.ApiRest.Controllers.WeatherForecastController.Get (Galaxy.ApiRest)</property><property key=''EventId''><structure type=''''><property key=''Name''>ExecutingEndpoint</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Routing.EndpointMiddleware</property><property key=''RequestId''>4000000f-0006-ff00-b63f-84710c7967bb</property><property key=''RequestPath''>/weatherforecast</property><property key=''SpanId''>|3a2f313a-4706a131010f4bee.</property><property key=''TraceId''>3a2f313a-4706a131010f4bee</property><property key=''ParentId''></property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (8, N'Request finished in 525.761ms 404 ', N'{HostingRequestFinishedLog:l}', N'Information', CAST(N'2022-07-03T01:29:39.987' AS DateTime), NULL, N'<properties><property key=''ElapsedMilliseconds''>525.761</property><property key=''StatusCode''>404</property><property key=''ContentType''></property><property key=''HostingRequestFinishedLog''>Request finished in 525.761ms 404 </property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Diagnostics</property><property key=''RequestId''>40000003-0003-fd00-b63f-84710c7967bb</property><property key=''RequestPath''>/</property><property key=''SpanId''>|3a2f313b-4706a131010f4bee.</property><property key=''TraceId''>3a2f313b-4706a131010f4bee</property><property key=''ParentId''></property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (9, N'Route matched with "{action = \"Get\", controller = \"WeatherForecast\"}". Executing controller action with signature "System.Collections.Generic.IEnumerable`1[Galaxy.ApiRest.WeatherForecast] Get()" on controller "Galaxy.ApiRest.Controllers.WeatherForecastController" ("Galaxy.ApiRest").', N'Route matched with {RouteData}. Executing controller action with signature {MethodInfo} on controller {Controller} ({AssemblyName}).', N'Information', CAST(N'2022-07-03T01:29:40.013' AS DateTime), NULL, N'<properties><property key=''RouteData''>{action = "Get", controller = "WeatherForecast"}</property><property key=''MethodInfo''>System.Collections.Generic.IEnumerable`1[Galaxy.ApiRest.WeatherForecast] Get()</property><property key=''Controller''>Galaxy.ApiRest.Controllers.WeatherForecastController</property><property key=''AssemblyName''>Galaxy.ApiRest</property><property key=''EventId''><structure type=''''><property key=''Id''>3</property><property key=''Name''>ControllerActionExecuting</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker</property><property key=''ActionId''>9add6ee8-2990-489f-b9d8-bc8e3c43ce01</property><property key=''ActionName''>Galaxy.ApiRest.Controllers.WeatherForecastController.Get (Galaxy.ApiRest)</property><property key=''RequestId''>4000000f-0006-ff00-b63f-84710c7967bb</property><property key=''RequestPath''>/weatherforecast</property><property key=''SpanId''>|3a2f313a-4706a131010f4bee.</property><property key=''TraceId''>3a2f313a-4706a131010f4bee</property><property key=''ParentId''></property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (10, N'Executing ObjectResult, writing value of type ''"Galaxy.ApiRest.WeatherForecast[]"''.', N'Executing ObjectResult, writing value of type ''{Type}''.', N'Information', CAST(N'2022-07-03T01:29:40.040' AS DateTime), NULL, N'<properties><property key=''Type''>Galaxy.ApiRest.WeatherForecast[]</property><property key=''EventId''><structure type=''''><property key=''Id''>1</property><property key=''Name''>ObjectResultExecuting</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Infrastructure.ObjectResultExecutor</property><property key=''ActionId''>9add6ee8-2990-489f-b9d8-bc8e3c43ce01</property><property key=''ActionName''>Galaxy.ApiRest.Controllers.WeatherForecastController.Get (Galaxy.ApiRest)</property><property key=''RequestId''>4000000f-0006-ff00-b63f-84710c7967bb</property><property key=''RequestPath''>/weatherforecast</property><property key=''SpanId''>|3a2f313a-4706a131010f4bee.</property><property key=''TraceId''>3a2f313a-4706a131010f4bee</property><property key=''ParentId''></property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (11, N'Executed action "Galaxy.ApiRest.Controllers.WeatherForecastController.Get (Galaxy.ApiRest)" in 102.6922ms', N'Executed action {ActionName} in {ElapsedMilliseconds}ms', N'Information', CAST(N'2022-07-03T01:29:40.127' AS DateTime), NULL, N'<properties><property key=''ActionName''>Galaxy.ApiRest.Controllers.WeatherForecastController.Get (Galaxy.ApiRest)</property><property key=''ElapsedMilliseconds''>102.6922</property><property key=''EventId''><structure type=''''><property key=''Id''>2</property><property key=''Name''>ActionExecuted</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker</property><property key=''ActionId''>9add6ee8-2990-489f-b9d8-bc8e3c43ce01</property><property key=''RequestId''>4000000f-0006-ff00-b63f-84710c7967bb</property><property key=''RequestPath''>/weatherforecast</property><property key=''SpanId''>|3a2f313a-4706a131010f4bee.</property><property key=''TraceId''>3a2f313a-4706a131010f4bee</property><property key=''ParentId''></property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (12, N'Executed endpoint ''"Galaxy.ApiRest.Controllers.WeatherForecastController.Get (Galaxy.ApiRest)"''', N'Executed endpoint ''{EndpointName}''', N'Information', CAST(N'2022-07-03T01:29:40.130' AS DateTime), NULL, N'<properties><property key=''EndpointName''>Galaxy.ApiRest.Controllers.WeatherForecastController.Get (Galaxy.ApiRest)</property><property key=''EventId''><structure type=''''><property key=''Id''>1</property><property key=''Name''>ExecutedEndpoint</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Routing.EndpointMiddleware</property><property key=''RequestId''>4000000f-0006-ff00-b63f-84710c7967bb</property><property key=''RequestPath''>/weatherforecast</property><property key=''SpanId''>|3a2f313a-4706a131010f4bee.</property><property key=''TraceId''>3a2f313a-4706a131010f4bee</property><property key=''ParentId''></property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (13, N'Request finished in 676.8338ms 200 application/json; charset=utf-8', N'{HostingRequestFinishedLog:l}', N'Information', CAST(N'2022-07-03T01:29:40.133' AS DateTime), NULL, N'<properties><property key=''ElapsedMilliseconds''>676.8338</property><property key=''StatusCode''>200</property><property key=''ContentType''>application/json; charset=utf-8</property><property key=''HostingRequestFinishedLog''>Request finished in 676.8338ms 200 application/json; charset=utf-8</property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Diagnostics</property><property key=''RequestId''>4000000f-0006-ff00-b63f-84710c7967bb</property><property key=''RequestPath''>/weatherforecast</property><property key=''SpanId''>|3a2f313a-4706a131010f4bee.</property><property key=''TraceId''>3a2f313a-4706a131010f4bee</property><property key=''ParentId''></property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (14, N'Request starting HTTP/1.1 GET http://localhost:25632/swagger/index.html  ', N'{HostingRequestStartingLog:l}', N'Information', CAST(N'2022-07-03T01:32:25.410' AS DateTime), NULL, N'<properties><property key=''Protocol''>HTTP/1.1</property><property key=''Method''>GET</property><property key=''ContentType''></property><property key=''ContentLength''></property><property key=''Scheme''>http</property><property key=''Host''>localhost:25632</property><property key=''PathBase''></property><property key=''Path''>/swagger/index.html</property><property key=''QueryString''></property><property key=''HostingRequestStartingLog''>Request starting HTTP/1.1 GET http://localhost:25632/swagger/index.html  </property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Diagnostics</property><property key=''RequestId''>4000000a-0002-fd00-b63f-84710c7967bb</property><property key=''RequestPath''>/swagger/index.html</property><property key=''SpanId''>|3a2f313c-4706a131010f4bee.</property><property key=''TraceId''>3a2f313c-4706a131010f4bee</property><property key=''ParentId''></property></properties>')
INSERT [Logger].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (15, N'Request finished in 26.667ms 404 ', N'{HostingRequestFinishedLog:l}', N'Information', CAST(N'2022-07-03T01:32:25.437' AS DateTime), NULL, N'<properties><property key=''ElapsedMilliseconds''>26.667</property><property key=''StatusCode''>404</property><property key=''ContentType''></property><property key=''HostingRequestFinishedLog''>Request finished in 26.667ms 404 </property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Diagnostics</property><property key=''RequestId''>4000000a-0002-fd00-b63f-84710c7967bb</property><property key=''RequestPath''>/swagger/index.html</property><property key=''SpanId''>|3a2f313c-4706a131010f4bee.</property><property key=''TraceId''>3a2f313c-4706a131010f4bee</property><property key=''ParentId''></property></properties>')
SET IDENTITY_INSERT [Logger].[Logs] OFF
GO
ALTER TABLE [dbo].[Articulo] ADD  CONSTRAINT [DF_Articulo_Precio]  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[Articulo] ADD  CONSTRAINT [DF_Articulo_Precio1]  DEFAULT ((0)) FOR [Costo]
GO
ALTER TABLE [dbo].[Articulo] ADD  CONSTRAINT [DF_Articulo_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Tbl_Usuario] ADD  CONSTRAINT [DF_Tbl_Usuario_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Tbl_Usuario] ADD  CONSTRAINT [DF_Tbl_Usuario_Nombres]  DEFAULT ('Jose') FOR [Nombres]
GO
ALTER TABLE [dbo].[Tbl_Usuario] ADD  CONSTRAINT [DF_Tbl_Usuario_Perfil]  DEFAULT ('adm') FOR [Perfil]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Tbl_Usuario] FOREIGN KEY([CodUsuario])
REFERENCES [dbo].[Tbl_Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Tbl_Usuario]
GO
ALTER TABLE [dbo].[PedidoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_Articulo] FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([IdArticulo])
GO
ALTER TABLE [dbo].[PedidoDetalle] CHECK CONSTRAINT [FK_PedidoDetalle_Articulo]
GO
ALTER TABLE [dbo].[PedidoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([IdPedido])
GO
ALTER TABLE [dbo].[PedidoDetalle] CHECK CONSTRAINT [FK_PedidoDetalle_Pedido]
GO
/****** Object:  StoredProcedure [dbo].[spPedidoPorId]    Script Date: 3/07/2022 22:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spPedidoPorId]
	@IdPedido INT
AS
BEGIN
 
SELECT [IdPedido]
      ,[Fecha]
      ,[CodUsuario]
  FROM [dbo].[Pedido] A
WHERE A.IdPedido = @IdPedido


END
GO
USE [master]
GO
ALTER DATABASE [TallerNet] SET  READ_WRITE 
GO
