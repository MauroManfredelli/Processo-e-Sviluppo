function vediDettagli(id, username, name, surname, email, country, city, address, role) {
	if(role == 'ADMIN') {
		$("#btnEliminaUserModal").addClass("hidden");
	} else {
		$("#btnEliminaUserModal").removeClass("hidden");
	}
	$("#userIdDett").val(id);
	$("#usernameDett").html(username);
	$("#nameDett").html(name);
	$("#surnameDett").html(surname);
	$("#emailDett").html(email);
	$("#countryDett").html(country);
	$("#cityDett").html(city);
	$("#addressDett").html(address);
	$("#roleDett").html(role);
	$("#userModal").fadeIn('fast');
	$("#userModal").modal("show");
}

$(document).ready(function() {
	$("#tabellaUtenti").DataTable( {
		"info": true,
		"lengthChange": true,
		"searching": true,
		"bDestroy": true,
		columnDefs: [ {
						"targets": [4, 5],
						"orderable": false,
						"searchable": false
					}],
		"language": {
	      "lengthMenu": "Mostra _MENU_ righe per pagina",
	      "search": "Cerca ",
	      "paginate": {
	          "previous": "Precedente",
	          "next": "Successiva"
	      },
	      "zeroRecords": "Nessun risultato trovato",
	      "info": "Pagina _PAGE_ di _PAGES_",
	      "infoEmpty": "Nessun risultato trovato",
	      "infoFiltered": "(filtrate da _MAX_ righe totali)"
	  	}
    });
});

function logout() {
	window.location.href = "/Assignment3-MVC/logout";
}

function indietro() {
	window.location.href = "/Assignment3-MVC/login";
}

function eliminaUser(userId) {
	if(userId == '' || userId == undefined) {
		userId = $("#userIdDett").val();
	}
	$.ajax({
        'url' : '/Assignment3-MVC/eliminaUser',
        'type' : 'GET',
        'data' : {
            'userId' : userId,
        },
        'success' : function(data) {              
        	if(data == 'true') {
        		swal({
	    		  type: 'success',
	    		  title: 'Utente rimosso',
	    		  text: '',
	    		  showConfirmButton: true
	    		}).then(function() {
	    			reloadPage();
	    		});
        	} else {
        		swal({
	    		  type: 'error',
	    		  title: 'ERRORE',
	    		  text: 'Impossibie rimuovere l\'user',
	    		  showConfirmButton: true
	    		});
        	}
        },
        'error' : function(request, error) {
            alert("Request: "+JSON.stringify(request));
        }
    });
}

function reloadPage() {
	window.location.reload();
}
