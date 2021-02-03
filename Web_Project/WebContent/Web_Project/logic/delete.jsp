<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="Baord_model.BoardDAO" %>
<%@ page import ="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String s_id = request.getParameter("s_id");
	
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	
	
	PrintWriter writer = response.getWriter();
	
	if (id.equals(s_id)){
		dao.Check_delete(num);
		writer.println("<script>");
		writer.println("alert('글 삭제 완료')");
		writer.println("location.href='../View/list_Board.jsp';");
		writer.println("</script>");
	}
	else{
		writer.println("<script>");
		writer.println("alert('작성자만 삭제할 수 있습니다')");
		writer.println("window.history.back();");
		writer.println("</script>");
	}

%>
</head>
<body>

</body>
</html>