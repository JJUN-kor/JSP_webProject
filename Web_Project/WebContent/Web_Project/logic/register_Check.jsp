<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
 <%@ page import ="Member_model.MemberBean" %>
 <%@ page import ="Member_model.MemberDAO" %>
 <%@ page import ="java.io.*" %>
 <%@ page import ="java.sql.*" %>


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
	
	<jsp:useBean id="member" class="Member_model.MemberBean" scope="page" />
	<jsp:setProperty name="member" property="id"/>
	<jsp:setProperty name="member" property="pwd"/>
	<jsp:setProperty name="member" property="email"/>
	<jsp:setProperty name="member" property="name"/>
	

	<%
	
	/* //결과용
	int result=2;
	

	
	//request
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
	//연결정보
	String URL = "jdbc:mysql://localhost:3306/my_member";
	String dbID = "Mysite";
	String dbPWD = "ekzmekzm1!";
	
	//드라이버 연결
	Class.forName("com.mysql.jdbc.Driver");
	
	//DBMS연결
	conn = DriverManager.getConnection(URL, dbID, dbPWD);
	
	String SQL = "INSERT INTO member_info VALUES(?, ?, ?, ?)";
	
	//SQL문 생성
	pstmt = conn.prepareStatement(SQL);
	
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	pstmt.setString(3, email);
	pstmt.setString(4, name);
	
	//쿼리문 실행
	pstmt.execute();
	
	result=0;
	}
	
	catch (Exception e){
		result=-1;
		e.getStackTrace();
	} */
	
	//alert창 띄우기 위해
	PrintWriter writer = response.getWriter();
	
	MemberDAO mem = new MemberDAO();
	
	//결과값 받기
	int result = mem.Check_join(member);

	if (result == 0){
		writer.println("<script>");
		writer.println("alert('회원 가입 완료')");
		writer.println("</script>");
		response.sendRedirect("../View/login.jsp");
		}
	else
		{
		writer.println("<script>");
		writer.println("alert('회원 가입 실패')");
		writer.println("window.history.back()");
		writer.println("</script>");
		} 
	%>
</body>
</html>