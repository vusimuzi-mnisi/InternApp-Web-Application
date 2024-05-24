/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package serv;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
public class ApplyServlet extends HttpServlet {
 
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String internUsername = (String) request.getSession().getAttribute("username"); // Assumes username is stored in session
        int internshipId = Integer.parseInt(request.getParameter("internshipId"));
        Date applicationDate = new Date(System.currentTimeMillis());

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Connect to the database
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/internappdatabase", "root", "root");

            // Insert the application into the database
            String sql = "INSERT INTO applications_tbl (internship_id, intern_username, application_date) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, internshipId);
            preparedStatement.setString(2, internUsername);
            preparedStatement.setDate(3, applicationDate);

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("application_success.jsp"); // Redirect to a success page
            } else {
                response.getWriter().println("Failed to apply for the internship.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred while processing your application. Please try again later.");
        } finally {
            // Clean up resources
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
