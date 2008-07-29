var Validator = {
	
	invalid: [],
	submit: null,
	
	init: function( form ) {
		form = $(form);
		
		var submit = Validator.submit = form.find('button')
		submit.attr('disabled', true);
		
		var fields = form.find(":input:not(:button):not(:hidden)");
		fields.blur( Validator.validate );
		fields.keypress( Validator.validate );
		
		$.each(fields, function(i, field) {
			Validator.validate({target: field});
		});
		
		console.log(Validator.invalid.length);
		if (Validator.invalid.length == 0) submit.attr('disabled', false);
	},
	
	validate: function(e) {
		console.log("Validating " + e.target);
		if ($(e.target).hasClass('required')) {
			Validator.test_required($(e.target));
		}
		if ($(e.target).hasClass('future')) {
			Validator.test_future($(e.target));
		}
	},
	test_required: function( el ) {
		if (!el.val().match(/^\s*$/)) Validator.pass(el);
		else Validator.fail(el);
		return el.name + " is required."
	},
	
	pass: function( el ) {
		console.log("Passing " + el);
		if (Validator.invalid.indexOf(el) > -1) Validator.invalid.remove(el);
		console.log( Validator.invalid.length);
		if (Validator.invalid.length == 0) Validator.submit.attr('disabled', false);
	},
	
	fail: function ( el ) {
		console.log(Validator.invalid);
		if (Validator.invalid.indexOf(el) < 0) Validator.invalid.push(el);
	}
}

var Form = {
	submit: function( el, url ) {
		el = $(el);
		var data = new Object();
		$.each( el.find(":input:not(:button):not(:hidden)"), function(i, input) {
			data[input.name] = input.value;
		});
		$.post(url, data, Form.response, 'json');
	},
	
	respone: function( e ) {
		
	}
}