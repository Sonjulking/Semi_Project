/**
 * 
 */

$(function() {
		$("#board_type").on("change", function() {
			
			$(".board_heading1, .board_heading2, .board_heading3").hide();
			$("#heading").val("");
			
			let state = $("#board_type option:selected").val();
			
			if (state == 'free') {
				$(".board_heading1").show();
			} else if (state == 'legend') {
				$(".board_heading2").show();
			} else if (state == 'etc') {
				$(".board_heading3").show();
			}
		});
	});
		
		function check() {
			if ($("#heading").val() == '') {
				alert('말머리를 선택하세요');
				return false;
			}
		}