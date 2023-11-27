Create DataBase DBVENTA 
Go

Use DBVENTA
Go

Create Table Menu(
	idMenu int primary key identity(1,1),
	descripcion varchar(30),
	idMenuPadre int references Menu(idMenu),
	icono varchar(30),
	controlador varchar(30),
	paginaAccion varchar(30),
	esActivo bit,
	fechaRegistro datetime default getdate())
Go

Create Table Rol(
	idRol int primary key identity(1,1),
	descripcion varchar(30),
	esActivo bit,
	fechaRegistro datetime default getdate())
Go
 
Create Table RolMenu(
	idRolMenu int primary key identity(1,1),
	idRol int references Rol(idRol),
	idMenu int references Menu(idMenu),
	esActivo bit,
	fechaRegistro datetime default getdate())
Go

Create Table Usuario(
	idUsuario int primary key identity(1,1),
	nombre varchar(50),
	correo varchar(50),
	telefono varchar(50),
	idRol int references Rol(idRol),
	urlFoto varchar(500),
	nombreFoto varchar(100),
	clave varchar(100),
	esActivo bit,
	fechaRegistro datetime default getdate())
Go

Create Table Categoria(
	idCategoria int primary key identity(1,1),
	descripcion varchar(50),
	esActivo bit,
	fechaRegistro datetime default getdate())
Go

Create Table Producto(
	idProducto int primary key identity(1,1),
	codigoBarra varchar(50),
	marca varchar(50),
	descripcion varchar(100),
	idCategoria int references Categoria(idCategoria),
	stock int,
	urlImagen varchar(500),
	nombreImagen varchar(100),
	precio decimal(10,2),
	esActivo bit,
	fechaRegistro datetime default getdate())
Go

Create Table NumeroCorrelativo(
	idNumeroCorrelativo int primary key identity(1,1),
	ultimoNumero int,
	cantidadDigitos int,
	gestion varchar(100),
	fechaActualizacion datetime)
Go

Create Table TipoDocumentoVenta(
	idTipoDocumentoVenta int primary key identity(1,1),
	descripcion varchar(50),
	esActivo bit,
	fechaRegistro datetime default getdate())
Go

Create Table Venta(
	idVenta int primary key identity(1,1),
	numeroVenta varchar(6),
	idTipoDocumentoVenta int references TipoDocumentoVenta(idTipoDocumentoVenta),
	idUsuario int references Usuario(idUsuario),
	documentoCliente varchar(10),
	nombreCliente varchar(20),
	subTotal decimal(10,2),
	impuestoTotal decimal(10,2),
	Total decimal(10,2),
	fechaRegistro datetime default getdate())
Go

Create Table DetalleVenta(
    idDetalleVenta int primary key identity(1,1),
    idVenta int references Venta(idVenta),
    idProducto int,
    marcaProducto varchar(100),
    descripcionProducto varchar(100),
    categoriaProducto varchar(100),
    cantidad int,
    precio decimal(10,2),
    total decimal(10,2),
    Traslados XML, -- Add XML column for Traslados
    moneda varchar(50), -- Add column for moneda
    tipoCambio decimal(10,2), -- Add column for tipoCambio
    tipoDeComprobante varchar(50), -- Add column for tipoDeComprobante
    exportacion XML, -- Add XML column for exportacion
    metodoPago varchar(50),
    lugarExpedicion varchar(100),
    confirmacion varchar(50)
);

Create Table Negocio(
	idNegocio int primary key,
	urlLogo varchar(500),
	nombreLogo varchar(100),
	numeroDocumento varchar(50),
	nombre varchar(50),
	correo varchar(50),
	direccion varchar(50),
	telefono varchar(50),
	porcentajeImpuesto decimal(10,2),
	simboloMoneda varchar(5))
Go

Create Table Configuracion(
	recurso varchar(50),
	propiedad varchar(50),
	valor varchar(60))
Go

Create Table Cliente(
    ClienteId int primary key identity(1,1),
    Nombre varchar(100),
    Domicilio varchar(100),
    RFC varchar(50),
    FechaExpedición datetime,
    fechaRegistro datetime default getdate())
Go