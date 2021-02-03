<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="Member_model.MemberDAO" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% request.setCharacterEncoding("utf-8"); 

	String key=request.getParameter("key");
	String id =request.getParameter("id");
	
	MemberDAO dao = new MemberDAO();
	
	String get_key=dao.get_key(id);
	
	//alert창 띄우기 위해
	PrintWriter writer = response.getWriter();
	if(key.equals(get_key)){
		writer.println("<script>");
		writer.println("alert('인증 성공!');");
		response.sendRedirect("../View/modify_pass_view.jsp?id="+id);
		writer.println("</script>");
		
		
	}
	else{
		writer.println("<script>");
		writer.println("alert('인증번호가 다릅니다')");
		writer.println("window.history.back()");
		writer.println("</script>");
	}
	
%>


<title></title>
</head>
<body>

</body>
</html>