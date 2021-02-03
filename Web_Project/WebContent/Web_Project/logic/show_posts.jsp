
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.Date"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Post</title>

<script>

	function on_click1(){
		location.href="../View/list_Board.jsp";
	}
	
</script>
</head>


<body>
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yy년 MM월 dd일 HH시 mm분");
	String today = formatter.format(new java.util.Date());
	
	//debug용
	//session.setAttribute("sessionID", "123");

	
	String num = request.getParameter("num");
	
	String URL = "jdbc:mysql://localhost:3306/my_member";
	String dbID = "Mysite";
	String dbPWD = "ekzmekzm1!";
	
	//드라이버 연결
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(URL, dbID, dbPWD);
	PreparedStatement pstmt = null;
	ResultSet rs = null;
try{
	
	String SQL ="select * from board_info where num =?";
	pstmt = conn.prepareStatement(SQL);
	pstmt.setInt(1, Integer.parseInt(num));
	rs =pstmt.executeQuery();
	rs.next();
	
	 String title = rs.getString("title");
	 String id = rs.getString("id");
	 String date = rs.getString("date");
	 String content = rs.getString("content").trim();
%>


<div style ="padding:50px">
<h4> show post</h4>
<input type="hidden" name="action" value="update">
<table class="table table-striped table-bordered">
	<tr>
	</tr>
	<tr>
		<th >제목</th>                                     <!-- 제목 입력 -->
		<td><input type="text" class="form-control" name="title" value="<%=title%>" readonly></td>
	</tr>
	<tr>
		<th >내용</th>                                     <!-- 내용 입력 -->
		<td><textarea rows="10" class="form-control" name="content" readonly><%=content %></textarea></td>
	</tr>
    <tr>
		<th >작성자</th>                                    <!-- 작성자 입력 -->
		<td><input type="text" class="form-control" name="id" value="<%=id %>" readonly></td>
	</tr>
    <tr>
		<th>작성일</th>
		<td><input type="text" class="form-control" name="date" value="<%=date %>" readonly></td>
	</tr>
</table>

<center>
<table>
	<tr>
		<td>
		<!-- <a href="../View/reply.jsp?num=<%=num%>">[답변]</a> -->
		</td>
		<td>
		&nbsp&nbsp&nbsp&nbsp&nbsp
		</td>
		
		<td>
		<a href="../View/modify.jsp?num=<%=num%>">[수정]</a>
		</td>
		<td>
		&nbsp&nbsp&nbsp&nbsp&nbsp
		</td>
		<td>
		<a href='delete.jsp?id=<%=id%>
		&s_id=<%=session.getAttribute("sessionID")%>&num=<%=num%>'>[삭제]</a>
		</td>
		<td>
		&nbsp&nbsp&nbsp&nbsp&nbsp
		</td>
		<td>
		<a href="../View/list_Board.jsp">[뒤로가기]</a>
		</td>
	</tr>
	

</table>
</center>
</div>

<%

}catch(SQLException e){
		out.print("SQL에러"+e.toString());
	}catch(Exception e){
		out.print("JSP에러"+e.toString());
	}finally{
		rs.close();
		pstmt.close();
		conn.close();
	}
	%>

</body>
</html>