// makes the connection between the server and the python program when the Submit Answer button is pressed

$(function(){
	$('#btnSubmitAnswer').click(function(){
		
		$.ajax({
			url: '/submitAnswer',
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
