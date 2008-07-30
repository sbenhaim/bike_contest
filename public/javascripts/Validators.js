var Validators = {
	required: function( el ) {
		return el.value && !el.value.match(/^\s*$/);
	},
	
	email: function( el ) {
		return el.value && el.value.match(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i);
	},

	zip: function( el ) {
		return el.value && el.value.match(/^\d{5}$|^\d{5}-\d{4}$/);
	},
	
	same_as: function( el ) {
		var other_value = $("#" + ($(el).attr('rel'))).attr('value');
		return el.value && el.value == other_value;
	},
	
	positive_number: function( el ) {
		return el.value.match(/^([1-9.]|[0-9]\.\d)(\d+)?(\.\d+)?$/) && !el.value.match(/^(0*)?\.0*$/);
	},
}