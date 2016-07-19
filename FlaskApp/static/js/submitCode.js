// makes the connection between the server and the python program when the Submit Code button is pressed

$(function(){
	$('#btnSubmitCode').click(function(){
		
		$.ajax({
			url: '/submitCode',
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
