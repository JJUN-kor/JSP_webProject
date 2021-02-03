<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "SQL_DAO.DB_DAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제 1-1</title>
</head>
<body>
<h1>학점(tot_cred)이 80점 이상인 학생 조회하기</h1>

<%
	DB_DAO dao = new DB_DAO(); // DAO 객체 생성
	ResultSet rs; //결과 객체
	
	String SQL = "select ID, name, dept_name , tot_cred from student where tot_cred>=80 order by tot_cred";
	
	rs = dao.get_Result(SQL);
%>
<table border=1>
<thead>
	<tr>
		<td>ID</td>
		<td>이름</td>
		<td>학과</td>
		<td>학점</td>
	</tr>
</thead>
<tbody>
<%
	while(rs.next()){
%>
	<tr>
	<%= rs.getInt(1) %>
	<%= rs.getInt(2) %>
	<%= rs.getInt(3) %>
	<%= rs.getInt(4) %>
	</tr>
<%
	}
%>
</tbody>
</table>
</body>
</html>