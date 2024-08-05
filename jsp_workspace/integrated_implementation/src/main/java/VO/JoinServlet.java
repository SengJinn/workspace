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

@WebServlet("/join")
public class JoinServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public JoinServlet() {
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
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        try {
            String id = request.getParameter("id");
            String pass = request.getParameter("pass");
            String name = request.getParameter("name");
            String addr = request.getParameter("addr");
            String phone = request.getParameter("phone");

            MemberVO member = new MemberVO(id, pass, name, addr, phone);
            member.setId(id);
            member.setPass(pass);
            member.setName(name);
            member.setAddr(addr);
            member.setPhone(phone);

            System.out.println("회원 정보:");
            System.out.println("아이디: " + member.getId());
            System.out.println("비밀번호: " + member.getPass());
            System.out.println("이름: " + member.getName());
            System.out.println("주소: " + member.getAddr());
            System.out.println("전화번호: " + member.getPhone());           

            
            setConnection();
    		
    		// 중복 아이디 확인
    		String sql = "SELECT * FROM tbl_member WHERE id = ?";
    		try {
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setString(1, member.getId());
    			rs = pstmt.executeQuery();
    			
    			if(rs.next()) {
    				response.setContentType("text/html;charset=utf-8");
    				PrintWriter out = response.getWriter();
    				out.println("<script>");
    				out.println("alert('중복 아이디입니다.');");
    				out.println("history.go(-1);");
    				out.println("</script>");
    			}


            // 회원 정보 삽입 쿼리
            sql = "INSERT INTO tbl_member (id, pass, name, addr, phone) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, member.getId());
                pstmt.setString(2, member.getPass());
                pstmt.setString(3, member.getName());
                pstmt.setString(4, member.getAddr());
                pstmt.setString(5, member.getPhone());
                pstmt.executeUpdate();
            }

            // 성공 메시지
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입이 완료되었습니다.');");
			out.println("location.href='main.jsp';");
			out.println("</script>");

        } catch (SQLException e) {
            e.printStackTrace();

        }
              
            
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}









