$(document).ready(function() {
  $('#tbdata').DataTable({
    responsive: true,
    dom:"Bfrtip",
    buttons:[
        {
            text: 'Exportar Excel',
            extend: 'excelHtml5',
            title: '',
            filename: 'Reporte Usuarios',
            exportOptions: {
                columns: [ 1,2 ]
            }
        },'pageLength'
    ],
    language:{
        url:"https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
    },
  });
});