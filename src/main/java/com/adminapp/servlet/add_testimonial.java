/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.connect_db;
import java.io.File;
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
import javax.servlet.http.Part;
import static path.path.filepath;

/**
 *
 * @author vikas upadhyay
 */
public class add_testimonial extends HttpServlet {

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
           String name=request.getParameter("name");
           HttpSession session=request.getSession(true);
            String email=session.getAttribute("email").toString();
           String comment=request.getParameter("comment");
          String email1="";
            System.out.println(name);
            System.out.println(email);
            System.out.println(comment);
            
            String mail=null;
              try{
                  Connection con=new connect_db().getConnection();
                  PreparedStatement ps4=con.prepareStatement("select * from testmonial");
                  ResultSet rs4=ps4.executeQuery();
                  while(rs4.next()){
                      mail=rs4.getString("email");
                  }
                  System.out.println(mail);
                  if(email.equals(mail)) {   
                  String status="Inactive";
                  PreparedStatement ps=con.prepareStatement("update testmonial set title=?,content=?,status=? where email=?");
                  ps.setString(1,name);                 
                  ps.setString(2,comment);
                  ps.setString(3,status);
                  ps.setString(4,email);
                  
                 
                  int i=ps.executeUpdate();
                  
                      if(i>0){
                     PreparedStatement ps22=con.prepareStatement("select * from admin_profile ");
                       ResultSet rs22=ps22.executeQuery();
                           
                           if(rs22.next()){
                            email1=rs22.getString("altemail");
                           }
                       String subject1="Regarding Course Booking";
                          String body1=" Hello!Admin.<br><br> User  "+email+"  updated their feedback.<br><br>Best Regards,<br>Team Shiva Teaching<br>";
                          mailer.mailer.send(email1,subject1,body1);
                            
                          out.println("<script type=\"text/javascript\">");
out.println("alert('Testimonial added')");
out.println("window.location.href='./testimonial.jsp'");
out.println("</script>");
                        }
                      else{
                         out.println("<script type=\"text/javascript\">");
out.println("alert('Addition Failed ')");
out.println("window.location.href='./testimonial.jsp'");
out.println("</script>");
                      }
              }else {
                     PreparedStatement ps=con.prepareStatement("insert into testmonial(title,email,content) values(?,?,?)");
                  ps.setString(1,name);                 
                  ps.setString(2,email);
                  ps.setString(3,comment);
                  
                  
                 
                  int i=ps.executeUpdate();
                  
                      if(i>0){
                          PreparedStatement ps22=con.prepareStatement("select * from admin_profile ");
                       ResultSet rs22=ps22.executeQuery();
                           
                           if(rs22.next()){
                            email1=rs22.getString("altemail");
                           }
                       String subject1="Regarding Course Booking";
                          String body1=" Hello!Admin.<br><br> User  "+email+"  entered his feedback.<br><br>Best Regards,<br>Team Shiva Teaching<br>";
                          mailer.mailer.send(email1,subject1,body1);
                          out.println("<script type=\"text/javascript\">");
out.println("alert('Testimonial Added')");
out.println("window.location.href='./testimonial.jsp'");
out.println("</script>");
                        }
                      else{
                         out.println("<script type=\"text/javascript\">");
out.println("alert('Addition failed ')");
out.println("window.location.href='./testimonial.jsp'");
out.println("</script>");
                      }  
                  }}
                  catch(Exception e)
                          {
                          System.out.println(e);
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
            Logger.getLogger(add_testimonial.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(add_testimonial.class.getName()).log(Level.SEVERE, null, ex);
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
