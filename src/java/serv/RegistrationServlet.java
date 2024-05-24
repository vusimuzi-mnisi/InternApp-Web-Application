/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package serv;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
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
import model.User;
 
public class RegistrationServlet extends HttpServlet {
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        
        String username = request.getParameter("username");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        
        if(password.equals(password2)){
            User user = new User(username, password, role);
        
            if(UserExist(username,response)){
                request.setAttribute("errorMessage"," username already exists. ");
                RequestDispatcher disp=request.getRequestDispatcher("registerOutcome.jsp");
                disp.forward(request, response);
            }
            else
            {
                writeToFile(username, role);
                boolean isRegistered= registerUser(username, password,role);
        
                if(isRegistered){
                    
                    
                    session.setAttribute("LoggedIn", true);
                    
                    
                    RequestDispatcher disp=request.getRequestDispatcher("register_success.jsp");
                    disp.forward(request, response);
              
                }
                else
                {
                    request.setAttribute("loginError","Invalid username or Password");
                    RequestDispatcher disp=request.getRequestDispatcher("registerOutcome.jsp");
                    disp.forward(request, response);
            
                }
            }
        }
        else{
            response.sendRedirect("registrationError.jsp");
        }
        
        
    }
    
    private boolean UserExist(String username,HttpServletResponse response) throws IOException{
        String url="jdbc:derby://localhost:1527/internappdatabase";
        String user="root";
        String dbPassword="root" ;
   
        try {
            Connection connection=DriverManager.getConnection(url, user, dbPassword);
            String usersSql="SELECT COUNT(*) FROM users_tbl WHERE username= ?";
     
            PreparedStatement ps=connection.prepareStatement(usersSql);
            ps.setString(1, username);
        
            try(ResultSet rs=ps.executeQuery()){
                if(rs.next() && rs.getInt(1) > 0){
                    return true; 
                } 
                else 
                {
                return false; 
                }
            }
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
            response.sendRedirect("connection_error.jsp");
        return false; 
    }
}

    private boolean registerUser(String username,String password,String role){
        
        
        String url="jdbc:derby://localhost:1527/internappdatabase";
        String user="root";
        String dbPassword="root" ;
   
        try {
            Connection connection=DriverManager.getConnection(url, user, dbPassword);
            String usersSql="INSERT INTO users_tbl(USERNAME,PASSWORD,ROLE) VALUES(?,?,?)";
         
            
            PreparedStatement ps=connection.prepareStatement(usersSql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);
           int rows=ps.executeUpdate();
            
          return true;

            
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    private void writeToFile(String username, String role) {
        String filePath = "E:\\a\\InternAppProject\\InternApp\\web\\files\\usersInterns.txt"; 

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write("Username: " + username);
            writer.newLine();
            writer.write("Role: " + role);
            writer.newLine();
            
            writer.write("-----------");
            writer.newLine();
        } catch (IOException ex) {
            Logger.getLogger(UploadVacanciesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
   
}
