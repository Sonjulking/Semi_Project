
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


		pwd: {
			required: true,
			minlength: 6,
			maxlength: 12,
			specialChars: true,
			capitalLetters: true
		},
		pwd_recheck: {
			required: true,
			equalTo: "#password1"
		},

		id: {
			required: true,
			minlength: 4,
			maxlength: 20,
			engAndNum: true

		},

		email: {
			emailCheck: true
		},
		check_info: {
			required: true
		},


	},

	messages: {
		pwd: {
			required: "비밀번호 입력은 필수 입니다.",
			minlength: "최소 6글자 이상 입력해주세요.",
			maxlength: "12글자를 넘지 말아주세요.",
			capitalLetters: "대문자 하나 입력해주세요",
			specialChars: "특수문자 입력해주세요."
		},
		pwd_recheck: {
			required: "중복체크는 필수 입니다.",
			equalTo: "일치하지 않아요...."

		},

		id: {
			required: "아이디는 필수 입니다.",
			minlength: "최소 4글자 이상 입력해주세요",
			maxlength: "20글자를 넘지 말아주세요",
			engAndNum: "아이디는 영문과 숫자로만 작성해 주세요.",
			remote: "중복 아이디 입니다.!!!"
		},

		email: {
			required: "이메일 입력은 필수 입니다.",
			emailCheck: "이메일 형식에 맞게 입력해 주세요."
		},
		check_info: {
			required: "약관동의는 필수 입니다.",
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


/*$('.inputpwd').keyup(function() {

	let password1 = $("#password1").val();
	let password2 = $("#password2").val();

	if (password1 != "" || password2 != "") {
		if (password1 == password2) {
			$("#pwd_recheck").text('일치했네용');
			$("#pwd_recheck").attr('color', green);

		} else {
			$("#pwd_recheck").text('불일치');
			$("#pwd_recheck").attr('color', red);
		}
	}


})*/

