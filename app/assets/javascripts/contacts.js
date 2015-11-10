
// because of turbo links
$(document).on('ready page:load', function () {

	// Client side validations
	$(".contact-info").keyup(function(){
		
		var email_valid = true;
		var phone_valid = true;

		if($(this).next('select').val() === "email"){
			if( /\S+@\S+/.test($(this).val()) ){
				$(this).removeClass("errors");
				email_valid = true;
			} else {
				$(".submit-btn").attr("disabled","disabled");
				$(this).addClass("errors");
				email_valid = false;
			}

		} else if ($(this).next('select').val() === "phone"){
			
			// Numbers and spaces
			if( /^(?=.*\d)[\d ]+$/.test($(this).val()) ){
				var phone_valid = true;
				$(this).removeClass("errors");
			} else {
				var phone_valid = false;
				$(this).addClass("errors");
			}

		}
		if(email_valid && phone_valid) {
			$(".submit-btn").removeAttr("disabled");
		}
	});


});