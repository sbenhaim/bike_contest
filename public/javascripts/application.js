$(document).ready(function() {
	$("a.remote").click(function() {
		$(this.rel).load( $(this).attr('part') );
		$(this.rel).slideDown("slow");
	});	
});

function submitRemoteForm(form, action) {
	var data = new Object;
	var inputs = $(arguments.caller).find(":input");
	$.each(inputs, function( i, input ) {
		data[input.name] = input.value;
	});
	$.post(action, data, null, "json");
}

Array.prototype.remove = function(el) {
	this.splice(this.indexOf(el), 1);
	return this;
}