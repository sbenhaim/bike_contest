var Validator = {
	init: function( form ) {
		this.form = $(form);
		this.invalid = [];
		this.submit = this.form.find(":button");
		this.submit.attr('disabled', true);
		this.fields = this.form.find(":input:not(:button):not(:hidden)");
		this.fields.blur( this.validate );
		this.fields.keypress( this.validate );
		
		$.each(this.fields, function(i, field) {
			Validator.validate({target: field});
		});
	},
	validate: function(e) {
		if ($(e.target).hasClass('required')) {
			Validator.test_required($(e.target));
		}
		if ($(e.target).hasClass('future')) {
			Validator.test_future($(e.target));
		}
	},
	test_required: function( el ) {
		if (!el.val().match(/^\s*$/)) this.pass(el);
		else this.fail(el);
	},
	pass: function( el ) {
		if (this.invalid.indexOf(el) > -1) this.invalid.remove(el);
		if (this.invalid.length == 0) this.submit.attr('disabled', false);
	},
	fail: function ( el ) {
		if (this.invalid.indexOf(el) > -1) this.invalid.push(el);
	}
}