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
import javax.servlet.http.HttpSession;

/**
 *
 * @author vikas upadhyay
 */
public class booking_status_user extends HttpServlet {

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
            String id=request.getParameter("id");
            HttpSession session=request.getSession();
            String email=session.getAttribute("email").toString();
            String email1="";
            String status="cancel";
            try{
               Connection con=new connect_db().getConnection();
               PreparedStatement ps1=con.prepareStatement("update course_register set status=? where id=?");
                ps1.setString(1, status);
                ps1.setString(2,id);
                int i=ps1.executeUpdate();
               if(i>0)
               {
                   PreparedStatement ps2=con.prepareStatement("select * from admin_profile ");
                       ResultSet rs2=ps2.executeQuery();
                           
                           if(rs2.next()){
                            email1=rs2.getString("altemail");
                           }
                      String subject1="Regarding Course Booking";
                          String body1="Hello!Admin.<br>Greetings<br><br>Course  from "+email+" has been cancelled.<br><br>Best Regards,<br>Team Shiva Teaching<br>";
                          mailer.mailer.send(email1,subject1,body1);
                           String subject="Regarding Course Booking";
                          String body="Hello!User.<br>Greetings<br><br>You have cancelled your course booking .<br><br>Best Regards,<br>Team Shiva Teaching<br>";
                          mailer.mailer.send(email,subject,body);
               out.println("<script type=\"text/javascript\">");
               out.println("alert('Status Changed')");
               out.println("window.location.href='./booking.jsp'");
               out.println("</script>");
            }
               else{
                  out.println("<script type=\"text/javascript\">");
               out.println("alert('Status Unchanged')");
               out.println("window.location.href='./booking.jsp'");
               out.println("</script>");  
               }
        }catch(Exception e){
                System.out.println(e);
        }
        }}

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
            Logger.getLogger(booking_status_user.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(booking_status_user.class.getName()).log(Level.SEVERE, null, ex);
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
