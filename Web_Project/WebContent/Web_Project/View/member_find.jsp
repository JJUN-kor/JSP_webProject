<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*" %>
<%@ page import = "Member_model.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<link href ="../css/login_css.css" rel="stylesheet" style="text/css"/>

<meta charset="UTF-8">


<title>member_find</title>


<%! boolean confirm = false; 
%>

<script>
	
	function find_check(){
		if(find_form.id.value.length <1){
			alert("아이디를 입력하세요!");
			find_form.id.focus();
			return false;
		}
		if(find_form.email.value.length <1){
			alert("이메일을 입력하세요!");
			find_form.email.focus();
			return false;
			
		}
		if(find_form.key.value.length <1){
			alert("키를 입력하세요!");
			find_form.key.focus();
			return false;
		}
	}
	
</script>

</head>
<body>
 
 <%! 	
	public boolean change_Confirm(boolean confirm){
		this.confirm = true;
		return confirm;
	}
 %>
<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
	if (confirm == false){
%>
<div class="login-page">
  <div class="form">
    <form class="register-form" name="find_form" method="post" action="member_find.jsp" onsubmit="return find_Check()">
      <input type="text" name="id" maxlength="10" placeholder="ID"/>
      <input type="email" name ="email" placeholder="email address"/>
      <button onclick="find_check();<%= change_Confirm(confirm) %>">Find</button>
      <p class="message">비밀번호가 기억 나셨나요? <a href="login.jsp"> &nbsp; Login</a></p>
    </form>
	</div>
</div>

<%
	}

	else if (confirm == true){
%>

<div class="login-page">
  <div class="form">
    <form class="register-form" name="find_form" method="get" action="../logic/modify_pass.jsp" onsubmit="return register_check()">
      <input type="hidden" name="id" value="<%=id%>">
      <input type="hidden" name="email" value="<%=email%>">
      <input type="text" name="key" maxlength="10" placeholder="인증키"/>
      <p class="message">인증키 보내기 <a href="../logic/find_Check.jsp?id=<%=id%>&email=<%=email%>"> &nbsp; 보내기</a></p>
      <p class="message">비밀번호가 기억 나셨나요? <a href="modify_password.jsp"> &nbsp; Login</a></p>
      <button>Find</button>
    </form>
	</div>
</div>

<%
	confirm=false;
	}
%>
</body>
</html>