USE [ProyectoServiu]
GO
/****** Object:  UserDefinedFunction [dbo].[fc_cantidad_carga]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_cantidad_carga] (@rutIngresado int) Returns int
AS
BEGIN
DECLARE @Numero_carga int;
SELECT @rutIngresado=COUNT(*)
FROM dbo.Postulante_Carga
WHERE rut_postulante=@rutIngresado;

 Return @rutIngresado;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_count_carga]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_count_carga] (@rutIngresado int) Returns int
AS
BEGIN
DECLARE @Numero_carga int;
SELECT @rutIngresado=COUNT(*)
FROM dbo.Postulante_Carga
WHERE rut_postulante=@rutIngresado;

 Return @rutIngresado;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_edad]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_edad] (@rut int) Returns int
AS
BEGIN

select @rut=edad
from Postulante
where rut_postulante = @rut;

 Return @rut;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_estado_civil]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_estado_civil] (@rut int) Returns varchar(50)
AS
BEGIN

Declare @estado_civil varchar(50)

select @estado_civil = e.nombre_estado_civil
from Postulante as p join estado_civil as e
on p.id_estado_civil = e.id_estado_civil
where p.rut_postulante = @rut;

 Return @estado_civil;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_estado_civilInt]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_estado_civilInt] (@rut int) Returns varchar(50)
AS
BEGIN

Declare @estado_civil varchar(50)

select @estado_civil = e.id_estado_civil
from Postulante as p join estado_civil as e
on p.id_estado_civil = e.id_estado_civil
where p.rut_postulante = @rut;

 Return @estado_civil;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_monto_ahorro]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_monto_ahorro] (@rut int) Returns int
AS
BEGIN

select @rut = c.cantidad
from Cuenta as c join Postulante as p
on p.id_cuenta = c.id_cuenta
where rut_postulante = @rut;


 Return @rut;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_pueblo_originario]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_pueblo_originario] (@rut int) Returns varchar(50)
AS
BEGIN

Declare @pueblo_originario varchar(50)

select @pueblo_originario = po.nombre
from Postulante as p join Pueblo_Originario as po
on p.id_pueblo_originario = po.id_pueblo_originario
where p.rut_postulante = @rut;

 Return @pueblo_originario;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_pueblo_originarioInt]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_pueblo_originarioInt] (@rut int) Returns int
AS
BEGIN

Declare @pueblo_originario int

select @pueblo_originario = po.id_pueblo_originario
from Postulante as p join Pueblo_Originario as po
on p.id_pueblo_originario = po.id_pueblo_originario
where p.rut_postulante = @rut;

 Return @pueblo_originario;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_puntaje_carga2]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_puntaje_carga2] (@total_carga int) Returns int
AS
BEGIN

select @total_carga=puntaje
from Tramo_Carga_Familiar
where @total_carga between minimo and maximo;

 Return @total_carga;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_puntaje_edad]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_puntaje_edad] (@total_puntaje_edad int) Returns int
AS
BEGIN

select @total_puntaje_edad=puntaje
from Tramo_Edad
where @total_puntaje_edad between minimo and maximo;

 Return @total_puntaje_edad;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_puntaje_estado_civil]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_puntaje_estado_civil] (@id_estado_civil int) Returns int
AS
BEGIN

select @id_estado_civil=puntaje
from Estado_Civil
where id_estado_civil = @id_estado_civil;

 Return @id_estado_civil;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_puntaje_monto_ahorro]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_puntaje_monto_ahorro] (@id_puntaje_monto_ahorro int) Returns int
AS
BEGIN

select @id_puntaje_monto_ahorro=puntaje
from Tramo_Ahorro
where @id_puntaje_monto_ahorro between minimo and maximo;
;

 Return @id_puntaje_monto_ahorro;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_puntaje_pueblo_originario]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_puntaje_pueblo_originario] (@id_puntaje_prueblo_originario int) Returns int
AS
BEGIN

select @id_puntaje_prueblo_originario=puntaje
from Pueblo_Originario
where id_pueblo_originario = @id_puntaje_prueblo_originario;

 Return @id_puntaje_prueblo_originario;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_puntaje_tipo_titulo]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_puntaje_tipo_titulo] (@id_puntaje_tipo_titulo int) Returns int
AS
BEGIN

select @id_puntaje_tipo_titulo=puntaje
from tipo_titulo
where id_tipo_titulo = @id_puntaje_tipo_titulo;

 Return @id_puntaje_tipo_titulo;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[fc_tipo_titulo]    Script Date: 23-07-2019 12:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fc_tipo_titulo] (@rut int) Returns int
AS
BEGIN

select @rut = t.id_tipo_titulo
from postulante as p join Titulo as t
on p.id_titulo = t.id_titulo
where p.rut_postulante = @rut ;


 Return @rut;
END;

GO
/****** Object:  Table [dbo].[Banco]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banco](
	[id_banco] [int] NOT NULL,
	[nombre_banco] [varchar](50) NULL,
 CONSTRAINT [PK_Banco] PRIMARY KEY CLUSTERED 
(
	[id_banco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carga]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carga](
	[rut_carga_familiar] [int] NOT NULL,
	[nombre_carga] [varchar](50) NULL,
	[apellido_paterno] [varchar](50) NULL,
	[apellido_materno] [varchar](50) NULL,
	[fecha_nacimiento] [date] NULL,
	[updated_at] [varchar](50) NULL,
	[created_at] [varchar](50) NULL,
 CONSTRAINT [PK_Carga_Familiar] PRIMARY KEY CLUSTERED 
(
	[rut_carga_familiar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Certificado_Permanencia]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Certificado_Permanencia](
	[id_certificado] [int] IDENTITY(1,1) NOT NULL,
	[Detalle] [varchar](50) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_Certificado_Permanencia] PRIMARY KEY CLUSTERED 
(
	[id_certificado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comuna]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comuna](
	[id_comuna] [int] NOT NULL,
	[nombre_comuna] [varchar](50) NULL,
	[id_region] [int] NOT NULL,
 CONSTRAINT [PK_Comuna] PRIMARY KEY CLUSTERED 
(
	[id_comuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Consultor]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Consultor](
	[rut_consultor] [int] NOT NULL,
	[nombre] [varchar](250) NULL,
	[apellido] [varchar](250) NULL,
	[email] [varchar](250) NULL,
	[telefono] [int] NULL,
 CONSTRAINT [PK_Consultor] PRIMARY KEY CLUSTERED 
(
	[rut_consultor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Conyuge]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Conyuge](
	[rut_conyuge] [int] NOT NULL,
	[nombre_conyuge] [varchar](50) NULL,
	[apellido_paterno] [varchar](50) NULL,
	[apellido_materno] [varchar](50) NULL,
	[fecha_nacimiento] [date] NULL,
	[id_nacionalidad] [int] NULL,
 CONSTRAINT [PK_Conyuge] PRIMARY KEY CLUSTERED 
(
	[rut_conyuge] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cuenta](
	[id_cuenta] [int] NOT NULL,
	[id_tipo_cuenta] [int] NOT NULL,
	[id_banco] [int] NOT NULL,
	[cantidad] [int] NULL,
	[updated_at] [varchar](50) NULL,
	[created_at] [varchar](50) NULL,
 CONSTRAINT [PK_Cuenta Ahorro] PRIMARY KEY CLUSTERED 
(
	[id_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Deposito]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deposito](
	[id_deposito] [int] NOT NULL,
	[monto] [int] NULL,
 CONSTRAINT [PK_deposito] PRIMARY KEY CLUSTERED 
(
	[id_deposito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Deposito_Cuenta]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deposito_Cuenta](
	[id_deposito_cuenta] [int] NOT NULL,
	[id_cuenta] [int] NULL,
	[id_deposito] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_Deposito_Cuenta] PRIMARY KEY CLUSTERED 
(
	[id_deposito_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Domicilio](
	[id_domicilio] [int] IDENTITY(6,1) NOT NULL,
	[calle] [varchar](50) NULL,
	[numero] [varchar](50) NULL,
	[block] [varchar](50) NULL,
	[departamento] [varchar](50) NULL,
	[manzana] [varchar](50) NULL,
	[sitio] [varchar](50) NULL,
	[id_comuna] [int] NULL,
	[fecha] [date] NULL,
	[estado] [int] NULL,
	[poblacion_villa] [varchar](250) NULL,
	[referencias] [varchar](250) NULL,
	[updated_at] [varchar](50) NULL,
	[created_at] [varchar](50) NULL,
 CONSTRAINT [PK_Domicilio] PRIMARY KEY CLUSTERED 
(
	[id_domicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[error]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[error](
	[id_error] [int] NOT NULL,
	[detalle_error] [varchar](250) NOT NULL,
 CONSTRAINT [PK_error] PRIMARY KEY CLUSTERED 
(
	[id_error] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado_Civil]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado_Civil](
	[id_estado_civil] [int] NOT NULL,
	[nombre_estado_civil] [varchar](50) NULL,
	[puntaje] [int] NULL,
 CONSTRAINT [PK_Estado Civil] PRIMARY KEY CLUSTERED 
(
	[id_estado_civil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Formulario_A]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Formulario_A](
	[id_formularioA] [int] NOT NULL,
	[fecha_recepcion] [date] NULL,
	[nombre_receptor] [varchar](250) NULL,
	[rut_postulante] [int] NULL,
	[id_vivienda] [int] NULL,
 CONSTRAINT [PK_Formulario_A] PRIMARY KEY CLUSTERED 
(
	[id_formularioA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Informe_Tecnico]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Informe_Tecnico](
	[id_folio_informe] [int] NOT NULL,
	[fecha_solicitud] [date] NULL,
	[fecha_inspeccion] [date] NULL,
	[id_formularioA] [int] NULL,
	[id_vivienda] [int] NULL,
	[rut_consultor] [int] NULL,
 CONSTRAINT [PK_Informe_Tecnico] PRIMARY KEY CLUSTERED 
(
	[id_folio_informe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nacionalidad]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nacionalidad](
	[id_nacionalidad] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Nacionalidad] PRIMARY KEY CLUSTERED 
(
	[id_nacionalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Postulante]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Postulante](
	[rut_postulante] [int] NOT NULL,
	[primer_nombre] [varchar](50) NULL,
	[segundo_nombre] [varchar](50) NULL,
	[apellido_paterno] [varchar](50) NULL,
	[apellido_materno] [varchar](50) NULL,
	[telefono_trabajo] [int] NULL,
	[telefono_domicilio] [int] NULL,
	[telefono_movil] [int] NULL,
	[codigo_postal] [int] NULL,
	[email] [varchar](50) NULL,
	[fecha_nacimiento] [date] NULL,
	[edad] [int] NULL,
	[id_nacionalidad] [int] NOT NULL,
	[id_estado_civil] [int] NOT NULL,
	[id_cuenta] [int] NOT NULL,
	[id_domicilio] [int] NOT NULL,
	[sueldo_liquido] [int] NULL,
	[id_pueblo_originario] [int] NULL,
	[id_titulo] [int] NULL,
	[id_certificado] [int] NULL,
	[updated_at] [varchar](50) NULL,
	[created_at] [varchar](50) NULL,
 CONSTRAINT [PK_Postulante_1] PRIMARY KEY CLUSTERED 
(
	[rut_postulante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Postulante_Carga]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Postulante_Carga](
	[rut_postulante] [int] NULL,
	[rut_carga_familiar] [int] NULL,
	[estado] [int] NULL,
	[id_relacion] [int] NULL,
	[updated_at] [varchar](50) NULL,
	[created_at] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Postulante_Conyuge]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postulante_Conyuge](
	[rut_postulante] [int] NULL,
	[rut_conyuge] [int] NULL,
	[fecha] [date] NULL,
	[estado] [int] NULL,
	[id_postulante_conyugue] [int] NOT NULL,
 CONSTRAINT [PK_Postulante_Conyuge] PRIMARY KEY CLUSTERED 
(
	[id_postulante_conyugue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proceso]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proceso](
	[id_proceso] [int] IDENTITY(1,1) NOT NULL,
	[ano] [varchar](250) NULL,
	[rut_postulante] [int] NULL,
	[edad] [int] NULL,
	[puntaje_edad] [int] NULL,
	[cantidad_cargas] [int] NULL,
	[puntaje_carga] [int] NULL,
	[estado_civil] [varchar](50) NULL,
	[puntaje_estado_civil] [int] NULL,
	[pueblo_indigena] [varchar](50) NULL,
	[puntaje_pueblo_indigena] [int] NULL,
	[monto_ahorro] [int] NULL,
	[puntaje_monto_ahorro] [int] NULL,
	[puntaje_titulo] [int] NULL,
	[total_puntaje] [int] NULL,
 CONSTRAINT [PK_Proceso] PRIMARY KEY CLUSTERED 
(
	[id_proceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Propietario](
	[rut_propietario] [int] NOT NULL,
	[nombres_propietario] [varchar](50) NULL,
	[apellido_paterno] [varchar](50) NULL,
	[apellido_materno] [varchar](50) NULL,
	[telefono] [int] NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_Propietario] PRIMARY KEY CLUSTERED 
(
	[rut_propietario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pueblo_Originario]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pueblo_Originario](
	[id_pueblo_originario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](250) NULL,
	[estado] [int] NULL,
	[puntaje] [int] NULL,
 CONSTRAINT [PK_Pueblo_Originario] PRIMARY KEY CLUSTERED 
(
	[id_pueblo_originario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Region]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Region](
	[id_region] [int] NOT NULL,
	[nombre_region] [varchar](50) NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id_region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[relacion_carga]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[relacion_carga](
	[id_relacion] [int] NOT NULL,
	[detalle] [varchar](250) NULL,
 CONSTRAINT [PK_relacion_carga] PRIMARY KEY CLUSTERED 
(
	[id_relacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_Cuenta]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_Cuenta](
	[id_tipo_cuenta] [int] NOT NULL,
	[tipo_cuenta] [varchar](50) NULL,
 CONSTRAINT [PK_Tipo_Cuenta] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_titulo]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_titulo](
	[id_tipo_titulo] [int] NOT NULL,
	[titulo] [varchar](250) NULL,
	[puntaje] [int] NULL,
 CONSTRAINT [PK_tipo_titulo] PRIMARY KEY CLUSTERED 
(
	[id_tipo_titulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_vivienda]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_vivienda](
	[id_tipo_vivienda] [int] NOT NULL,
	[nombre_tipo_vivienda] [varchar](50) NULL,
 CONSTRAINT [PK_Tipo_vivienda] PRIMARY KEY CLUSTERED 
(
	[id_tipo_vivienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Titulo]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Titulo](
	[id_titulo] [int] NOT NULL,
	[nombre_titulo] [varchar](50) NULL,
	[estado] [int] NULL,
	[id_tipo_titulo] [int] NULL,
 CONSTRAINT [PK_Titulo] PRIMARY KEY CLUSTERED 
(
	[id_titulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tramo_Ahorro]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tramo_Ahorro](
	[id_monto_ahorro] [int] NOT NULL,
	[minimo] [int] NULL,
	[maximo] [int] NULL,
	[puntaje] [int] NULL,
 CONSTRAINT [PK_Tramo_Ahorro] PRIMARY KEY CLUSTERED 
(
	[id_monto_ahorro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tramo_Carga_Familiar]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tramo_Carga_Familiar](
	[id_tramo_carga_familiar] [int] NOT NULL,
	[minimo] [int] NULL,
	[maximo] [int] NULL,
	[puntaje] [int] NULL,
 CONSTRAINT [PK_Tramo_Carga_Familiar] PRIMARY KEY CLUSTERED 
(
	[id_tramo_carga_familiar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tramo_Edad]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tramo_Edad](
	[id_tramo_edad] [int] NOT NULL,
	[minimo] [int] NULL,
	[maximo] [int] NULL,
	[puntaje] [int] NOT NULL,
 CONSTRAINT [PK_Tramo_Edad_1] PRIMARY KEY CLUSTERED 
(
	[id_tramo_edad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tramo_vivienda]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tramo_vivienda](
	[id_tramo] [int] NOT NULL,
	[Detalle_UF] [int] NULL,
 CONSTRAINT [PK_Tramo] PRIMARY KEY CLUSTERED 
(
	[id_tramo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UF]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UF](
	[id_uf] [int] NOT NULL,
	[valor_uf] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_UF] PRIMARY KEY CLUSTERED 
(
	[id_uf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vivienda]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vivienda](
	[id_vivienda] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[precioUF] [int] NULL,
	[id_tipo_vivienda] [int] NOT NULL,
	[id_tramo] [int] NOT NULL,
	[rut_propietario] [int] NOT NULL,
	[id_domicilio] [int] NULL,
 CONSTRAINT [PK_Vivienda] PRIMARY KEY CLUSTERED 
(
	[id_vivienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Comuna]  WITH CHECK ADD  CONSTRAINT [FK_ID_REGION] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([id_region])
GO
ALTER TABLE [dbo].[Comuna] CHECK CONSTRAINT [FK_ID_REGION]
GO
ALTER TABLE [dbo].[Conyuge]  WITH CHECK ADD  CONSTRAINT [FK_Conyuge_Nacionalidad] FOREIGN KEY([id_nacionalidad])
REFERENCES [dbo].[Nacionalidad] ([id_nacionalidad])
GO
ALTER TABLE [dbo].[Conyuge] CHECK CONSTRAINT [FK_Conyuge_Nacionalidad]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_BANCO] FOREIGN KEY([id_banco])
REFERENCES [dbo].[Banco] ([id_banco])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_BANCO]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_TIPO_CUENTA] FOREIGN KEY([id_tipo_cuenta])
REFERENCES [dbo].[Tipo_Cuenta] ([id_tipo_cuenta])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_TIPO_CUENTA]
GO
ALTER TABLE [dbo].[Deposito_Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Deposito_Cuenta_Cuenta] FOREIGN KEY([id_cuenta])
REFERENCES [dbo].[Cuenta] ([id_cuenta])
GO
ALTER TABLE [dbo].[Deposito_Cuenta] CHECK CONSTRAINT [FK_Deposito_Cuenta_Cuenta]
GO
ALTER TABLE [dbo].[Deposito_Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Deposito_Cuenta_deposito] FOREIGN KEY([id_deposito])
REFERENCES [dbo].[Deposito] ([id_deposito])
GO
ALTER TABLE [dbo].[Deposito_Cuenta] CHECK CONSTRAINT [FK_Deposito_Cuenta_deposito]
GO
ALTER TABLE [dbo].[Domicilio]  WITH CHECK ADD  CONSTRAINT [FK_ID_COMUNA] FOREIGN KEY([id_comuna])
REFERENCES [dbo].[Comuna] ([id_comuna])
GO
ALTER TABLE [dbo].[Domicilio] CHECK CONSTRAINT [FK_ID_COMUNA]
GO
ALTER TABLE [dbo].[Formulario_A]  WITH CHECK ADD  CONSTRAINT [FK_Formulario_A_Postulante] FOREIGN KEY([rut_postulante])
REFERENCES [dbo].[Postulante] ([rut_postulante])
GO
ALTER TABLE [dbo].[Formulario_A] CHECK CONSTRAINT [FK_Formulario_A_Postulante]
GO
ALTER TABLE [dbo].[Formulario_A]  WITH CHECK ADD  CONSTRAINT [FK_Formulario_A_Vivienda] FOREIGN KEY([id_vivienda])
REFERENCES [dbo].[Vivienda] ([id_vivienda])
GO
ALTER TABLE [dbo].[Formulario_A] CHECK CONSTRAINT [FK_Formulario_A_Vivienda]
GO
ALTER TABLE [dbo].[Informe_Tecnico]  WITH CHECK ADD  CONSTRAINT [FK_Informe_Tecnico_Consultor] FOREIGN KEY([rut_consultor])
REFERENCES [dbo].[Consultor] ([rut_consultor])
GO
ALTER TABLE [dbo].[Informe_Tecnico] CHECK CONSTRAINT [FK_Informe_Tecnico_Consultor]
GO
ALTER TABLE [dbo].[Informe_Tecnico]  WITH CHECK ADD  CONSTRAINT [FK_Informe_Tecnico_Formulario_A] FOREIGN KEY([id_formularioA])
REFERENCES [dbo].[Formulario_A] ([id_formularioA])
GO
ALTER TABLE [dbo].[Informe_Tecnico] CHECK CONSTRAINT [FK_Informe_Tecnico_Formulario_A]
GO
ALTER TABLE [dbo].[Informe_Tecnico]  WITH CHECK ADD  CONSTRAINT [FK_Informe_Tecnico_Vivienda] FOREIGN KEY([id_vivienda])
REFERENCES [dbo].[Vivienda] ([id_vivienda])
GO
ALTER TABLE [dbo].[Informe_Tecnico] CHECK CONSTRAINT [FK_Informe_Tecnico_Vivienda]
GO
ALTER TABLE [dbo].[Postulante]  WITH CHECK ADD  CONSTRAINT [FK_ID_CUENTA] FOREIGN KEY([id_cuenta])
REFERENCES [dbo].[Cuenta] ([id_cuenta])
GO
ALTER TABLE [dbo].[Postulante] CHECK CONSTRAINT [FK_ID_CUENTA]
GO
ALTER TABLE [dbo].[Postulante]  WITH CHECK ADD  CONSTRAINT [FK_ID_DOMICILIO] FOREIGN KEY([id_domicilio])
REFERENCES [dbo].[Domicilio] ([id_domicilio])
GO
ALTER TABLE [dbo].[Postulante] CHECK CONSTRAINT [FK_ID_DOMICILIO]
GO
ALTER TABLE [dbo].[Postulante]  WITH CHECK ADD  CONSTRAINT [FK_ID_ESTADO_CIVIL] FOREIGN KEY([id_estado_civil])
REFERENCES [dbo].[Estado_Civil] ([id_estado_civil])
GO
ALTER TABLE [dbo].[Postulante] CHECK CONSTRAINT [FK_ID_ESTADO_CIVIL]
GO
ALTER TABLE [dbo].[Postulante]  WITH CHECK ADD  CONSTRAINT [FK_NACIONALIDAD] FOREIGN KEY([id_nacionalidad])
REFERENCES [dbo].[Nacionalidad] ([id_nacionalidad])
GO
ALTER TABLE [dbo].[Postulante] CHECK CONSTRAINT [FK_NACIONALIDAD]
GO
ALTER TABLE [dbo].[Postulante]  WITH CHECK ADD  CONSTRAINT [FK_Postulante_Certificado_Permanencia] FOREIGN KEY([id_certificado])
REFERENCES [dbo].[Certificado_Permanencia] ([id_certificado])
GO
ALTER TABLE [dbo].[Postulante] CHECK CONSTRAINT [FK_Postulante_Certificado_Permanencia]
GO
ALTER TABLE [dbo].[Postulante]  WITH CHECK ADD  CONSTRAINT [FK_Postulante_Pueblo_Originario] FOREIGN KEY([id_pueblo_originario])
REFERENCES [dbo].[Pueblo_Originario] ([id_pueblo_originario])
GO
ALTER TABLE [dbo].[Postulante] CHECK CONSTRAINT [FK_Postulante_Pueblo_Originario]
GO
ALTER TABLE [dbo].[Postulante]  WITH CHECK ADD  CONSTRAINT [FK_Postulante_Titulo] FOREIGN KEY([id_titulo])
REFERENCES [dbo].[Titulo] ([id_titulo])
GO
ALTER TABLE [dbo].[Postulante] CHECK CONSTRAINT [FK_Postulante_Titulo]
GO
ALTER TABLE [dbo].[Postulante_Carga]  WITH CHECK ADD  CONSTRAINT [FK_Postulante_Carga_relacion_carga] FOREIGN KEY([id_relacion])
REFERENCES [dbo].[relacion_carga] ([id_relacion])
GO
ALTER TABLE [dbo].[Postulante_Carga] CHECK CONSTRAINT [FK_Postulante_Carga_relacion_carga]
GO
ALTER TABLE [dbo].[Postulante_Carga]  WITH CHECK ADD  CONSTRAINT [FK_RUT_CARGA_FAMILIAR] FOREIGN KEY([rut_carga_familiar])
REFERENCES [dbo].[Carga] ([rut_carga_familiar])
GO
ALTER TABLE [dbo].[Postulante_Carga] CHECK CONSTRAINT [FK_RUT_CARGA_FAMILIAR]
GO
ALTER TABLE [dbo].[Postulante_Carga]  WITH CHECK ADD  CONSTRAINT [FK_RUT_POSTULANTE] FOREIGN KEY([rut_postulante])
REFERENCES [dbo].[Postulante] ([rut_postulante])
GO
ALTER TABLE [dbo].[Postulante_Carga] CHECK CONSTRAINT [FK_RUT_POSTULANTE]
GO
ALTER TABLE [dbo].[Postulante_Conyuge]  WITH CHECK ADD  CONSTRAINT [FK_RUT_CONYUGE] FOREIGN KEY([rut_conyuge])
REFERENCES [dbo].[Conyuge] ([rut_conyuge])
GO
ALTER TABLE [dbo].[Postulante_Conyuge] CHECK CONSTRAINT [FK_RUT_CONYUGE]
GO
ALTER TABLE [dbo].[Postulante_Conyuge]  WITH CHECK ADD  CONSTRAINT [FK_RUT_POSTULANT] FOREIGN KEY([rut_postulante])
REFERENCES [dbo].[Postulante] ([rut_postulante])
GO
ALTER TABLE [dbo].[Postulante_Conyuge] CHECK CONSTRAINT [FK_RUT_POSTULANT]
GO
ALTER TABLE [dbo].[Titulo]  WITH CHECK ADD  CONSTRAINT [FK_Titulo_tipo_titulo] FOREIGN KEY([id_tipo_titulo])
REFERENCES [dbo].[tipo_titulo] ([id_tipo_titulo])
GO
ALTER TABLE [dbo].[Titulo] CHECK CONSTRAINT [FK_Titulo_tipo_titulo]
GO
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD  CONSTRAINT [FK_RUT_PROPIETARIO] FOREIGN KEY([rut_propietario])
REFERENCES [dbo].[Propietario] ([rut_propietario])
GO
ALTER TABLE [dbo].[Vivienda] CHECK CONSTRAINT [FK_RUT_PROPIETARIO]
GO
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD  CONSTRAINT [FK_TIPO_VIVIENDA] FOREIGN KEY([id_tipo_vivienda])
REFERENCES [dbo].[Tipo_vivienda] ([id_tipo_vivienda])
GO
ALTER TABLE [dbo].[Vivienda] CHECK CONSTRAINT [FK_TIPO_VIVIENDA]
GO
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD  CONSTRAINT [FK_TRAMO] FOREIGN KEY([id_tramo])
REFERENCES [dbo].[Tramo_vivienda] ([id_tramo])
GO
ALTER TABLE [dbo].[Vivienda] CHECK CONSTRAINT [FK_TRAMO]
GO
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD  CONSTRAINT [FK_Vivienda_Domicilio] FOREIGN KEY([id_domicilio])
REFERENCES [dbo].[Domicilio] ([id_domicilio])
GO
ALTER TABLE [dbo].[Vivienda] CHECK CONSTRAINT [FK_Vivienda_Domicilio]
GO
/****** Object:  StoredProcedure [dbo].[sp_serviu]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_serviu] @año int , @rutIngresado int AS
BEGIN
 Declare @total_carga int , @total_puntaje int;

set @total_carga = dbo.fc_count_carga(@rutIngresado);
set @total_puntaje = dbo.fc_puntaje_carga2(@total_carga);

insert into proceso (ano,rut_postulante,puntaje_carga,cantidad_cargas)values (@año,@rutIngresado,@total_puntaje,@total_carga);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_serviu2]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_serviu2] @año int, @rutIngresado int
AS
BEGIN

Declare 
@edad int , @puntajeEdad int , 
@cantidad_cargas int , @puntajeCargas int , 
@estado_civilVarchar varchar(50), @estado_civilInt int ,@puntaje_estado_civil int ,
@pueblo_indigena varchar(50), @pueblo_indigenaInt int , @puntaje_pueblo_indigena int,
@monto int, @puntaje_monto_ahorro int,
@tipo_titulo int , @puntaje_titulo int,
@total_puntaje int
 
set @Edad   = dbo.fc_edad(@rutIngresado);
set @puntajeEdad   = dbo.fc_puntaje_edad(@Edad);

set @cantidad_cargas = dbo.fc_cantidad_carga(@rutIngresado);
set @puntajeCargas = dbo.fc_puntaje_carga2(@cantidad_cargas);

set @estado_civilVarchar = dbo.fc_estado_civil(@rutIngresado);
set @estado_civilInt = dbo.fc_estado_civilInt(@rutIngresado);
set @puntaje_estado_civil = dbo.fc_puntaje_estado_civil(@estado_civilInt);

set @pueblo_indigena = dbo.fc_pueblo_originario(@rutIngresado);
set @pueblo_indigenaInt = dbo.fc_pueblo_originarioInt(@rutIngresado);
set @puntaje_pueblo_indigena = dbo.fc_puntaje_pueblo_originario(@pueblo_indigenaInt);

set @monto = dbo.fc_monto_ahorro(@rutIngresado);
set @puntaje_monto_ahorro = dbo.fc_puntaje_monto_ahorro(@monto);

set @tipo_titulo = dbo.fc_tipo_titulo(@rutIngresado);
set @puntaje_titulo = dbo.fc_puntaje_tipo_titulo(@tipo_titulo);

set @total_puntaje = SUM(@puntajeEdad + @puntajeCargas + @puntaje_estado_civil + @puntaje_pueblo_indigena + @puntaje_monto_ahorro + @puntaje_titulo );

insert into proceso (ano,rut_postulante,edad,puntaje_edad,cantidad_cargas,puntaje_carga,estado_civil,puntaje_estado_civil,pueblo_indigena,puntaje_pueblo_indigena,monto_ahorro,puntaje_monto_ahorro,puntaje_titulo,total_puntaje)
values(@año,@rutIngresado,@Edad,@puntajeEdad,@cantidad_cargas,@puntajeCargas,@estado_civilVarchar,@puntaje_estado_civil,@pueblo_indigena,@puntaje_pueblo_indigena,@monto,@puntaje_monto_ahorro,@puntaje_titulo,@total_puntaje);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_serviu3]    Script Date: 23-07-2019 12:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_serviu3]
as

declare @rutCursor int, @año int,
@edad int , @puntajeEdad int, 
@cantidad_cargas int , @puntajeCargas int , 
@estado_civilVarchar varchar(50), @estado_civilInt int ,@puntaje_estado_civil int ,
@pueblo_indigena varchar(50), @pueblo_indigenaInt int , @puntaje_pueblo_indigena int,
@monto int, @puntaje_monto_ahorro int,
@tipo_titulo int , @puntaje_titulo int,
@total_puntaje int

declare MICURSOR cursor

	for select rut_postulante from postulante

open MICURSOR

	fetch next from MICURSOR into @rutCursor

while @@FETCH_STATUS=0
begin

	set @año = '2019';

	set @Edad   = dbo.fc_edad(@rutCursor);
	set @puntajeEdad   = dbo.fc_puntaje_edad(@Edad);

	set @cantidad_cargas = dbo.fc_cantidad_carga(@rutCursor);
	set @puntajeCargas = dbo.fc_puntaje_carga2(@cantidad_cargas);

	set @estado_civilVarchar = dbo.fc_estado_civil(@rutCursor);
	set @estado_civilInt = dbo.fc_estado_civilInt(@rutCursor);
	set @puntaje_estado_civil = dbo.fc_puntaje_estado_civil(@estado_civilInt);

	set @pueblo_indigena = dbo.fc_pueblo_originario(@rutCursor);
	set @pueblo_indigenaInt = dbo.fc_pueblo_originarioInt(@rutCursor);
	set @puntaje_pueblo_indigena = dbo.fc_puntaje_pueblo_originario(@pueblo_indigenaInt);

	set @monto = dbo.fc_monto_ahorro(@rutCursor);
	set @puntaje_monto_ahorro = dbo.fc_puntaje_monto_ahorro(@monto);

	set @tipo_titulo = dbo.fc_tipo_titulo(@rutCursor);
	set @puntaje_titulo = dbo.fc_puntaje_tipo_titulo(@tipo_titulo);

	set @total_puntaje = SUM(@puntajeEdad + @puntajeCargas + @puntaje_estado_civil + @puntaje_pueblo_indigena + @puntaje_monto_ahorro + @puntaje_titulo );
		insert into proceso (ano,rut_postulante,edad,puntaje_edad,cantidad_cargas,puntaje_carga,estado_civil,puntaje_estado_civil,pueblo_indigena,puntaje_pueblo_indigena,monto_ahorro,puntaje_monto_ahorro,puntaje_titulo,total_puntaje)
		values(@año,@rutCursor,@Edad,@puntajeEdad,@cantidad_cargas,@puntajeCargas,@estado_civilVarchar,@puntaje_estado_civil,@pueblo_indigena,@puntaje_pueblo_indigena,@monto,@puntaje_monto_ahorro,@puntaje_titulo,@total_puntaje);

	fetch next from MICURSOR into @rutCursor

end

GO
