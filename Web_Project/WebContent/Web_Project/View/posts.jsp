<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Post</title>

<script>

	function check(){
		if (posts.title.value.length < 1){
			alert("제목을 입력하세요");
			posts.title.foucus();
			return false;
		}
		if (posts.content.value.length < 1){
			alert("내용을 입력하세요");
			posts.title.foucus();
			return false;
		}
		
		return true;
	}
	
	function on_click1(){
		location.href="list_Board.jsp";
	}


</script>
</head>


<body>
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yy년 MM월 dd일 HH시 mm분");
	String today = formatter.format(new java.util.Date());
	
%>


<div style ="padding:50px">
<h4> 게시글 작성</h4>
<form action="../logic/posts_Check.jsp" name="posts" method="post" class="form-horizontal" onsubmit="return form_check()">
<input type="hidden" name="action" value="update">
<table class="table table-striped table-bordered">
	<tr>
	</tr>
	<tr>
		<th >제목</th>                                     <!-- 제목 입력 -->
		<td><input type="text" class="form-control" name="title" value=""></td>
	</tr>
	<tr>
		<th >내용</th>                                     <!-- 내용 입력 -->
		<td><textarea rows="10" class="form-control" name="content"></textarea></td>
	</tr>
    <tr>
		<th >작성자</th>                                    <!-- 작성자 입력 -->
		<td><input type="text" class="form-control" name="id" value="<%=  session.getAttribute("sessionID") %>"></td>
	</tr>
    <tr>
		<th>작성일</th>
		<td><input type="text" class="form-control" name="date" value="<%= today %>" readonly></td>
	</tr>
</table>
<center>
<table>
	<tr>
		<td>
		<button class="btn btn-primary" type="submit">저장</button>
		</td>
		<td>
		&nbsp&nbsp&nbsp&nbsp&nbsp
		</td>
		<td>
		<button class="btn btn-primary" onclick="on_click1()">뒤로가기</button>
		</td>
	</tr>
</table>
</center>

</form>
</div>

</body>
</html>