$(document).ready(function() {
   	// Selezione form e definizione dei metodi di validazione
    $("#signinForm").validate({
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

function verificaCredenziali(field) {
	if($("#"+field).val() == "") {
		$("#"+field).addClass("error2");
		return false;
	} else {
		$("#"+field).removeClass("error2");
		return true;
	}
}

$("#usernameLogin").on("keypress", function(e) {
	if(e.which == 13) {
        login();
    }
});

$("#passwordLogin").on("keypress", function(e) {
	if(e.which == 13) {
        login();
    }
});

function login() {
	var validUser = verificaCredenziali("usernameLogin");
	var validPassword = verificaCredenziali("passwordLogin");
	if(validUser && validPassword) {
		$("#loginForm").submit();
	}
}