var INVALID = "<span class='invalid'> x</span>";
var VALID = "<span class='valid'> ok</span>";

Val = {
	form: null,
	invalid: [],
	init: function( form ) {
		Val.form = $("#" + form)[0];
		Val.invalid = [];

		Val.submit = $(Val.form).find(":button");

		$.each( $(Val.form).find(':input:not(:button):not(:hidden):not(:radio)') , function(i, el) {
			$(el).bind('keyup', Val.validate);
			$(el).bind('blur', Val.validate);
			Val.validate({target: el});
		});
		
		this.check_form();
	},
	
	check_form: function() {
		if (Val.invalid.length == 0) {
			this.submit.attr('disabled', false);
		}
		else {
			this.submit.attr('disabled', true);
		}
	},
	
	validate: function( e ) {
		var el = $(e.target);

		if (el.hasClass('required')) 	Validators.required( el[0] ) ? Val.pass( el ) : Val.fail( el, '*' );
		if (el.hasClass('same_as')) 	Validators.same_as( el[0] )  ? Val.pass( el ) : Val.fail( el, '*' );
		if (el.hasClass('email')) 		Validators.email( el[0] )    ? Val.pass( el ) : Val.fail( el, '*' );
		if (el.hasClass('zip')) 		Validators.zip( el[0] )      ? Val.pass( el ) : Val.fail( el, '*' );
		if (el.hasClass('positive_number')) 		Validators.positive_number( el[0] )   ? Val.pass( el ) : Val.fail( el, '*' ); 
		
		if (el.hasClass('unique')) {
			Val.greasy_wheel = el;
			el = el[0];
			
			if ( !el.value ) {
				Val.fail( $(el), '*' );
				return;
			}
			
			var controller = $(el).attr('rel').split('.')[0];
			var data = {};
			data.value = el.value;
			data.column = $(el).attr('rel').split('.')[1];
			$.post( '/' + controller + '/unique', data, Val.unique_hander, 'json');
		}
	},
	
	unique_hander: function( response ) {
		if ( response ) {
				Val.pass(Val.greasy_wheel)
			}
			else {
				Val.fail(Val.greasy_wheel, 'Taken fail!');
			}
	},
	
	pass: function( el ) {
		if ( Val.invalid.includes( el[0] ) ) {
			Val.invalid.remove( el[0] );
			el.removeClass('invalid');
			if (el.siblings(".fail:first")) el.siblings(".fail:first").html("");
			this.check_form();
		}
	},
	
	fail: function( el, message ) {
		if ( ! Val.invalid.includes( el[0] ) ) {
			el.addClass('invalid');
			Val.invalid.push( el[0] );
			if (message) el.siblings(".fail:first").html(message);
			this.check_form();
		}
	}
}

Array.prototype.includes = function( el ) {
	return this.indexOf( el ) > -1;
}

// Array.prototype.indexOf = function( el ) {
// 	for (var i = 0; i < this.length; i++) {
// 		if (this[i] == el) {
// 			return i;
// 		}
// 	}
// 	return -1;
// }
