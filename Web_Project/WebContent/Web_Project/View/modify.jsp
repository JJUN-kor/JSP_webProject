
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.Date"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@ page import ="java.io.*" %>
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
	 
	 if(id.equals(session.getAttribute("sessionID")) != true){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('글 게시자만 수정 할 수 있습니다.')");
		writer.println("window.history.back();");
		writer.println("</script>");
	 }
		 
	 
	 
%>


<div style ="padding:50px">
<form name="form" action="../logic/modify_Check.jsp" method="post">
<div class="row text-center"><h4> modify post</h4></div>
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="s_id" value='<%=session.getAttribute("sessionID")%>'>
<table class="table table-striped table-bordered">
	<tr>
	</tr>
	<tr>
		<th >제목</th>                                     <!-- 제목 입력 -->
		<td><input type="text" class="form-control" name="title2" value="<%=title%>"></td>
	</tr>
	<tr>
		<th >내용</th>                                     <!-- 내용 입력 -->
		<td><textarea rows="10" class="form-control" name="content2" ><%=content %></textarea></td>
	</tr>
    <tr>
		<th >작성자</th>                                    <!-- 작성자 입력 -->
		<td><input type="text" class="form-control" name="id" value="<%=id %>" readonly></td>
	</tr>
    <tr>
		<th>작성일</th>
		<td><input type="text" class="form-control" name="date" value="<%=today %>" readonly></td>
	</tr>
</table>

<center>
<table>
	<tr>
		<td>
		<input type="submit" class="btn btn-primary" value="수정">
		</td>
		<td>
		&nbsp&nbsp&nbsp&nbsp&nbsp
		</td>
		<td>
		<a href="list_Board.jsp">[뒤로가기]</a></label>
		</td>
	</tr>
	

</table>
</center>
</form>
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