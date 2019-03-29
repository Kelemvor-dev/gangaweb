$(document).ready(function()
{
	var base_url = $('#baseurl').html();  // seleccionamos la base url de un div

	// personalizamos los mensajes
	jQuery.extend
	(
		jQuery.validator.messages,
		{
		    required: "Este campo es obligatorio",
		    remote: "Por favor corrija este campo",
		    email: "Por favor escriba un correo válido",
		    url: "Por favor escriba una url válida.",
		    date: "Por favor escriba una fecha válida.",
		    dateISO: "Por favor escriba una fecha válida (ISO).",
		    number: "El campo debe ser numerico.",
		    digits: "Por favor use sólamente dígitos.",
		    creditcard: "Por favor introduzca un número de tarjeta de crédito válido.",
		    equalTo: "Por favor introduzca el mismo valor del anterior.",
		    accept: "Por favor introduzca un valor con una extensión válida.",
		    maxlength: jQuery.validator.format("Por favor escriba máximo {0} caracteres."),
		    minlength: jQuery.validator.format("Por favor escriba mínimo {0} caracteres."),
		    rangelength: jQuery.validator.format("Por favor escriba un valor entre {0} y {1} caracteres de longitud."),
		    range: jQuery.validator.format("Por favor escriba un valor entre {0} y {1}."),
		    max: jQuery.validator.format("Por favor introduzca un valor menor o igual a {0}."),
		    min: jQuery.validator.format("Por favor introduzca un valor mayor o igual a {0}.")
		},

		$.validator.addMethod
		(
		    "date",
		    function(textoFecha, element) {
				    var currVal = textoFecha;
				    if (currVal == '')
				       return false;
			
			  		// declaramos la expresión regular 
					var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/;
					var dtArray = currVal.match(rxDatePattern); // is format OK?
					
					if (dtArray == null)
					{
						return false;
					}
					
					// verificamos que el formato tenga el formato dd/mm/yyyy
					var dtDay = dtArray[1];
					var dtMonth = dtArray[3];
					var dtYear = dtArray[5];
					
					if (dtMonth < 1 || dtMonth > 12)
					{
						return false;
					}
					else if (dtDay < 1 || dtDay > 31)
					{
						return false;
					}
					else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31)
					{
						return false;
					}
					else if (dtMonth == 2) 
					{
						var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
					    if (dtDay > 29 || (dtDay == 29 && !isleap))
						{
							return false;
						}
					}
					
					return true;
			    },
			    "Por favor digite una fecha válida usando el formato dd-mm-aaaa."
			)
 	);

    // newsletter
	$('.form_newsletter').validate({
        rules:{
            email : {required: true, email:true, maxlength: 100},
            
        },
        highlight: function (element) {
        	$(element).addClass('form_txt_error');
        	$(element).removeClass('error');
        },
        unhighlight: function(element) {
        	$(element).removeClass('form_txt_error');
        },
        focusInvalid:true,
        onfocusout:false,
        submitHandler: function(event)
        {
           	llamadaAjaxnewsletter('.form_newsletter');  // mandamos el nombre del formulario
        }
    });
    
    // reservas
    $('.form_reservations').validate({
        rules:{
        	date : {required: true, maxlength: 100},
            brand : {maxlength: 100},
            model : {maxlength: 100},
            mileage : {maxlength: 100, number:true},
            name : {required: true, maxlength: 100},
            cel : {required: true, maxlength: 100},
            email : {required: true, email:true, maxlength: 100},
        },
        highlight: function (element) {
        	$(element).addClass('form_txt_error');
        	$(element).removeClass('error');
        },
        unhighlight: function(element) {
        	$(element).removeClass('form_txt_error');
        },
        focusInvalid:true,
        onfocusout:false,
        submitHandler: function(event)
        {
           	llamadaAjaxReservation('.form_reservations');  // mandamos el nombre del formulario
        }
    });
    
	// funcion de jquery donde recibimos el nombre del formulario
    function llamadaAjaxnewsletter(formname)
	{
		$.ajax({
			url: $(formname).attr('action'),
			type: 'POST',
			dataType : 'json',
			data:  $(formname).serialize(),
			beforeSend: function ()
			{
			    $('#loading_newsletter').html('<img src="'+base_url+'uploads/default/loading.gif" width="28" height="28"/>');
			},
			success: function(data)
			{
				$('#loading_newsletter').html(data.msg);
				if(data.status == 'error')
				{
					$('#loading_newsletter').html('<div style="color: red">'+ data.msg +'</div>');
				}
				else
				{
					$('#loading_newsletter').html('<div class="wrap_success_send_contact">'+ data.msg +'</div>');
				}
			},
			error: function(err)
	        {
	        	alert("Ocurrió un error. Por favor inténtelo de nuevo.");
	        }
		});
	}
	
	function llamadaAjaxReservation(formname)
	{
		if(!$("#termCond").is(':checked'))
		{  
			$('#loading_reservations').html("Acepte Términos y Condiciones para continuar.");
			return;
			
        }
		
		$.ajax({
			url: $(formname).attr('action'),
			type: 'POST',
			dataType : 'json',
			data:  $(formname).serialize(),
			beforeSend: function ()
			{
			    $('#loading_reservations').html('<img src="'+base_url+'uploads/default/loading.gif" width="28" height="28"/>');
			},
			success: function(data)
			{
				$('#loading_reservations').html(data.msg);
				if(data.status == 'error')
				{
					$('#loading_reservations').html('<div style="color: red">'+ data.msg +'</div>');
				}
				else
				{
					$('#loading_reservations').html('<div class="wrap_success_send_contact">'+ data.msg +'</div>');
				}
			},
			error: function(err)
	        {
	        	alert("Ocurrió un error. Por favor inténtelo de nuevo.");
	        }
		});
	}
});