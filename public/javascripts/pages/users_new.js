$(document).ready(function(){
	$("#name").focus();
	$("#name").blur(function(){
		if (verify_name().valid === true) {
			$.ajax({
				url: "/users/exist",
				data: {name:$("#name").attr("value")},
				dataType: "json",
				success: function(result){
					if (result.correct === false) {
						show_error("name",result.msg);
					}else{
						correct("name","该用户名可以注册");
					}
				}
			});
		};
	});
	$("#pwd").keyup(function(){
		var v = $(this).attr("value");
		if(v.length > 24 || v.length < 6){
			show_error("pwd","密码长度应该在6-24之间");
		}else{
			correct("pwd","正确");
		};
	});
	$("#repwd").keyup(function(){
		var v = $(this).attr("value");
		if (v === $("#pwd").attr("value")) {
			correct("repwd","正确");
		}else{
			show_error("repwd","两次输入的密码不同");
		}
	});
	$("#name").keyup(function(){
		var verify_result = verify_name();
		if (verify_result.valid === true) {
			correct("name","正确");
		}else{
			show_error("name",verify_result.msg);
		};
	});
	var verify_cfg = {
		name: {
			input:"name",
			error_container: "name_error"
		},
		pwd: {
			input:"pwd",
			error_container: "pwd_error"
		},
		repwd: {
			input:"repwd",
			error_container: "repwd_error"
		}
	};
	function show_error(errType,msg){
		$("#"+verify_cfg[errType]["error_container"]).html(msg);
		$("#"+verify_cfg[errType]["error_container"]).show();
		$("#"+verify_cfg[errType]["input"]).css({border:"1px solid #f90"});
	}
	function correct(correctType,msg){
		$("#"+verify_cfg[correctType]["error_container"]).html(msg);
		$("#"+verify_cfg[correctType]["error_container"]).css({color:"green"});
		$("#"+verify_cfg[correctType]["input"]).css({border:"1px solid green"});
	}
	function verify_name(){
		var v = $("#name").attr("value");
		var valid = false,msg = "";
		if (v.length > 24) {
			msg = "用户名太长，应该在6-24个字符之间";
		}else if(v.length < 6){
			msg = "用户名太短，应该在6-24个字符之间";
		}else if(v.match(/[^a-zA-Z0-9_]/) != null){
			msg = "用户名必须由字母，数字和下划线组成";
		}else{
			valid = true;
		}
		return {valid:valid,msg:msg};
	}
});
