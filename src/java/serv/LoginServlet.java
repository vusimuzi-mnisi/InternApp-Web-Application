package serv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String url = "jdbc:derby://localhost:1527/internappdatabase";
        String user = "root";
        String dbPassword = "root";

        try {
            Connection connection = DriverManager.getConnection(url, user, dbPassword);
            String usersSql = "SELECT * FROM users_tbl WHERE username= ? AND password= ?";
            PreparedStatement ps = connection.prepareStatement(usersSql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String role = fetchRoleFromDatabase(username);
                session.setAttribute("role", role);

                if ("admin".equals(role)) {
                    response.sendRedirect("admin_portal.jsp"); // Redirect to admin dashboard
                } else if ("intern".equals(role)) {
                    session.setAttribute("username", username);
                    response.sendRedirect("intern_portal.jsp"); // Redirect to intern dashboard
                }
            } else {
                request.setAttribute("loginError", "Invalid username or password");
                RequestDispatcher disp = request.getRequestDispatcher("login.jsp");
                disp.forward(request, response);
            }
            rs.close();
            ps.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("connection_error.jsp");
        }
    }

    public String fetchRoleFromDatabase(String username) {
        String role = null;

        String url = "jdbc:derby://localhost:1527/internappdatabase";
        String user = "root";
        String dbPassword = "root";

        try (Connection conn = DriverManager.getConnection(url, user, dbPassword);
             PreparedStatement stmt = conn.prepareStatement("SELECT role FROM users_tbl WHERE username = ?")) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    role = rs.getString("role");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return role;
    }
}
