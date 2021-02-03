<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="Member_model.MemberDAO, java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<%
	//request 객체 인코딩 처리
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//자바빈 객체 생성
	MemberDAO mem = new MemberDAO();
	
	int state = mem.Check_login(id, pwd);
	
	//alert창 띄우기 위해
	PrintWriter writer = response.getWriter();
	//로그인 성공시
	if(state == 1){
		
		//세션에 현재아이디 세팅
		session.setAttribute("sessionID", id);
		
		
		//debug용
		writer.println("<script>");
		writer.println("alert('로그인 완료')");
		writer.println("</script>");
		
		response.sendRedirect("../View/list_Board.jsp");
	}
	else if(state == 0){
		
		//debug용
		writer.println("<script>");
		writer.println("alert('비밀번호가 다릅니다')");
		writer.println("window.history.back()");
		writer.println("</script>");
	}
	else if( state==-1 ){
		
		//debug용
		writer.println("<script>");
		writer.println("alert('ID가 존재하지 않습니다')");
		writer.println("window.history.back()");
		writer.println("</script>");
	}
%>

</body>
</html>