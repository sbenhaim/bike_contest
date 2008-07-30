var Form = {
	submit: function( el, url ) {
		el = $(el);
		var data = new Object();
		$.each( el.find(":input:not(:button):not(:hidden)"), function(i, input) {
			data[input.name] = input.value;
		});
		$.post(url, data, Form.response, 'json');
	},
	
	response: function( e ) {
		
	}
}