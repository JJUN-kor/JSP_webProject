<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link href ="../css/login_css.css" rel="stylesheet" style="text/css"/>
<script>
	
	//로그인 체크
	function Login_check(){
		
		if(login_form.id.value.length < 1){
			login_form.id.focus();
			alert("아이디를 입력하세요!");
			return false;
		}
		if (login_form.pwd.value.length < 1){
			login_form.pwd.focus();
			alert("비밀번호를 입력하세요!");
			return false;
		}
	}
	

</script>
</head>
<body>
<div class="login-page">
  <div class="form">
    <form class="login-form" name="login_form" method="post" action = "../logic/loginCheck.jsp" onsubmit="return Login_check()">
      <input type="text" placeholder="ID" name="id"/>
      <input type="password" placeholder="password" name="pwd"/>
      <button>login</button>
      <p class="message">계정이 없나요? <a href="register.jsp">Create an account</a></p>
      <p class="message">비밀번호를 잊어버리셨나요? <a href="member_find.jsp">Find account</a></p>
    </form>
  </div>
 </div>
</body>
</html>