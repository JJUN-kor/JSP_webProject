package SQL_DAO;

import java.sql.*;

public class DB_DAO {
		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		//기본 생성자
		public DB_DAO() throws ClassNotFoundException {
		
		try {
		//연결 정보들
		String URL = "jdbc:mysql://localhost:3306/MyDB";
		String dbID = "university";
		String dbPWD = "knu2019!!";
		
		//연결 드라이버
		Class.forName("com.mysql.jdbc.Driver");
		
		//DBMS연결
		conn = DriverManager.getConnection(URL, dbID, dbPWD);}
		
		//DB연결 실패시 예외 출력
		catch (SQLException e) {
			e.getStackTrace();}
		}
		
		public ResultSet get_Result(String SQL) {
			try {
				//SQL문 생성
				pstmt = conn.prepareStatement(SQL);
				
				//SQL문 결과 받아오기
				rs = pstmt.executeQuery();
			}
			
			catch(SQLException e) {
				e.getStackTrace();
			}
			return rs;
			
		}
	
}
