package serv;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UploadVacanciesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String date = request.getParameter("closingDate");

        boolean inserted = insertIntoDatabase(title, description, date);
        if (inserted) {
            writeToFile(title, description, date);
            RequestDispatcher disp = request.getRequestDispatcher("internship_outcome.jsp");
            disp.forward(request, response);
        } else {
            response.sendRedirect("vacancies.jsp");
        }
    }

    private boolean insertIntoDatabase(String title, String description, String date) {
        String url = "jdbc:derby://localhost:1527/internappdatabase";
        String user = "root";
        String dbPassword = "root";

        try {
            Connection connection = DriverManager.getConnection(url, user, dbPassword);
            String usersSql = "INSERT INTO internships_tbl(TITLE, DESCRIPTION, CLOSING_DATE) VALUES(?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(usersSql);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, date);

            int rows = ps.executeUpdate();
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(UploadVacanciesServlet.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    private void writeToFile(String title, String description, String date) {
        String filePath = "files\\internshipsFile.txt"; 

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write("Internship " + title);
            writer.newLine();
            writer.write("Description: " + description);
            writer.newLine();
            writer.write("Closing Date: " + date);
            writer.newLine();
            writer.write("-----------");
            writer.newLine();
        } catch (IOException ex) {
            Logger.getLogger(UploadVacanciesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
