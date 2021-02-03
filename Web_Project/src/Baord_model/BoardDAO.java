package Baord_model;



import Member_model.MemberBean;
import java.sql.*;
import java.text.*;

public class BoardDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//생성자
	public BoardDAO (){
		try {
			//연결 정보들
			String URL = "jdbc:mysql://localhost:3306/my_member";
			String dbID = "Mysite";
			String dbPWD = "ekzmekzm1!";
			
			//연결 드라이버
			Class.forName("com.mysql.jdbc.Driver");
			
			//DBMS연결
			conn = DriverManager.getConnection(URL, dbID, dbPWD);}
			
			//DB연결 실패시 예외 출력
			catch (SQLException | ClassNotFoundException e) {
				e.getStackTrace();}
	}
	
	
	public int Check_posts(BoardBean board) {		
		
		String SQL = "insert into board_info(title,id,date,content) values(?,?,?,?)";
		//SQL문 생성
	try {
		pstmt= conn.prepareStatement(SQL);
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getId());
		pstmt.setString(3, board.getDate());
		pstmt.setString(4, board.getContent());
		
		//SQL update실행
		pstmt.executeUpdate();
		
		return 0; //등록완료
		}
		catch (SQLException e) {
			e.getStackTrace();
		}
		return -1; //등록 실패
	}
	
public int Check_reply(BoardBean board, String num) {		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yy년 MM월 dd일 HH시 mm분");
		String today = formatter.format(new java.util.Date());
		
		PreparedStatement pstmt2=null;
		
		String SQL = "UPDATE board_info SET num = num + 1 WHERE num > " + num;
		String SQL2 = "UPDATE board_info SET num = num + 1 WHERE num = " + num;
		//SQL문 생성
	try {
		  pstmt = conn.prepareStatement(SQL);
		  pstmt.executeUpdate();
		  
		  pstmt = conn.prepareStatement(SQL2);
		  pstmt.executeUpdate();

		  SQL ="INSERT INTO board_info(num, title, id ,date, content)";
		  SQL = SQL+ "values(?,?,?,?,?)";
		  
		  pstmt2 = conn.prepareStatement(SQL);
		  pstmt2.setInt(1, Integer.parseInt(num));
		  pstmt2.setString(2, board.getTitle());
		  pstmt2.setString(3, board.getId());
		  pstmt2.setString(4, today);
		  pstmt2.setString(5, board.getContent());
		  
		  
		return pstmt2.executeUpdate(); //등록완료
		}
		catch (SQLException e) {
			e.getStackTrace();
		}
		return -1; //등록 실패
	}
	
	public String Reply_posts(String num) {
		String title = null;
		try {
			String SQL="select * from board_info where num = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(num));
			
			rs = pstmt.executeQuery();
			rs.next();
			
			title = rs.getString("title");
		}
		catch(Exception e) {
			e.getStackTrace();
		}
		return title;
	}
	public int Check_delete(String num) {
		String SQL = "UPDATE board_info SET visible = 0 WHERE num = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(num));
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
	
	public int Check_modify(String content , String title, String num ) {
		String SQL = "UPDATE board_info SET title = ?, content = ? WHERE num = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, Integer.parseInt(num));
			
			pstmt.executeUpdate();
			
			return 0;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
}

