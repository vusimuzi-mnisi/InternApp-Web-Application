package serv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditInternshipServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        Integer id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String closingDate = request.getParameter("closing_date");

        boolean isSuccess = editInternship(id, title, description, closingDate);

        if (isSuccess) {
            response.sendRedirect("EditInternship_success.jsp");
        } else {
            response.sendRedirect("EditInternship_error.jsp");
        }
    }

    private boolean editInternship(Integer id, String title, String description, String closingDate) {
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            String url = "jdbc:derby://localhost:1527/internappdatabase";
            String user = "root";
            String dbPassword = "root";

            connection = DriverManager.getConnection(url, user, dbPassword);
            String sql = "UPDATE INTERNSHIPS_TBL SET title=?, description=?, closing_date=? WHERE id=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, closingDate);
            ps.setInt(4, id);

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
