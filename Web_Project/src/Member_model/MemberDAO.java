package Member_model;

import java.sql.*;

import org.eclipse.jdt.internal.compiler.ast.MemberValuePair;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//기본 생성자
	public MemberDAO() throws ClassNotFoundException {
	
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
	catch (SQLException e) {
		e.getStackTrace();}
	}
	
	//로그인 검사 함수
	public int Check_login(String id, String pwd) {
		//id로 부터 pwd 검사
		String SQL = "select pwd from member_info where id = ?";
		String pass ="";
		try {
			//SQL문 생성
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			
			//SQL문 결과 저장
			rs = pstmt.executeQuery();
			
			if (rs.next()) //입력 아이디가 있을경우
			{
				pass = rs.getString("pwd"); //비밀번호 가져오기
				
				if(pass.equals(pwd)) //매개변수 pwd비교
					return 1; //로그인 성공
				else
					return 0; //로그인 실패 (비밀번호가 다름)
			}
			else
				return -1; //로그인 실패 (아이다가 없음)
		}
		
		catch(SQLException e) {
			e.getStackTrace();
		}
		return -2; //db오류
	}
	//자바빈으로 만든 객체를 넘겨받아 db에 저장
	public int Check_join(MemberBean member) {
		
			
			String SQL = "insert into member_info (id,pwd,email,name) values (?,?,?,?)";
				//SQL문 생성
			try {
				
				pstmt= conn.prepareStatement(SQL);
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPwd());
				pstmt.setString(3, member.getEmail());
				pstmt.setString(4, member.getName());
				
				//SQL update실행
				pstmt.executeUpdate();
				
				return 0;
				}
				catch (SQLException e) {
					e.getStackTrace();
				}
		return -1;
	}
	
	public int insert_key(String key,String id) {
		
		String SQL="update member_info set member_key = ? where id =?";
		
		try {
			
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, key);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
			return 0;
		}
		catch(SQLException e) {
			e.getStackTrace();
		}
		return -1;
	}
	
	public String get_key(String id) {
		
		String SQL="select member_key from member_info where id=?";
		String key="";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			key=rs.getString("member_key");
			}
		}
		
		catch(SQLException e){
			e.getStackTrace();
		}
		return key;
	}
	
	public int update_pwd (String pwd,String id) {
		
	
		String SQL="update member_info set pwd = ? where id =?";
	
		try {
		
		
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
		
			pstmt.executeUpdate();
			return 0;
		}
		catch(SQLException e) {
			e.getStackTrace();
		}
		return -1;
	
	}
	
	public int delete_key (String id) {
		String SQL="update member_info set member_key = null where id =?";
		
		try {
		
		
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
		
			pstmt.executeUpdate();
			return 0;
		}
		catch(SQLException e) {
			e.getStackTrace();
		}
		return -1;
	}
}
