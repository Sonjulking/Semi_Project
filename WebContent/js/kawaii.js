$(document).ready(function() {
	$('.navcolor li:nth-child(4)').hover(function() {
		$('#bie').fadeIn();
	}, function() {
		$('#bie').fadeOut();
	});
	$('.navcolor li:nth-child(3)').hover(function() {
		$('#lux').fadeIn();
	}, function() {
		$('#lux').fadeOut();
	});

	$('.navcolor li:nth-child(2)').hover(function() {
		$('#teemo').fadeIn();
	}, function() {
		$('#teemo').fadeOut();
	});
	$('.navcolor li:nth-child(1)').hover(function() {
		$('#jinx').fadeIn();
	}, function() {
		$('#jinx').fadeOut();
	});

});