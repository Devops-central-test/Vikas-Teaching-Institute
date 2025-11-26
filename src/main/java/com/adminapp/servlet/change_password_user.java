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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vikas upadhyay
 */
public class change_password_user extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String current_password=request.getParameter("current");
            String new_password=request.getParameter("new");
            String repeat_password=request.getParameter("confirm");
            String email=request.getParameter("email");
            if(new_password.equals(repeat_password))
            {
              try
            {
                Connection con= new connect_db().getConnection();
                PreparedStatement ps=con.prepareStatement("select * from user_register where email=? ");
                ps.setString(1, email);
                ResultSet rs=ps.executeQuery();
                if(rs.next()){
                if(rs.getString("password").equals(current_password)){
                PreparedStatement ps1=con.prepareStatement("update user_register set password=?,cpassword=? where email=?");
                ps1.setString(1,new_password);
                ps1.setString(2,new_password);
                ps1.setString(3, email);
                int i=ps1.executeUpdate();
                if(i>0)
                {
                    String sub="Change Password ";
                   String body="Hello!User<br>Greetings<br><br>Your password has been changed!<br> This email confirms you that your password has been changed<br>Happy secure browsing!<br><br>Best Regards,<br>Team Shiva Teaching<br>";
                          mailer.mailer.send(email,sub,body); 
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Password Successfully Changed')");
                 out.println("window.location.href='logout.jsp'");
                 out.println("</script>");   
                }
                else
                {
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Alert! password not updated ')");
                 out.println("window.location.href='logout.jsp'");
                 out.println("</script>");
                }
            }}}
            catch(Exception e)
            {
                out.println(e);
            }
        }out.println("<script type=\"text/javascript\">");
                 out.println("alert('New password and Confirm password mismatch')");
                 out.println("window.location.href='change_password.jsp'");
                 out.println("</script>"); 
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
        processRequest(request, response);
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
        processRequest(request, response);
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
