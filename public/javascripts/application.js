var el_in_question;

$(document).ready(function() {
	$("a.remote").click(function() {
		el_in_question = $(this.rel);
		el_in_question.load( $(this).attr('part'), null, function() {
			el_in_question.slideDown("slow");
		} );
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

function stats( target, info ) {
	var ticks = info.names;
	console.log(info);
	target = $("#" + target);
	options = { 
		bars: { show: true, barWidth: 0.7 },
		xaxis: { ticks: ticks, tickSize: 30 }
		};
		
	stuff = {
		color: 'blue',
		data: info.data
	};
	
	$.plot(target, [stuff], options );
}