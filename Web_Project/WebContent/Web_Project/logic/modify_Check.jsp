<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="Baord_model.BoardDAO" %>
<%@ page import ="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");

	String num = request.getParameter("num");
	String title = request.getParameter("title2");
	String content = request.getParameter("content2");
	
	String id = request.getParameter("id");
	//String s_id = request.getParameter("s_id");
	
	PrintWriter writer = response.getWriter();
	
	BoardDAO dao = new BoardDAO();
	
	/* out.println(num);
	out.println(title);
	out.println(content);
	out.println(id);
	out.println(s_id);
	out.println(session.getAttribute("sessionID")); */
	
	if(id.equals(session.getAttribute("sessionID")))
	{
		int result = dao.Check_modify(content, title, num);
		if (result == 0){
		writer.println("<script>");
		writer.println("alert('글 수정 완료')");
		writer.println("location.href='../View/list_Board.jsp;'");
		writer.println("</script>");
		}
	}
%>

</body>
</html>