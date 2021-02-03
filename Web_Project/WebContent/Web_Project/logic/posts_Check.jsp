<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="Baord_model.BoardBean" %>
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
%>

				<!-- 자바빈 객체 생성 -->
	<jsp:useBean id="board" class="Baord_model.BoardBean" scope="page" />
	<jsp:setProperty name="board" property="title"/>
	<jsp:setProperty name="board" property="content"/>
	<jsp:setProperty name="board" property="id"/>
	<jsp:setProperty name="board" property="date"/>

<%

	BoardDAO dao = new BoardDAO();
	
	//결과값
	int result = dao.Check_posts(board);
	
	//alert창 띄우기 위해
	PrintWriter writer = response.getWriter();
	
	if (result == 0){
		writer.println("<script>");
		writer.println("alert('글 등록 완료')");
		writer.println("location.href='../View/list_Board.jsp';");
		writer.println("</script>");
		
		}
	else
		{
		writer.println("<script>");
		writer.println("alert('글 등록 실패')");
		writer.println("window.history.back()");
		writer.println("</script>");
		} 
%>
</body>
</html>