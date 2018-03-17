$(document).ready(function() {
   	// Selezione form e definizione dei metodi di validazione
    $("#modificaDatiForm").validate({
        // Definiamo le nostre regole di validazione
    	rules : {
              username : {
                required : true,
                minlength : 5,
                maxlength : 20
              },
              password : {
                required : true,
                minlength : 8,
                maxlength : 30
              },
              repPassword : {
                equalTo: password,
                minlength : 8,
                maxlength : 30
              },
              email : {
                required : true,
                email : true
              },
              repEmail : {
                equalTo: email
              },
              name : {
                required : true
              },
              surname : {
                required : true
              },
              country : {
                required : true
              },
              city : {
                required : true
              },
              address : {
                required : true
              }
          },
          messages: {
              username: {
            	  required: "Inserisci username",
            	  minlength: "Lunghezza minima 5 caratteri",
            	  maxlength: "Lunghezza massima 20 caratteri"
              },
              password: { 
            	  required: "Inserisci password",
            	  minlength: "Lunghezza minima 8 caratteri",
            	  maxlength: "Lunghezza massima 30 caratteri"
              },
              repPassword: { 
            	  equalTo: "Le due password devono coincidere",
            	  minlength: "Lunghezza minima 8 caratteri",
            	  maxlength: "Lunghezza massima 30 caratteri"
              },
              email: {
              	required: "Inserisci la tua email",
              	email: "Inserisci una email valida"
              },
              repEmail: "Le due email devono coincidere",
              name: "Inserisci il tuo nome",
              surname: "Inserisci il tuo cognome",
              country: "Inserisci la tua nazione",
              city: "Inserisci la tua citta",
              address: "Inserisci il tuo indirizzo"
          },
          // Settiamo il submit handler per la form
          submitHandler: function(form) {
              form.submit();
          }
    });
});

function logout() {
	window.location.href = "/Assignment3-MVC/logout";
}

function userList() {
	window.location.href = "/Assignment3-MVC/userList";
}

function enableModificaDati() {
	getDatiUser();
	$("#fieldPassword").removeClass("hidden");
	$("#fieldRipetiPassword").removeClass("hidden");
	$("#fieldRipetiEmail").removeClass("hidden");
	$("#btnEnableModifica").addClass("hidden");
	$("#btnListaUtenti").addClass("hidden");
	$("#btnSalvaModifica").removeClass("hidden");
	$("#btnAnnullaModifica").removeClass("hidden");
	$("input.form-control").attr("disabled", false);
}

var userDetails;

function getDatiUser() {
	userDetails = {};
	$("#modificaDatiForm").find("input").each(function() {
		if($(this).attr("id") != undefined) {
			userDetails[$(this).attr("id")] = $(this).val();
		}
	});
}

function setDatiUser() {
	$("#modificaDatiForm").find("input").each(function() {
		if($(this).attr("id") != undefined) {
			$(this).val(userDetails[$(this).attr("id")]);
			if($(this).attr("id") == 'password') {
				$("input[name=ripetiPassword]").val(userDetails[$(this).attr("id")]);
			} else if($(this).attr("id") == 'email') {
				$("input[name=ripetiEmail]").val(userDetails[$(this).attr("id")]);
			}
		}
	});
}

function annullaModificaDati() {
	setDatiUser();
	$("#fieldPassword").addClass("hidden");
	$("#fieldRipetiPassword").addClass("hidden");
	$("#fieldRipetiEmail").addClass("hidden");
	$("#btnEnableModifica").removeClass("hidden");
	$("#btnListaUtenti").removeClass("hidden");
	$("#btnSalvaModifica").addClass("hidden");
	$("#btnAnnullaModifica").addClass("hidden");
	$("input.form-control").attr("disabled", true);
}