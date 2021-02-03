<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Member_model.MemberDAO" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%
	request.setCharacterEncoding("utf-8");
%>
<title></title>
</head>
<body>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	MemberDAO dao = new MemberDAO();
	
	int result = dao.update_pwd(pwd, id);
	PrintWriter writer = response.getWriter();
	if (result == 0){
		dao.delete_key(id);
		writer.println("<script>");
		writer.println("alert('비밀번호 변경 완료')");
		writer.println("location.href='../View/login.jsp';");
		writer.println("</script>");
		
	}
	else{
		writer.println("<script>");
		writer.println("alert('비밀번호 변경 실패')");
		writer.println("window.history.back();");
		writer.println("</script>");
	}
%>

</body>
</html>