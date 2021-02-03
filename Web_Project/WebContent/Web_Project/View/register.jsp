<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href ="../css/login_css.css" rel="stylesheet" style="text/css"/>

<meta charset="UTF-8">

<title>Register</title>

<script>
	function register_check(){
		if(register_form.id.value.length <1){
			alert("아이디를 입력하세요!");
			register_form.id.focus();
			return false;
		}
		if(register_form.pwd.value.length <1){
			alert("비밀번호를 입력하세요!");
			register_form.pwd.focus();
			return false;
		}
		if(register_form.email.value.indexOf("@") + "" == "-1" ||
		   register_form.email.value.indexOf(".") + "" == "-1" ||
		   register_form.email.value == ""){
			alert("이메일을 형식에 맞게 입력하세요!");
			register_form.email.focus();
			return false;
		}
		if(register_form.name.value.length <1){
			alert("이름을 입력하세요!");
			register_form.name.focus();
			return false;
		}
	}

</script>

</head>
<body>
<div class="login-page">
  <div class="form">
    <form class="register-form" name="register_form" method="post" action="../logic/register_Check.jsp" onsubmit="return register_check()">
      <input type="text" name="id" maxlength="10" placeholder="ID"/>
      <input type="password" name="pwd" maxlength="10" placeholder="password"/>
      <input type="email" name ="email" placeholder="email address"/>
      <input type="text" name="name" placeholder="name"/>
      <button>create</button>
      <p class="message">이미 계정이 있나요? <a href="login.jsp"> &nbsp; Login</a></p>
    </form>
	</div>
</div>
</body>
</html>