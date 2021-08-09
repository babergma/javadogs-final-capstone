var editorEmp;
jQuery(function($) {
    function format(d) {
        return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
            '<tr>'+
            '<td>First Name:</td>'+
            '<td>'+d.firstName+'</td>'+
            '</tr>'+
            '<tr>'+
            '<td>Last Name:</td>'+
            '<td>'+d.lastName+'</td>'+
            '</tr>'+
            '<tr>'+
            '<td>Position:</td>'+
            '<td>' + d.position + '</td>'+
            '</tr>'+

            '<tr>'+
            '<td>Office:</td>'+
            '<td>' + d.office + '</td>'+
            '</tr>'+

            '<tr>'+
            '<td>Start Date:</td>'+
            '<td>' + d.startDate + '</td>'+
            '</tr>'+

            '<tr>'+
            '<td>Salary:</td>'+
            '<td>' + d.salary + '</td>'+
            '</tr>'+

            '<tr>'+
            '<td><a href="/employee/' + d.id + '/rest/" class="btn btn-primary btn-block btn-sm">Edit</td>'+
            '<td>&nbsp;</td>'+
            '</tr>'+
            '</table>';
    }

    var employeeTable = $('#employees').DataTable( {
        processing: true,
        serverSide: false,
        order: [[ 4, "desc" ]],
        ajax: {
            url: "/user/rest/employees",
            type: "GET"
        },
        columns: [
            {
                "className":      'details-control',
                "orderable":      false,
                "data":           null,
                "defaultContent": '&nbsp;'
            },
            { data: "firstName" },
            { data: "lastName" },
            { data: "position" },
            { data: "office" },
            { data: "startDate" },
            { data: "salary" }
        ],
        select: true
    } );


    $('#employees tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = employeeTable.row( tr );
        var data = row.data();
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format(row.data()) ).show();
            tr.addClass('shown');
        }
    } );


});