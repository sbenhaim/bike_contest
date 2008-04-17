var Validator = {
	init: function( form ) {
		this.form = $(form);
		this.invalid = [];
		this.submit = this.form.find(":button");
		this.submit.attr('disabled', true);
		this.fields = this.form.find(":input:not(:button)");
		this.fields.blur( this.validate );
		this.fields.keypress( this.validate );
		
		$.each(this.fields, function(i, field) {
			this.validate({target: field});
		});
	},
	validate: function(e) {
		if ($(e.target).hasClass('required')) {
			test_required($(e.target));
		}
		if ($(e.target).hasClass('future')) {
			test_future($(e.target));
		}
	},
	test_required: function( el ) {
		if (!el.val().match(/^\s*$/)) pass(el);
		else fail(el);
	},
	pass: function( el ) {
		if (invalid.indexOf(el) > -1) this.invalid.remove(el);
		if (invalid.length == 0) submit.attr('disabled', false);
	},
	fail: function ( el ) {
		if (invalid.indexOf(el) > -1) this.invalid.push(el);
	}
}