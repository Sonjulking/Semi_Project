$(document).ready(function() {
	$('.navcolor li:nth-child(4)').hover(function() {
		$('#bie').fadeIn();
	}, function() {
		$('#bie').fadeOut();
	});
	$('.navcolor li:nth-child(3)').hover(function() {
		$('#coin').fadeIn();
	}, function() {
		$('#coin').fadeOut();
	});

	$('.navcolor li:nth-child(2)').hover(function() {
		$('#murshroom').fadeIn();
	}, function() {
		$('#murshroom').fadeOut();
	});
	$('.navcolor li:nth-child(1)').hover(function() {
		$('#jinx').fadeIn();
	}, function() {
		$('#jinx').fadeOut();
	});

});