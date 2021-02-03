<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<link href ="../css/login_css.css" rel="stylesheet" style="text/css"/>

<script>

	function modify_check(){
		if(modify_form.pwd.value.length < 1){
			alert('비밀번호를 입력하세요');
			modify_form.pwd.focus();
			return false;
		}
		if(modify_form.pwd.value != modify_form.pwd2.value){
			alert('비밀번호가 다릅니다');
			return false;
		}
	}

</script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<div class="login-page">
  <div class="form">
    <form class="register-form" name="modify_form" method="post" action="../logic/modify_pass_check.jsp" onsubmit="return modify_check()">
	  <input type="hidden" name="id" value='<%= request.getParameter("id") %>'>
	  <input type="password" name="pwd" maxlength="10" placeholder="변경할 비밀번호"/>
      <input type="password" name="pwd2" maxlength="10" placeholder="비밀번호 확인"/>
      <button>변경</button>
    </form>
	</div>
</div>

</body>
</html>