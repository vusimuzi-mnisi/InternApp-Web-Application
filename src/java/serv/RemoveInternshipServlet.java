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

/**
 *
 * @author Student
 */
public class RemoveInternshipServlet extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String title = request.getParameter("title");

        boolean isSuccess = removeInternship(title);

        if (isSuccess) {
            response.sendRedirect("RemoveInternship_success.jsp");
        } 
        else {
            response.sendRedirect("RemoveInternship_error.jsp");
        }
    }

    private boolean removeInternship(String title) {
        try {
            String url = "jdbc:derby://localhost:1527/internappdatabase";
            String user = "root";
            String dbPassword = "root";

            Connection connection = DriverManager.getConnection(url, user, dbPassword);
            String sql = "DELETE FROM INTERNSHIPS_TBL WHERE title=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    
}

