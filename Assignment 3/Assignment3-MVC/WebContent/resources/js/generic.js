function validUsername(userId) {
	if(userId == undefined) {
		userId = '';
	}
	$.ajax({
        'url' : '/Assignment3-MVC/duplicatedUser',
        'type' : 'GET',
        'data' : {
            'username' : $("#username").val(),
            'userId' : userId
        },
        'success' : function(data) {              
            if(data=="true") {
            	swal({
  	    		  type: 'error',
  	    		  title: 'ERRORE',
  	    		  text: "Username '"+$("#username").val()+"' non disponibile",
  	    		  showConfirmButton: true,
  	    		  timer: 3000
  	    		});
            }
        },
        'error' : function(request, error) {
            alert("Request: "+JSON.stringify(request));
        }
    });
}

function validEmail(userId) {
	if(userId == undefined) {
		userId = '';
	}
	$.ajax({
        'url' : '/Assignment3-MVC/duplicatedEmail',
        'type' : 'GET',
        'data' : {
            'email' : $("#email").val(),
            'userId' : userId
        },
        'success' : function(data) {              
            if(data=="true") {
            	swal({
  	    		  type: 'error',
  	    		  title: 'ERRORE',
  	    		  text: "Email '"+$("#email").val()+"'  non disponibile",
  	    		  showConfirmButton: true,
  	    		  timer: 3000
  	    		});
            }
        },
        'error' : function(request, error) {
            alert("Request: "+JSON.stringify(request));
        }
    });
}

function userPage() {
	window.location.href = "/Assignment3-MVC/login";
}