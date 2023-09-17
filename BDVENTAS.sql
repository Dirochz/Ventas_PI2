CREATE database DBVENTA 
GO

use DBVENTA
GO

CREATE TABLE Menu(
	idMenu int primary Key identity(1,1),
	descripcion varchar(30),
	idMenuPadre int references Menu(idMenu),
	icono varchar(30),
	controlador varchar(30),
	paginaAccion varchar(30),
	esActivo bit,
	fechaRegistro datetime default getdate())
GO

CREATE TABLE Rol(
	idRol int primary key identity(1,1),
	descripcion varchar(30),
	esActivo bit,
	fechaRegistro datetime default getdate())
GO

CREATE TABLE RolMenu(
	idRolMenu int primary key identity(1,1),
	idRol int references Rol(idRol),
	idMenu int references Menu(idMenu),
	esActivo bit,
	fechaRegistro datetime default getdate())
GO

CREATE TABLE Usuario(
	idUsuario int primary key identity(1,1),
	nombre varchar(50),
	correo varchar(50),
	telefono varchar(50),
	idRol int references Rol(idRol),
	urlFoto varchar(500),
	nommbreFoto varchar(100),
	clave varchar(100),
	esActivo bit,
	fechaRegistro datetime default getdate())
GO

CREATE TABLE Categoria(
	idCategoria int primary key identity(1,1),
	descripcion varchar(50),
	esActivo bit,
	fechaRegistro datetime default getdate())
GO

CREATE TABLE Producto(
	idProducto int primary key identity(1,1),
	codigoBarra varchar(50),
	marca varchar(50),
	descripcion varchar(100),
	idCategoria int references Categoria(idCategoria),
	stock int,
	urlImage varchar(500),
	nombreImagen varchar(100),
	precio decimal(10,2),
	esActivo bit,
	fechaRegistro datetime default getdate())
GO

CREATE TABLE NumeroCorrelativo(
	idNumeroCorrelativo int primary key identity(1,1),
	ultimoNumero int,
	cantidadDigitos int,
	gestion varchar(100),
	fechaActualizacion datetime)
GO

CREATE TABLE TipoDocumentoVenta(
	idTipoDocumentoVenta int primary key identity(1,1),
	descripcion varchar(50),
	esActivo bit,
	fechaRegistro datetime default getdate())
GO

CREATE TABLE Venta(
	idVenta int primary key identity(1,1),
	numeroVenta varchar(6),
	idTipoDocumentoVenta int references TipoDocumentoVenta(idTipoDocumentoVenta),
	idUsuario int references Usuario(idUsuario),
	documentoCliente varchar(10),
	nombreCleinte varchar(20),
	subTotal decimal (10,2),
	impuestoTotal decimal(10,2),
	Total decimal (10, 2),
	fechaRegisto datetime default getdate())
GO

CREATE TABLE DetalleVenta(
	idDetalleVenta int primary key identity(1,1),
	idVenta int references Venta(idVenta),
	idProducto int,
	marcaProducto varchar(100),
	descripcionProducto varchar(100),
	categoriaProducto varchar(100),
	cantidad int,
	precio decimal(10,2),
	total decimal(10,2))
GO

CREATE TABLE Negocio(
	idNegocio int primary key,
	urlLogo varchar(500),
	nombreLogo varchar(100),
	numeroDocumento varchar(50),
	nombre varchar(50),
	correo varchar(50),
	direccion varchar(50),
	telefono varchar(50),
	procentajeImpuesto decimal(10,2),
	simboloMoneda varchar(5))
GO

CREATE TABLE Configuracion(
	recurso varchar(50),
	propiedad varchar(50),
	valor varchar(60))
GO