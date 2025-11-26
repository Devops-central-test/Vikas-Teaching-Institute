/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.connect_db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vikas upadhyay
 */
public class change_password extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String password=request.getParameter("name");
            String new_password=request.getParameter("password");
            String repeat_password=request.getParameter("password2");
            String email=request.getParameter("email");
             try
            {
                Connection con=new connect_db().getConnection();
                PreparedStatement ps1=con.prepareStatement("select * from admin_profile ");
                
                ResultSet rs=ps1.executeQuery();
                if(rs.next()){
                if(rs.getString("password").equals(password)) {
                PreparedStatement ps= con.prepareStatement("update admin_profile set password=?");
                ps.setString(1,new_password);
                
                int i=ps.executeUpdate();
                if(i>0)
                {
                     String sub="Change Password ";
                   String body="Hello!Admin<br>Greetings<br><br>Your password has been changed!<br> This email confirms you that your password has been changed<br>Happy secure browsing!<br><br>Best Regards,<br>Team Shiva Teaching<br>";
                            
                    mailer.mailer.send(email,sub,body);
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Password Successfully Changed')");
                 out.println("window.location.href='admin/logout.jsp'");
                 out.println("</script>");   
                }
                else
                {
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Alert!Password Reset Failed ')");
                 out.println("window.location.href='admin/change_Password.jsp'");
                 out.println("</script>");
                }
            }else{out.println("<script type=\"text/javascript\">");
                 out.println("alert('Alert!current password is Incorrect')");
                 out.println("window.location.href='admin/change_Password.jsp'");
                 out.println("</script>");
                }
                }}
            catch(Exception e)
            {
                out.println(e);
            }
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(change_password.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(change_password.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
