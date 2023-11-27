$(document).ready(function () {

    const MODELO_BASE = {
        ClienteId: 0,
        Nombre: "",
        Domicilio: "",
        RFC: "",
        FechaExpedicion: ""
    };

    function mostrarModal(modelo = MODELO_BASE) {
        $("#txtIdN").val(modelo.ClienteId)
        $("#txtNombreN").val(modelo.Nombre)
        $("#txtDireccionN").val(modelo.Domicilio)
        $("#txtRFCN").val(modelo.RFC)
        $("#txtFechaN").val(modelo.FechaExpedicion)
        $("#ClienteNuevo").modal("show");
    }

    $("#btnNuevo").click(function () {
        mostrarModal();
    })

    $('#txtFechaN').datepicker({
        format: 'yyyy-mm-dd',
        language: 'es',
        autoclose: true
    });

    $("#btnGuardar").click(function () {
        if ($("#txtNombreN").val().trim() == "") {
            toastr.warning("", "Debe completar el campo: Nombre")
            $("#txtNombreN").focus()
            console.dir($("#txtId"))
            return;
        }

        const modelo = {
            ClienteId: parseInt($("#txtIdN").val()),
            Nombre: $("#txtNombreN").val(),
            Domicilio: $("#txtDireccionN").val(),
            RFC: $("#txtRFCN").val(),
            FechaExpedicion: $("#txtFechaN").val()
        };

        $.ajax({
            url: "/Cliente/AgregarFactura", 
            type: "POST",
            data: modelo,
            success: function (result) {
                toastr.success("La factura se ha agregado correctamente");
                $("#mensaje").text("La factura se ha agregado correctamente");
                $('#ClienteNuevo').modal('hide');
                window.location.href = "/Cliente/Index";
            },
            error: function (error) {
                // Manejar errores en la solicitud AJAX
                console.error(error);
            }
        });

    });

    // Evento clic en el botón de editar
    $("#tbdata").on("click", ".btn-editar", function () {
        // Obtener el ClienteId de la fila clicada
        var clienteId = $(this).data("id");

        // Llenar el modal con los datos correspondientes al ClienteId
        $.ajax({
            url: "/Cliente/ObtenerClientePorId", // Reemplaza con la ruta correcta en tu controlador
            type: "GET",
            data: { clienteId },
            success: function (cliente) {
                if (cliente) {
                    console.dir(cliente);
                    console.dir(cliente[0].clienteId);
                    // Llenar los campos del modal con los datos obtenidos
                    $("#txtId").val(cliente[0].clienteId);
                    $("#txtNombre").val(cliente[0].nombre);
                    $("#txtdireccion").val(cliente[0].domicilio);
                    $("#txtRFC").val(cliente[0].rfc);
                    $("#txtFecha").val(cliente[0].fechaExpedicion);

                    // Mostrar el modal
                    $("#ClienteEdit").modal("show");
                } else {
                    // Manejar el caso en que el cliente no fue encontrado
                    console.log("Cliente no encontrado");
                }
            }
        });
    });

    $('#txtFecha').datepicker({
        format: 'yyyy-mm-dd',
        language: 'es',
        autoclose: true
    });

    $("#btnGuardarEd").click(function () {
        // Obtener los valores de los campos del formulario de edición
        var clienteId = $("#txtId").val();
        var nombre = $("#txtNombre").val();
        var domicilio = $("#txtdireccion").val();
        var rfc = $("#txtRFC").val();
        var fechaExpedicion = $("#txtFecha").val();

        // Crear el modelo con los valores
        var modelo = {
            ClienteId: clienteId,
            Nombre: nombre,
            Domicilio: domicilio,
            RFC: rfc,
            FechaExpedicion: fechaExpedicion
        };
        console.dir(modelo);
        // Realizar la llamada AJAX para guardar los cambios
        $.ajax({
            url: "/Cliente/GuardarCambiosCliente", // Ajusta la ruta según tu controlador
            type: "POST",
            data: modelo,
            success: function (result) {
                toastr.success("Cambios guardados correctamente");
                $("#ClienteEdit").modal("hide");
                window.location.href = "/Cliente/Index";
            },
            error: function (error) {
                // Manejar errores en la solicitud AJAX
                console.error(error);
            }
        });
    });

    // Agregar un nuevo evento clic para el botón de eliminar en la tabla
    $("#tbdata").on("click", ".btn-eliminar", function () {
        // Obtener el ClienteId de la fila clicada
        var clienteId = $(this).data("id");

        // Mostrar el modal de confirmación
        $("#confirmarEliminarModal").modal("show");

        // Configurar el evento clic para el botón de confirmar eliminar en el modal
        $("#btnConfirmarEliminar").off().on("click", function () {
            // Realizar la llamada AJAX para eliminar el registro
            $.ajax({
                url: "/Cliente/EliminarClientePorId", // Ajusta la ruta según tu controlador
                type: "POST",
                data: { clienteId: clienteId },
                success: function (result) {
                    toastr.success("Registro eliminado correctamente");
                    $("#confirmarEliminarModal").modal("hide");
                    window.location.href = "/Cliente/Index";
                },
                error: function (error) {
                    // Manejar errores en la solicitud AJAX
                    console.error(error);
                }
            });            
        });
    });

});