<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>
<%@ page import ="java.io.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import ="Baord_model.BoardBean" %>
<%@ page import ="Baord_model.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>

<% request.setCharacterEncoding("utf-8"); %>


<title></title>
</head>
<body>


	<jsp:useBean id="board" class="Baord_model.BoardBean" scope="page" />
	<jsp:setProperty name="board" property="title"/>
	<jsp:setProperty name="board" property="content"/>
	<jsp:setProperty name="board" property="id"/>
	<jsp:setProperty name="board" property="date"/>
	
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yy년 MM월 dd일 HH시 mm분");
	String today = formatter.format(new java.util.Date());
	
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	
	int result = dao.Check_reply(board, num);
	
	PrintWriter writer = response.getWriter();
	
	if(result != -1){
		writer.println("<script>");
		writer.println("alert('글 등록 완료')");
		writer.println("location.href='../View/list_Board.jsp';");
		writer.println("</script>");
	}
	
	else{
		writer.println("<script>");
		writer.println("alert('글 등록 실패')");
		writer.println("</script>");
	}
	
%>

</body>
</html>