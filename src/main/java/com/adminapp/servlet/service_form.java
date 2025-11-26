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
public class service_form extends HttpServlet {

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
            String name=request.getParameter("name");
           String email=request.getParameter("email");
           String phone=request.getParameter("phone");
           String subject=request.getParameter("subject");
           String message=request.getParameter("message");
           String email1="";
              try{
                  Connection con=new connect_db().getConnection();
                  PreparedStatement ps1=con.prepareStatement("insert into service_form(name,email,phone,message,subject) values(?,?,?,?,?)");
                      ps1.setString(1,name);
                      ps1.setString(2,email);
                      ps1.setString(3,phone);
                      ps1.setString(4,message);
                      ps1.setString(5,subject);
                      
                      int i=ps1.executeUpdate();
                      if(i>0){
                      String sub=subject;
                      String body="Hey!User<br>Greetings<br>Thankyou for contacting us.<br>Thankyou for your patience<br> We will contact you shortly<br> And resolve your query as soon as possible." ;
                          System.out.println(email);
                          System.out.println(sub);
                          System.out.println(body);
                      mailer.mailer.send(email,sub,body);
                      PreparedStatement ps2=con.prepareStatement("select * from admin_profile ");
                       ResultSet rs2=ps2.executeQuery();
                           
                           if(rs2.next()){
                            email1=rs2.getString("altemail");
                           }
                       String subject1="Regarding Service Query";
                          String body1="Hey!Admin.<br>Greetings<br>  New Query from "+email+" received.<br>Reply user as soon as possible. <br><br>Best Regards,<br>Team Shiva Teaching<br> ";
                          mailer.mailer.send(email1,subject1,body1);
                      out.println("<script type=\"text/javascript\">");
                      out.println("alert('successfully registered')");
                      out.println("location='index.jsp'");
                      out.println("</script>");
                        }
                      else{
                         out.println("<script type=\"text/javascript\">");
                      out.println("alert('unsuccessful')");
                      out.println("location='service_query.jsp'");
                      out.println("</script>");
                      }
                  }
              
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
