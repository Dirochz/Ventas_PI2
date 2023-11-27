Use DBVENTA
Go

--________________________________ INSERTAR ROLES ________________________________
--Evitar tocar porque si modifican estas opciones o las mueven tendran que modificar los ultimos 3 Inserts
Insert Into rol(descripcion,esActivo) Values
	('Administrador',1),
	('Empleado',1),
	('Supervisor',1)
Go

--________________________________ INSERTAR USUARIO ________________________________
--Evitar modificar la clave al menos que tengan la contraseña incriptada, no tocar urlfoto y nombreFoto
--Correo: equipopi2@gmail.com  clave : 123
Insert Into Usuario(nombre,correo,telefono,idRol,urlFoto,nombreFoto,clave,esActivo) Values
	('Dinamita Project','equipopi2@gmail.com','909090',1,'','','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1)
Go

--________________________________ RECURSOS DE FIREBASE_STORAGE Y CORREO ________________________________
-- Pasos para configurar tu correo
--		1. Abrir Gmail
--		2. Dar clic en "Administrar Cuenta de Google"
--		3. Dar clic en "Seguridad"
--		4. Activar "Verificacion en dos pasos"
--		5. Dar clic en "Contraseña de aplicaciones"
--		6. Seleccionar "aplicacion" - > "Otra"
--		7. Copiar Codigo para usarlo aqui junto al correo que hiciste todos estos pasos
--Solo modificar las '' que estan vacias
Insert Into Configuracion(recurso,propiedad,valor) Values
	('Servicio_Correo','correo',''),
	('Servicio_Correo','clave',''),
	('Servicio_Correo','alias','MiTienda.com'),
	('Servicio_Correo','host','smtp.gmail.com'),
	('Servicio_Correo','puerto','587')
Go

--Pasos para FIREBASE
--	1. Iniciar en el navegador con el correo que se uso para configurar el apartado de correo
--	2. Iniciar Firebase Console -> https://console.firebase.google.com/u/0/
--	3. Dar clic en "Crear un proyecto"
--	4. Ingresar un nombre
--	5. Deshabilitar la opcion de "Google Analytics" (solo si pregunta que si quieres que este Habilitado)
--	6. Dar clic en "Crear un Proyecto"
--	7. Dar clic en BarraLateral/Compilación/Storage
--	8. Dar clic en "Comenzar"
--	9. Que este en "Iniciar en modo de producción"
--	10. Dar clic en "Siguiente"
--	11. Usar cualquier servidor y dar clic en "Listo"
--	12. Dar clic en "Rule"
--	13.  El codigo que debe estar de la siguiente manera, se agrego esta linea -> request.auth != null;
--rules_version = '2';
--Varios Comentarios
--service firebase.storage{
--  match /b/{bucket}/o {
--    match /{allPaths=**} {
--	    allow read, write: if request.auth != null;
--    }
--   }
-- }
--	14. Dar clic en "Publicar"
--	15. Ir a Compilación/Authentication y dar clic en "Comenzar"
--	16. Seleccionar "Correo electrónico", dar clic en "Habilitar" y damos clic en "Guardar" 
--	17. Ir a la pestaña de "User" y Copiar el correo y contraseña que se vaya a utilizar, dar clic en "Agregar usuario"
--	18. En la barra lateral dar clic en "Storage", copiar url y eliminar solo la siguiente parte del codigo "gs://" y que termine en .com
--	19. Ir Ajustes damos clic en "Configuracion del proyecto"
--	20. Copiar el contenido de "Clave de API WEB"
--	21. Agregar todo lo copiado en el siguiente Insert
-- Solo modificar las '' que estan vacias
Insert Into Configuracion(recurso,propiedad,valor) Values
	('FireBase_Storage','email',''),
	('FireBase_Storage','clave',''),
	('FireBase_Storage','ruta',''),
	('FireBase_Storage','api_key',''),
	('FireBase_Storage','carpeta_usuario','IMAGENES_USUARIO'),
	('FireBase_Storage','carpeta_producto','IMAGENES_PRODUCTO'),
	('FireBase_Storage','carpeta_logo','IMAGENES_LOGO')
Go

--________________________________ INSERTAR NEGOCIO ________________________________
-- Es estructura para el negocio, se modifica en la pestaña de negocio
-- NO TOCAR SE CONFIGURA EN LA PAGINA
Insert Into Negocio(idNegocio,urlLogo,nombreLogo,numeroDocumento,nombre,correo,direccion,telefono, porcentajeImpuesto,simboloMoneda)
	Values (1,'','','','','','','',0,'')
Go


--________________________________ INSERTAR CATEGORIAS ________________________________
Insert Into Categoria(descripcion,esActivo) Values
	('Computadoras',1),
	('Laptops',1),
	('Teclados',1),
	('Monitores',1),
	('Microfonos',1),
	('Ratones',1),
	('Audifonos', 1),
	('Cables', 1)
Go

--________________________________ INSERTAR TIPO DOCUMENTO VENTA ________________________________
Insert Into TipoDocumentoVenta(descripcion,esActivo) Values
	('Boleta',1),
	('Factura',1)
Go

--________________________________ INSERTAR NUMERO CORRELATIVO ________________________________
--000001
-- NO TOCAR es el que pone los ceros en el numero de documentacion
Insert Into NumeroCorrelativo(ultimoNumero,cantidadDigitos,gestion,fechaActualizacion) Values
	(0,6,'venta',getdate())
Go

--________________________________ INSERTAR MENUS ________________________________
--*menu padre
-- NO TOCAR
Insert Into Menu(descripcion,icono,controlador,paginaAccion,esActivo) Values
	('DashBoard','fas fa-fw fa-tachometer-alt','DashBoard','Index',1)
Go

-- NO TOCAR: son las ventanas de las interfaz
Insert Into Menu(descripcion,icono,esActivo) Values
	('Administración','fas fa-fw fa-cog',1),
	('Inventario','fas fa-fw fa-clipboard-list',1),
	('Ventas','fas fa-fw fa-tags',1),
	('Reportes','fas fa-fw fa-chart-area',1)
Go

--*menu hijos Administracion
-- NO TOCAR: Son las opciones de Administracion
Insert Into Menu(descripcion,idMenuPadre, controlador,paginaAccion,esActivo) Values
	('Usuarios',2,'Usuario','Index',1),
	('Negocio',2,'Negocio','Index',1),
	('Cliente',2,'Cliente','Index',1)
Go

--*menu hijos - Inventario
-- NO TOCAR: Son las opciones de Inventario
Insert Into Menu(descripcion,idMenuPadre, controlador,paginaAccion,esActivo) Values
	('Categorias',3,'Categoria','Index',1),
	('Productos',3,'Producto','Index',1)
Go

--*menu hijos - Ventas
-- NO TOCAR: Son las Opciones de Ventas
Insert Into Menu(descripcion,idMenuPadre, controlador,paginaAccion,esActivo) Values
	('Nueva Venta',4,'Venta','NuevaVenta',1),
	('Historial Venta',4,'Venta','HistorialVenta',1)
Go

--*menu hijos - Reportes
--No Tocar: Son las opciones de Reportes
Insert Into Menu(descripcion,idMenuPadre, controlador,paginaAccion,esActivo) Values
	('Reporte de Ventas',5,'Reporte','Index',1)
Go

Update Menu Set idMenuPadre = idMenu Where idMenuPadre is null
Go

--________________________________ INSERTAR ROL MENU ________________________________
--*administrador
--NO TOCAR LOS SIGUIENTES 3 INSERTS
--Son los que reparten que menu tendran los 3 roles
Insert Into RolMenu(idRol,idMenu,esActivo) Values
	(1,1,1),
	(1,6,1),
	(1,7,1),
	(1,8,1),
	(1,9,1),
	(1,10,1),
	(1,11,1),
	(1,12,1),
	(1,13,1)
Go

--*Empleado
Insert Into RolMenu(idRol,idMenu,esActivo) Values
	(2,10,1),
	(2,11,1)
Go

--*Supervisor
Insert Into RolMenu(idRol,idMenu,esActivo) Values
	(3,8,1),
	(3,9,1),
	(3,10,1),
	(3,11,1)
Go