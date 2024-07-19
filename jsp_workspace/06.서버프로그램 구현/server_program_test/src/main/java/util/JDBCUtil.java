package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * database 연결 작업 및 자원해제 담당 class
 */
public class JDBCUtil {
	
	/**
	 * 새로운 Connection 객체 생성 및 반환
	 */
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/digital_jsp",
				"digital",
				"1234"
			);
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Class를 찾을 수 없음");
		} catch (SQLException e) {
			System.out.println("연결 요청 정보 오류 : " + e.getMessage());
		}
		return conn;
	} // end getConnection()
	
	public static void close(AutoCloseable... closer) {
		for(AutoCloseable c : closer) {
			if(closer != null) {
				try {
					c.close();
				} catch (Exception e) {}
			}
		} // end for
	} // end close
	
}