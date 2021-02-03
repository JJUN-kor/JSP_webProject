<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>


<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Board_list</title>
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<SCRIPT>
	function Check()  {  // (1) 검색어 입력여부 확인
	if (Form.keyword.value.length < 1) {
	alert("검색어를 입력하세요.");     
	Form.keyword.focus(); 
         return false;   // (2) 웹 서버로 입력 값을 전송치 못하도록 함
	}
}</SCRIPT>
	
<style>
body {

font-family: "Helvetica Nene", Helvetica, Arial, sans-serif;

font-size: 14px;

line-height: 1.42857143;

color: #333;

background-color: #fff;

}

</style>

<a class ="btn btn-primary pull-right" href="../logic/logout.jsp" >로그아웃</a>
<div class ="btn btn-primary pull-right" href="../logic/logout.jsp" >접속 ID=<%= session.getAttribute("sessionID") %></div>
</head>

<body>
<%
	String key = request.getParameter("key");  // 글제목, 글내용, 작성자
	String keyword = request.getParameter("keyword");  // 검색어 입력 값

	String pageNum = request.getParameter("pageNum");  //  현재 페이지번호 받음
	if(pageNum == null)    {   // 처음 이 페이지 방문시 페이지번호 초기화 
		pageNum = "1";
	}

	String getSize;
	getSize=request.getParameter("listSize");
	
	int listSize = 5;
	
	if(getSize == "1")
		listSize=5;
	else if (getSize == "2")
		listSize=10;
	else if (getSize == "3")
		listSize=15;
	
	int currentPage = Integer.parseInt(pageNum);   // 현재 열람한 페이지 번호
	int startRow = (currentPage - 1) * listSize + 1;  // 현재 페이지의 시작 레코드 번호
	int endRow = currentPage * listSize;     //  현재 페이지의 마지막 페이지 번호
	int lastRow = 0;   // 전체 레코드의 순번
	int i = 0;
	int num[] = {0};  // 마지막 레코드의 순번을 얻기 위한 임시 배열 변수
	String strSQL = "";
	
	//연결 정보들
	String URL = "jdbc:mysql://localhost:3306/my_member?useSSL=false";
	String dbID = "Mysite";
	String dbPWD = "ekzmekzm1!";
	
	//연결 드라이버
	Class.forName("com.mysql.jdbc.Driver");
	
	//DBMS연결
	Connection conn = DriverManager.getConnection(URL, dbID, dbPWD);
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = null;  // 주제어 기반 전체 레코드 수를 얻기 위함: lastRaw 값 얻기 위함
	
    if (key==null || keyword==null){  // (5) 처음 listboard.jsp 호출시 질의문, or, 모두 검색
		strSQL = "SELECT count(*) FROM board_info";
    }else{             // (6) 처음 listboard.jsp 호출시 질의어 입력 경우, 질의문 생성
		strSQL = "SELECT count(*) FROM board_info WHERE " + key + " like '%" + keyword + "%'";
    }
    rs = stmt.executeQuery(strSQL);
    rs.next();
    lastRow = rs.getInt(1);
    rs.close();
    
%>

<div class="row text-center">
	<h3> 게시글 </h3>
</div>
<div class="center-block">
<table class="table table-striped">
	<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
	</tr>
	</thead>
	
<% 
if(lastRow > 0) {
	if(key==null || keyword==null){   // (8) 검색조건 모두 입력 아닌 경우
		strSQL = "SELECT * FROM board_info WHERE num BETWEEN " + startRow + " and " + endRow + " ORDER BY num asc";   // “ 와 order 사이에 한 칸 띄움 주의
		rs = stmt.executeQuery(strSQL);
	} else {      // (9) 검색조건 모두 입력 경우 
		strSQL = "SELECT * FROM board_info WHERE " + key + " like '%" + keyword + "%' ORDER BY num DESC";
		if(rs != null){
			rs.close();
			rs = stmt.executeQuery(strSQL);
			}
		}
	for (i = 0; i < listSize; i++){    // 한 번 수행시마다 한 개 레코드의 값을 읽어 출력	  
		if(rs.next()){    // DB에서 한 개 레코드의 각 항목 값을 얻음
  		      int listnum = rs.getInt("num");
		      String title = rs.getString("title");
		      String id = rs.getString("id");
		      String date = rs.getString("date");
		      int visible = rs.getInt("visible");
%>
	<tr>
		<td><%=listnum %></td>
		<% if (visible != 0){ %>
		<td><a href="../logic/show_posts.jsp?num=<%=listnum%>"><%=title %></a></td>
		<% } else { %>
			<td>[삭제된 글입니다]</td>
		<% }%>
		<td><%=id %></td>
		<td><%=date %></td>
	</tr>
<% 
		}    
	}	
%>
</table>
</div>
<div class="row text-center">
<%
	rs.close();
	stmt.close();
	conn.close();       }
	if(lastRow > 0) {
		int setPage = 1;  // 검색 수만큼의 하단 페이지 번호 생성 변수
		int lastPage = 0;
		if(lastRow % listSize == 0)    // 전체 레코드 수가 5로 나누어 나머지 없는 경우
			lastPage = lastRow / listSize;
		else
			lastPage = lastRow / listSize + 1;  // 나머지 있는 경우

		if(currentPage > 1) {   //  현 페이지가 끝 페이지이면 “이전” 메뉴 출력 
	%>
		   <a href="list_Board.jsp?pageNum=<%=currentPage-1%>">[이전]</a>
	<%	
	}
	for(i=setPage; i<=lastPage; i++) {
		if (i == Integer.parseInt(pageNum)){
	%>
	 [<%=i%>]
	<%		
		}else{
	%>
		<a href="list_Board.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%
		}
	}
	if(lastPage > currentPage) {
%>
		<a href="list_Board.jsp?pageNum=<%=currentPage+1%>">[다음]</a>
<%
	}
}

%>
<div class="dropdown text-right" style="display: inline-block; height:25px; width:100px;"> 
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="height:30px;">게시글 수
  <span class="caret"></span></button> 
  <ul class="dropdown-menu"> 
    <li><a href="list_Board.jsp?listsize=1">5</a></li> 
    <li><a href="list_Board.jsp?listsize=2">10</a></li> 
    <li><a href="list_Board.jsp?listsize=3">15</a></li> 
  </ul> 
</div> 
</div>


<a class ="btn btn-primary pull-right" href="posts.jsp" >글쓰기</a>
<br>
<div class="row text-center">
			<FORM Name='form' Method='POST' Action='list_Board.jsp' OnSubmit='return Check()'>
			<select class="form-control" name="key" style="width:100px; display: inline-block; height:33px">
			<option value="title" selected>
                                                 글제목</option>
			<option value="content">
                                                  글내용</option>
			<option value="id">
                                                  작성자</option>
			</select>
			<input type="hidden" name='search' value='1'>
			<input type="text" name="keyword" value='' size='20' maxlength='30' style="display: inline-block; height:30px">
			<!--<button type="submit" class="btn btn-primary">Search</button>-->
			<input type="submit" class="btn btn-primary" value="Search">
			</FORM>
</div>

</body>
</html>