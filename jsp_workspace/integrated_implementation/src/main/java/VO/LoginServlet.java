package VO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	public void setConnection() {
		try {
			// DriverClass load
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/digital_jsp",
				"digital",
				"1234"
			);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String name = "";
    MemberVO member = new MemberVO(id, pass, name);
    member.setId(id);
    member.setPass(pass);
    
    setConnection();
	String sql = "SELECT * FROM tbl_member WHERE id = ? AND pass = ?";
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,pass);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
            System.out.println("회원 정보:");
            System.out.println("아이디: " + id);
            System.out.println("비밀번호: " + pass);

    		if(member != null) {
    			name = rs.getString("name");
    			member.setName(name);
    	
    			HttpSession session = request.getSession();
    			session.setAttribute("member", member);}
    		
    		 response.sendRedirect("main.jsp");
    			
			} else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('일치하는 사용자를 찾을 수 없습니다.');");
				out.println("location.href='login.jsp';");
				out.println("</script>");
			}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
}
	