USE [master]
GO
/****** Object:  Database [rvs]    Script Date: 11/12/2020 11:48:57 a. m. ******/
CREATE DATABASE [rvs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rvs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\rvs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'rvs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\rvs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [rvs] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rvs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rvs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rvs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rvs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rvs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rvs] SET ARITHABORT OFF 
GO
ALTER DATABASE [rvs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rvs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rvs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rvs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rvs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rvs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rvs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rvs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rvs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rvs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [rvs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rvs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rvs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rvs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rvs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rvs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rvs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rvs] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [rvs] SET  MULTI_USER 
GO
ALTER DATABASE [rvs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rvs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rvs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rvs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [rvs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [rvs] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [rvs] SET QUERY_STORE = OFF
GO
USE [rvs]
GO
/****** Object:  Table [dbo].[especialista]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialista](
	[id_especialista] [int] IDENTITY(1,1) NOT NULL,
	[id_ente] [int] NULL,
	[nombre] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[celular] [varchar](50) NOT NULL,
	[id_especialidad] [int] NOT NULL,
	[id_ciudad] [int] NOT NULL,
	[num_licencia] [int] NOT NULL,
	[fech_expedicion_licen] [date] NOT NULL,
 CONSTRAINT [PK_especialista] PRIMARY KEY CLUSTERED 
(
	[id_especialista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudad]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudad](
	[id_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ciudad] PRIMARY KEY CLUSTERED 
(
	[id_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[especialidad]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialidad](
	[id_especialidad] [int] IDENTITY(1,1) NOT NULL,
	[especialidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_especialidad] PRIMARY KEY CLUSTERED 
(
	[id_especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ente_salud]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ente_salud](
	[id_ente] [int] IDENTITY(1,1) NOT NULL,
	[id_persona] [int] NULL,
	[nit] [int] NOT NULL,
	[razon_social] [varchar](50) NOT NULL,
	[representante] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[sitio_web] [varchar](50) NOT NULL,
	[id_ciudad] [int] NOT NULL,
	[capacidad_pacientes] [int] NOT NULL,
 CONSTRAINT [PK_ente_salud_1] PRIMARY KEY CLUSTERED 
(
	[id_ente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaEspecialista]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaEspecialista]
AS
SELECT        dbo.especialista.nombre, dbo.ciudad.ciudad, dbo.especialidad.especialidad, dbo.especialista.correo, dbo.especialista.celular, dbo.especialista.num_licencia, dbo.especialista.fech_expedicion_licen, 
                         dbo.especialista.id_especialista, dbo.ente_salud.razon_social
FROM            dbo.ciudad INNER JOIN
                         dbo.especialista ON dbo.ciudad.id_ciudad = dbo.especialista.id_ciudad INNER JOIN
                         dbo.especialidad ON dbo.especialista.id_especialidad = dbo.especialidad.id_especialidad INNER JOIN
                         dbo.ente_salud ON dbo.ciudad.id_ciudad = dbo.ente_salud.id_ciudad AND dbo.especialista.id_ente = dbo.ente_salud.id_ente
GO
/****** Object:  Table [dbo].[cita]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cita](
	[id_cita] [int] IDENTITY(1,1) NOT NULL,
	[id_persona] [int] NOT NULL,
	[id_especialista] [int] NOT NULL,
	[fecha_cita] [date] NOT NULL,
	[id_hora] [int] NOT NULL,
	[calificacion] [int] NULL,
	[estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_cita] PRIMARY KEY CLUSTERED 
(
	[id_cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enfermedad]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enfermedad](
	[id_enfermedad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](1000) NOT NULL,
	[id_recomendacion] [int] NOT NULL,
 CONSTRAINT [PK_enfermedad] PRIMARY KEY CLUSTERED 
(
	[id_enfermedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hora_cita]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hora_cita](
	[id_hora] [int] IDENTITY(1,1) NOT NULL,
	[hora] [time](7) NOT NULL,
 CONSTRAINT [PK_hora_cita] PRIMARY KEY CLUSTERED 
(
	[id_hora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[id_persona] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[correo] [varchar](50) NULL,
	[celular] [varchar](50) NULL,
	[cedula] [int] NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recomendacion]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recomendacion](
	[id_recomendacion] [int] IDENTITY(1,1) NOT NULL,
	[recomendacion] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_recomendacion] PRIMARY KEY CLUSTERED 
(
	[id_recomendacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[rol] [varchar](50) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sintoma]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sintoma](
	[id_sintoma] [int] IDENTITY(1,1) NOT NULL,
	[sintoma] [varchar](500) NOT NULL,
 CONSTRAINT [PK_sintoma] PRIMARY KEY CLUSTERED 
(
	[id_sintoma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sintoma_enfermedad]    Script Date: 11/12/2020 11:48:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sintoma_enfermedad](
	[id_sintoma_enfermedad] [int] IDENTITY(1,1) NOT NULL,
	[id_sintoma] [int] NOT NULL,
	[id_enfermedad] [int] NOT NULL,
 CONSTRAINT [PK_sintoma_enfermedad] PRIMARY KEY CLUSTERED 
(
	[id_sintoma_enfermedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cita] ON 

INSERT [dbo].[cita] ([id_cita], [id_persona], [id_especialista], [fecha_cita], [id_hora], [calificacion], [estado]) VALUES (10, 1011, 6, CAST(N'2020-12-22' AS Date), 21, 4, N'Atendido')
INSERT [dbo].[cita] ([id_cita], [id_persona], [id_especialista], [fecha_cita], [id_hora], [calificacion], [estado]) VALUES (11, 1011, 6, CAST(N'2020-12-23' AS Date), 15, 5, N'Atendido')
INSERT [dbo].[cita] ([id_cita], [id_persona], [id_especialista], [fecha_cita], [id_hora], [calificacion], [estado]) VALUES (1010, 2012, 1007, CAST(N'2020-12-17' AS Date), 27, 2, N'Atendido')
INSERT [dbo].[cita] ([id_cita], [id_persona], [id_especialista], [fecha_cita], [id_hora], [calificacion], [estado]) VALUES (1011, 2012, 1007, CAST(N'2020-12-16' AS Date), 35, NULL, N'Reservada')
INSERT [dbo].[cita] ([id_cita], [id_persona], [id_especialista], [fecha_cita], [id_hora], [calificacion], [estado]) VALUES (2010, 3009, 2007, CAST(N'2020-12-16' AS Date), 11, 5, N'Atendido')
SET IDENTITY_INSERT [dbo].[cita] OFF
GO
SET IDENTITY_INSERT [dbo].[ciudad] ON 

INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (1, N'Cali')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (2, N'Buenaventura')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (3, N'Buga')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (4, N'Cartago')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (5, N'Tuluá')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (6, N'Palmira')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (7, N'Jamundí')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (8, N'Zarzal')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (9, N'Calima')
SET IDENTITY_INSERT [dbo].[ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[enfermedad] ON 

INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_recomendacion]) VALUES (1, N'Acalasia', N'La acalasia es un trastorno infrecuente del esófago que puede presentarse a cualquier edad. Afecta por igual a hombres y mujeres. En la mayor parte de los casos no se encuentra relación familiar. Se produce por la incapacidad del esófago de contraerse y empujar el alimento hasta el estómago (ausencia de las contracciones peristálticas) y por la falta de relajación del esfínter esofágico inferior (engrosamiento muscular localizado en la unión del esófago y el estómago que funciona como una válvula y permite el paso de los alimentos al estómago y evita que el contenido del estómago ascienda al esófago), que impide el correcto paso de los alimentos al estómago. Se origina por alteraciones de las estructuras nerviosas del esófago y su causa exacta no se conoce.

', 1)
INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_recomendacion]) VALUES (5, N'COVID-19', N'La COVID-19 es la enfermedad infecciosa causada por el coronavirus que se ha descubierto más recientemente. Tanto el nuevo virus como la enfermedad eran desconocidos antes de que estallara el brote en Wuhan (China) en diciembre de 2019.

', 1)
INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_recomendacion]) VALUES (7, N'Influenza', N'La influenza es una enfermedad respiratoria contagiosa provocada por los virus de la influenza que infectan la nariz, la garganta y en algunos casos los pulmones', 1)
INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_recomendacion]) VALUES (8, N'Sífilis ', N'La sífilis es una infección bacteriana que suele transmitirse por contacto sexual. La enfermedad comienza como una llaga indolora, por lo general en los genitales, el recto o la boca.', 1)
INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_recomendacion]) VALUES (9, N'Zika', N'Es una enfermedad que produce brote en la piel una elevación de la temperatura corporal, causada por el virus del zika (ZIKAV), transmitida por la picadura de hembras del mosquito Aedes', 1)
INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_recomendacion]) VALUES (10, N'Tabaquismo', N'El tabaquismo es la adicción al consumo de tabaco. ? El tabaquismo es uno de los efectos del tabaco en la salud. El consumo habitual de tabaco es una enfermedad que produce diferentes enfermedades, como cáncer, enfermedades cardiovasculares y enfermedades respiratorias.
', 1)
INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_recomendacion]) VALUES (11, N'Epilepsia', N'La epilepsia es un trastorno cerebral en el cual una persona tiene convulsiones repetidas durante un tiempo. Las convulsiones son episodios de actividad descontrolada y anormal de las neuronas que puede causar cambios en la atención o el comportamiento.
', 1)
INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_recomendacion]) VALUES (12, N'Asma', N'El asma es una enfermedad que afecta los pulmones. Es una de las enfermedades de duración prolongada más comunes en los niños, aunque los adultos también pueden padecerla. El asma causa sibilancias, dificultad para respirar, opresión en el pecho y tos durante la noche o temprano por la mañana.', 1)
INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_recomendacion]) VALUES (13, N'Neumonía', N'La neumonía, una infección de los pulmones, afecta anualmente y sin razón a millones de personas en todo el mundo. La neumonía con frecuencia se puede prevenir y por lo general se puede tratar. Disminuya su riesgo de contraer neumonía con vacunas y otras prácticas de vida saludables.

', 1)
SET IDENTITY_INSERT [dbo].[enfermedad] OFF
GO
SET IDENTITY_INSERT [dbo].[ente_salud] ON 

INSERT [dbo].[ente_salud] ([id_ente], [id_persona], [nit], [razon_social], [representante], [correo], [telefono], [sitio_web], [id_ciudad], [capacidad_pacientes]) VALUES (10, 1012, 19283749, N'Colsanitas', N'Armando', N'armando@gmail.com', N'3451223111', N'colsanita.com', 1, 200)
INSERT [dbo].[ente_salud] ([id_ente], [id_persona], [nit], [razon_social], [representante], [correo], [telefono], [sitio_web], [id_ciudad], [capacidad_pacientes]) VALUES (11, 2010, 99999999, N'Fuerzas Militares', N'Diego Marin', N'dgmarin@gmail.com', N'3123451231', N'fffmm.com', 2, 12)
INSERT [dbo].[ente_salud] ([id_ente], [id_persona], [nit], [razon_social], [representante], [correo], [telefono], [sitio_web], [id_ciudad], [capacidad_pacientes]) VALUES (1011, 2011, 1000987654, N'Sura', N'Anita', N'anita@gmail.com', N'3123451231', N'sura.com.co', 3, 100)
INSERT [dbo].[ente_salud] ([id_ente], [id_persona], [nit], [razon_social], [representante], [correo], [telefono], [sitio_web], [id_ciudad], [capacidad_pacientes]) VALUES (1012, 1010, 1293847312, N'Famisanar', N'Jorge', N'jorge@gmail.com', N'3123451231', N'famisanar.com', 4, 100)
INSERT [dbo].[ente_salud] ([id_ente], [id_persona], [nit], [razon_social], [representante], [correo], [telefono], [sitio_web], [id_ciudad], [capacidad_pacientes]) VALUES (1013, 1010, 9998231, N'Cafe Salud', N'Marcelo', N'marcelo@gmail.com', N'3123451231', N'cafesalud.com.co', 5, 54)
INSERT [dbo].[ente_salud] ([id_ente], [id_persona], [nit], [razon_social], [representante], [correo], [telefono], [sitio_web], [id_ciudad], [capacidad_pacientes]) VALUES (1014, 2011, 1909234123, N'Salud Total', N'Agustin L.', N'aglopex@outlook.com', N'3123123456', N'saludtotal.co', 6, 87)
INSERT [dbo].[ente_salud] ([id_ente], [id_persona], [nit], [razon_social], [representante], [correo], [telefono], [sitio_web], [id_ciudad], [capacidad_pacientes]) VALUES (1015, 1012, 1838123912, N'Colmena S. A.', N'Mariana', N'mari@hotmail.com', N'3125632341', N'colmena.com.co', 7, 100)
INSERT [dbo].[ente_salud] ([id_ente], [id_persona], [nit], [razon_social], [representante], [correo], [telefono], [sitio_web], [id_ciudad], [capacidad_pacientes]) VALUES (2011, 1010, 1000093872, N'Salud Vida', N'Jorge ', N'jorge@hotmial.com', N'3123213441', N'saludvida.com', 6, 130)
SET IDENTITY_INSERT [dbo].[ente_salud] OFF
GO
SET IDENTITY_INSERT [dbo].[especialidad] ON 

INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (1, N'Cardiología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (2, N'Endocrinología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (3, N'Radiología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (4, N'Ortopedia y Traumatología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (5, N'Psiquiatría')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (6, N'Urología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (7, N'Ginecología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (8, N'Oftalmología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (9, N'Otorrinolaringología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (10, N'Geriatría')
SET IDENTITY_INSERT [dbo].[especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[especialista] ON 

INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (6, 10, N'Jorge', N'Jorge@gmail.com', N'3123456723', 10, 1, 100093873, CAST(N'2020-12-10' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1006, 1014, N'Maria ', N'mari@hotmail.com', N'3123451231', 1, 2, 1000908987, CAST(N'2020-12-11' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1007, 1012, N'Yeny', N'yeni@gmail.com', N'31231231231', 2, 1, 190912312, CAST(N'2020-11-10' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1008, 1012, N'Jaime', N'jaime@outlook.com', N'3126783451', 1, 5, 198734521, CAST(N'2020-07-15' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1009, 11, N'Martha Paez', N'marthp@outlook.com', N'3123451231', 3, 4, 1908456342, CAST(N'2020-07-02' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1010, 1013, N'Marlon', N'marlon@gmail.com', N'3213451231', 2, 9, 1908987672, CAST(N'2019-06-26' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1011, 1014, N'Sandra Huertas', N'sandra@gmail.com', N'3123213211', 3, 9, 1928374712, CAST(N'2020-06-11' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1012, 1015, N'Edgar Fran', N'engardo@hotmail.com', N'3213213123', 5, 9, 1312312341, CAST(N'2017-07-22' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1013, 11, N'Ada Lopez', N'adaluz@gmail.com', N'3124454532', 4, 6, 1232332111, CAST(N'2016-08-03' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1014, 1011, N'Laura Beltran', N'laube@hotmail.com', N'3121231111', 4, 6, 1929129311, CAST(N'2020-07-02' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1015, 1015, N'Luis Redondo', N'ldhuerta@gmail.com', N'3151241412', 6, 6, 1131231231, CAST(N'2015-07-22' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1016, 10, N'Kleiver F.', N'kleiver@gmail.com', N'3123123132', 4, 1, 1110000000, CAST(N'2016-09-12' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1017, 1012, N'Fernandad', N'fer@hotmail.com', N'3123431231', 5, 3, 1928371821, CAST(N'2020-05-12' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1018, 1014, N'Paola Ramos', N'paola@hotmail.com', N'3154123121', 6, 8, 1234567098, CAST(N'2020-07-14' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (1019, 1011, N'Martina', N'maritina@gmail.com', N'3123123123', 7, 7, 1203929111, CAST(N'2020-08-12' AS Date))
INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (2007, 2011, N'Mariana', N'mariana@hotmail.com', N'3213213211', 10, 1, 1009386272, CAST(N'2019-06-11' AS Date))
SET IDENTITY_INSERT [dbo].[especialista] OFF
GO
SET IDENTITY_INSERT [dbo].[hora_cita] ON 

INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (1, CAST(N'00:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (2, CAST(N'00:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (4, CAST(N'01:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (5, CAST(N'02:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (6, CAST(N'02:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (7, CAST(N'03:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (8, CAST(N'03:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (9, CAST(N'04:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (10, CAST(N'04:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (11, CAST(N'05:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (12, CAST(N'05:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (13, CAST(N'06:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (14, CAST(N'06:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (15, CAST(N'07:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (16, CAST(N'07:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (17, CAST(N'08:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (18, CAST(N'08:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (19, CAST(N'09:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (20, CAST(N'09:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (21, CAST(N'10:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (22, CAST(N'10:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (23, CAST(N'11:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (24, CAST(N'11:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (25, CAST(N'12:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (26, CAST(N'12:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (27, CAST(N'13:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (28, CAST(N'13:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (29, CAST(N'14:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (30, CAST(N'14:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (31, CAST(N'15:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (32, CAST(N'15:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (33, CAST(N'16:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (34, CAST(N'16:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (35, CAST(N'17:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (36, CAST(N'17:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (37, CAST(N'18:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (38, CAST(N'18:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (39, CAST(N'19:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (40, CAST(N'19:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (41, CAST(N'20:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (42, CAST(N'20:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (43, CAST(N'21:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (44, CAST(N'21:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (45, CAST(N'22:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (46, CAST(N'22:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (47, CAST(N'23:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (48, CAST(N'23:30:00' AS Time))
SET IDENTITY_INSERT [dbo].[hora_cita] OFF
GO
SET IDENTITY_INSERT [dbo].[persona] ON 

INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (1009, 1, N'Luis', N'Huertas', N'ldhuertas56@misena.edu.co', N'3123139618', 1000941665, N'admin')
INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (1010, 2, N'Sebastian', N'Avendaño', N'sebastian@misena.edu.co', N'3143364464', 1000941682, N'123')
INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (1011, 3, N'Marco', N'Perez', N'marco@gmail.com', N'3123139618', 1098943275, N'123')
INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (1012, 2, N'Mauricio', N'Cardenas', N'mau@hotmail.com', N'3336412318', 92277272, N'123')
INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (2009, 3, N'Danna', N'Vanesa', N'danna@gmail.com', N'3153241231', 1000989781, N'123')
INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (2010, 2, N'Camilo', N'Vallesteros', N'camilo@gmail.com', N'3331231231', 97678812, N'123')
INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (2011, 2, N'Carolina', N'Hernandez', N'carolina@hotmail.com', N'3123456786', 19983748, N'123')
INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (2012, 3, N'Jorge ', N'Marin', N'jorgemarin@gmail.com', N'3123451231', 523975978, N'123')
INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (3009, 3, N'Jorge', N'Apolo', N'jorge@hotmial.com', N'3213213211', 123123123, N'123')
SET IDENTITY_INSERT [dbo].[persona] OFF
GO
SET IDENTITY_INSERT [dbo].[recomendacion] ON 

INSERT [dbo].[recomendacion] ([id_recomendacion], [recomendacion]) VALUES (1, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ')
INSERT [dbo].[recomendacion] ([id_recomendacion], [recomendacion]) VALUES (2, N'pax noche')
INSERT [dbo].[recomendacion] ([id_recomendacion], [recomendacion]) VALUES (3, N'pepino en los ojos')
INSERT [dbo].[recomendacion] ([id_recomendacion], [recomendacion]) VALUES (4, N'cicatricure')
SET IDENTITY_INSERT [dbo].[recomendacion] OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (1, N'Administrador')
INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (2, N'Contenido')
INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (3, N'Normal')
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[sintoma] ON 

INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (1, N'Dolor de cabeza')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (2, N'Moquera')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (3, N'Ojeras')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (4, N'Fiebre')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (5, N'Diarrea')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (6, N'Fatiga')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (7, N'Dolores musculares')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (8, N'Tos')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (9, N'Dolor de oidos')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (10, N'Dolor torácico')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (11, N'Vomito')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (12, N'Perdidade de peso')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (13, N'Falta de aire')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (14, N'Presión en el pecho')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (15, N'Incapacidad para habalr o moverse')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (16, N'Conjutivitis')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (17, N'Molestias y dolores')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (18, N'Cansancio')
SET IDENTITY_INSERT [dbo].[sintoma] OFF
GO
SET IDENTITY_INSERT [dbo].[sintoma_enfermedad] ON 

INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (1, 1, 5)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (6, 4, 5)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (7, 6, 5)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (8, 8, 5)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (9, 13, 5)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (10, 18, 5)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (11, 14, 5)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (12, 7, 5)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (13, 1, 1)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (14, 2, 1)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (15, 5, 1)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (16, 11, 1)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (17, 15, 1)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (18, 1, 7)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (19, 3, 7)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (20, 4, 7)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (21, 5, 7)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (22, 7, 7)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (23, 9, 7)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (24, 12, 7)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (25, 16, 7)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (26, 17, 7)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (27, 8, 8)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (28, 18, 8)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (29, 16, 8)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (30, 11, 8)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (31, 2, 8)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (32, 9, 1)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (35, 9, 9)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (36, 7, 9)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (37, 11, 9)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (38, 16, 9)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (39, 17, 9)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (40, 18, 10)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (41, 17, 10)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (42, 16, 10)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (43, 15, 10)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (44, 14, 10)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (45, 13, 10)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (46, 12, 10)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (47, 11, 10)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (48, 10, 10)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (49, 1, 10)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (50, 18, 11)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (51, 17, 11)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (52, 16, 11)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (53, 15, 11)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (54, 14, 11)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (55, 14, 12)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (56, 6, 12)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (57, 1, 12)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (58, 13, 12)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (59, 1, 13)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (60, 4, 13)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (61, 7, 13)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (62, 15, 13)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (63, 18, 13)
SET IDENTITY_INSERT [dbo].[sintoma_enfermedad] OFF
GO
ALTER TABLE [dbo].[cita]  WITH CHECK ADD  CONSTRAINT [FK_cita_especialista] FOREIGN KEY([id_especialista])
REFERENCES [dbo].[especialista] ([id_especialista])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cita] CHECK CONSTRAINT [FK_cita_especialista]
GO
ALTER TABLE [dbo].[cita]  WITH CHECK ADD  CONSTRAINT [FK_cita_hora] FOREIGN KEY([id_hora])
REFERENCES [dbo].[hora_cita] ([id_hora])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cita] CHECK CONSTRAINT [FK_cita_hora]
GO
ALTER TABLE [dbo].[enfermedad]  WITH CHECK ADD  CONSTRAINT [FK_enfermedad_recomendacion] FOREIGN KEY([id_recomendacion])
REFERENCES [dbo].[recomendacion] ([id_recomendacion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[enfermedad] CHECK CONSTRAINT [FK_enfermedad_recomendacion]
GO
ALTER TABLE [dbo].[ente_salud]  WITH CHECK ADD  CONSTRAINT [FK_ente_salud_ente_ciudad] FOREIGN KEY([id_ciudad])
REFERENCES [dbo].[ciudad] ([id_ciudad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ente_salud] CHECK CONSTRAINT [FK_ente_salud_ente_ciudad]
GO
ALTER TABLE [dbo].[ente_salud]  WITH CHECK ADD  CONSTRAINT [FK_ente_salud_persona] FOREIGN KEY([id_persona])
REFERENCES [dbo].[persona] ([id_persona])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ente_salud] CHECK CONSTRAINT [FK_ente_salud_persona]
GO
ALTER TABLE [dbo].[especialista]  WITH CHECK ADD  CONSTRAINT [FK_especialista_ente] FOREIGN KEY([id_ente])
REFERENCES [dbo].[ente_salud] ([id_ente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[especialista] CHECK CONSTRAINT [FK_especialista_ente]
GO
ALTER TABLE [dbo].[especialista]  WITH CHECK ADD  CONSTRAINT [FK_especialista_especialidad] FOREIGN KEY([id_especialidad])
REFERENCES [dbo].[especialidad] ([id_especialidad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[especialista] CHECK CONSTRAINT [FK_especialista_especialidad]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [FK_persona_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id_rol])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [FK_persona_rol]
GO
ALTER TABLE [dbo].[sintoma_enfermedad]  WITH CHECK ADD  CONSTRAINT [FK_sintoma_enfermedad_enfermedad] FOREIGN KEY([id_enfermedad])
REFERENCES [dbo].[enfermedad] ([id_enfermedad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sintoma_enfermedad] CHECK CONSTRAINT [FK_sintoma_enfermedad_enfermedad]
GO
ALTER TABLE [dbo].[sintoma_enfermedad]  WITH CHECK ADD  CONSTRAINT [FK_sintoma_enfermedad_sintoma] FOREIGN KEY([id_sintoma])
REFERENCES [dbo].[sintoma] ([id_sintoma])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sintoma_enfermedad] CHECK CONSTRAINT [FK_sintoma_enfermedad_sintoma]
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 11/12/2020 11:48:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_login]
	-- Add the parameters for the stored procedure here
	@cedula int, @contrasenia varchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM persona WHERE persona.cedula=@cedula and persona.password=@contrasenia;

END
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
         Begin Table = "ciudad"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "especialidad"
            Begin Extent = 
               Top = 6
               Left = 489
               Bottom = 102
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ente_salud"
            Begin Extent = 
               Top = 125
               Left = 0
               Bottom = 255
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "especialista"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 451
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
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaEspecialista'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaEspecialista'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaEspecialista'
GO
USE [master]
GO
ALTER DATABASE [rvs] SET  READ_WRITE 
GO
