<%@page import="com.mysql.jdbc.Buffer"%>
<%@ page import="java.util.*,java.io.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "mail.SMTPAuthenticator" %>
<%@ page import = "java.util.Random" %>
<%@ page import = "Member_model.MemberDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");


	String email =request.getParameter("email");
	String id =request.getParameter("id");
	//String key =request.getParameter("key");
	
	//int i_key = (int)(Math.random()*8998)+1000;
	
	String key;
	//key = Integer.toString(i_key);
	StringBuffer temp = new StringBuffer();
	
	for(int i=1; i<=8; i++){
		temp.append((char)(int)((Math.random()*26)+65));
	}
	
	key=temp.toString();
	
	MemberDAO dao = new MemberDAO();
	
	dao.insert_key(key, id);
	
	Properties p = new Properties(); // 정보를 담을 객체
	
	p.put("mail,smtp,user", "hj01047811617@gmail.com");
	p.put("mail.smtp.host", "smtp.gmail.com"); 
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP 서버에 접속하기 위한 정보들
	
	try{
    Authenticator auth = new SMTPAuthenticator();
    Session ses = Session.getInstance(p, auth);
     
    ses.setDebug(true);
     
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
    
    msg.setSubject(id+"님의 인증 번호"); // 제목
     
    Address fromAddr = new InternetAddress("hj01047811617@gmail.com");
    msg.setFrom(fromAddr); // 보내는 사람
     
    Address toAddr = new InternetAddress(email);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
     
    msg.setContent("인증코드는 [ "+key+" ] 입니다", "text/html;charset=UTF-8"); // 내용과 인코딩
     
    Transport.send(msg); // 전송
    
	} catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('인증번호 전송 실패');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
	}
 
	out.println("<script>alert('인증번호 전송 성공');history.back();</script>");
	// 성공 시
	%>
</body>
</html>