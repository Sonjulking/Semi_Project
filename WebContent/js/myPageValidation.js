
$.validator.addMethod("engAndNum", function(value, element) {
	var pattern = /^[A-Za-z0-9]*$/;

	return pattern.test(value);
});

$.validator.addMethod("specialChars", function(value, element) {
	// Define the pattern to match special characters
	var pattern = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;

	// Test the value against the pattern and return true or false
	return pattern.test(value);
});

$.validator.addMethod("capitalLetters", function(value, element) {
	// Define the pattern to match capital letters
	var pattern = /[A-Z]/;

	// Test the value against the pattern and return true or false
	return pattern.test(value);
});

$.validator.addMethod("emailCheck", function(value, elements) {
	var pattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;

	return pattern.test(value);

});

$.validator.addMethod("phoneCheck", function(value, elements) {
	var pattern = /[0-9]/;

	return pattern.test(value);

});

$(".joinForm").validate({


	rules: {


		modify_pwd1: {
			required: true,
			minlength: 6,
			maxlength: 12,
			specialChars: true,
			capitalLetters: true
		},
		modify_pwd2: {
			required: true,
			equalTo: "#password1"
		},

	},

	messages: {
		modify_pwd1: {
			required: "비밀번호 입력은 필수 입니다.",
			minlength: "최소 6글자 이상 입력해주세요.",
			maxlength: "12글자를 넘지 말아주세요.",
			capitalLetters: "대문자 하나 입력해주세요",
			specialChars: "특수문자 입력해주세요."
		},
		modify_pwd2: {
			required: "중복체크는 필수 입니다.",
			equalTo: "일치하지 않아요...."

		},


	},

	errorElement: "p",
	errorClass: "bad",
	validClass: "good",

	success: function(label) {
		// This function is called when a field passes validation
		label.text("👍").addClass("okayValid");
	},
	onkeyup: function(element) {
		// Trigger validation on keyup event
		$(element).valid();
	},

});

