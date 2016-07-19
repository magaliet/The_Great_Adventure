// makes the connection between the server and the python program when the Log In button is pressed

$(function(){
	$('#btnLogIn').click(function(){
		
		$.ajax({
			url: '/logIn',
			data: $('form').serialize(),
			type: 'POST',
			success: function(response){
				document.open();
				document.write(response);
				document.close();
			},
			error: function(error){
				console.log(error);
			}
		});
	});
});
