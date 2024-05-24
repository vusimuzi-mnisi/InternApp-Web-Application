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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author VUSI
 */
public class EditPersonalDetailsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int id =Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");

        Connection conn = null;
        PreparedStatement pstmt = null;

        String jdbcUrl = "jdbc:derby://localhost:1527/Internappdatabase";
        String username = "root";
        String password = "root";

        try {
            conn = DriverManager.getConnection(jdbcUrl, username, password);
            String sql = "UPDATE applicants_tbl SET name=?, surname=?, email=?, gender=? WHERE id=?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, surname);
            pstmt.setString(3, email);
            pstmt.setString(4, gender);
            pstmt.setInt(5, id);

            // Execute the query
            pstmt.executeUpdate();

            // Close the PreparedStatement
            pstmt.close();

            // Redirect the user to a success page
            response.sendRedirect("edit_details_success.jsp");
        } catch (SQLException e) {
            // Handle any errors
            e.printStackTrace();
            // Redirect the user to an error page
            response.sendRedirect("edit_details_error.jsp");
        } finally {
            // Close the connection
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
    



