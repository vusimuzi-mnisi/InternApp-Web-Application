/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package serv;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Applicant;

/**
 *
 * @author VUSI
 */
public class AddPersonalDetailsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        
        Applicant applicant = new Applicant(name, surname, email, gender);
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        String jdbcUrl = "jdbc:derby://localhost:1527/Internappdatabase";
        String username = "root";
        String password = "root";
        
        try {
            conn = DriverManager.getConnection(jdbcUrl, username, password);
            String sql = "INSERT INTO applicants_tbl (name, surname, email, gender) VALUES (?, ?, ?, ?)";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, surname);
            pstmt.setString(3, email);
            pstmt.setString(4, gender);
            pstmt.executeUpdate();
            
            pstmt.close();
            
            response.sendRedirect("add_details_success.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("add_details_error.jsp");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}