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
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import static path.path.filepath;

/**
 *
 * @author vikas upadhyay
 */

public class register extends HttpServlet {

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
            int flag=1;
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String cpassword=request.getParameter("cpassword");
            String mobile=request.getParameter("phone");
            String email1="";
          
              try{
                  Connection con=new connect_db().getConnection();
                  if(password.equals(cpassword)){
                  PreparedStatement ps=con.prepareStatement("select email from user_register where email=?");
                  ps.setString(1,email);
                  ResultSet rs=ps.executeQuery();
                  if(rs.next())
                  {
                      if(rs.getString("email").equals(email))
                      {
                          
                          out.println("<script type=\"text/javascript\">");
out.println("alert('Email already registered')");
out.println("window.location.href='./signin.jsp'");
out.println("</script>");
                          flag=0;
                      }
                      
                  }
                  else if(flag==1)
                  {
                      PreparedStatement ps1=con.prepareStatement("insert into user_register(name,email,password,cpassword,mobile) values(?,?,?,?,?)");
                      ps1.setString(1,name);
                      ps1.setString(2, email);
                      ps1.setString(3, password);
                      ps1.setString(4, cpassword);
                     ps1.setString(5, mobile);
                              
                      int i=ps1.executeUpdate();
                      if(i>0){
                          String subject="Registration Successfull, Shiva Teaching";
                          String body="Hi,<br>Greetings!<br><br>Thank you for signing up with us.<br>Your new account has been setup and you can now login  using the details as given below: <br><br>Your UserName: <br>"+email+"<br><br>We are looking forward for better relations with you.<br><br> Best Regards,<br>Team Shiva Teaching<br>";
                          mailer.mailer.send(email,subject,body);
                           PreparedStatement ps2=con.prepareStatement("select * from admin_profile ");
                           ResultSet rs2=ps2.executeQuery();
                           
                           if(rs2.next()){
                            email1=rs2.getString("altemail");
                           }
                          String subject1="Regarding User Registration";
                          String body1="Hello Admin,<br>Greetings!<br><br>A new user has been registered.<br>Following are the details<br><b> Useremail:</b> "+email+"<br><b>Name:</b> "+name+ "<br><br>Thanks and Regards<br>Shiva Teaching";
                          mailer.mailer.send(email1,subject1,body1);
                          out.println("<script type=\"text/javascript\">");
out.println("alert('Successfully registered')");
out.println("window.location.href='./signin.jsp'");
out.println("</script>");
                        }
                      else{
                         out.println("<script type=\"text/javascript\">");
out.println("alert('Registration UnSuccessfully ')");
out.println("window.location.href='./signin.jsp'");
out.println("</script>");
                      }
                  }
                   }else{
                         out.println("<script type=\"text/javascript\">");
out.println("alert('password mismatch')");
out.println("window.location.href='./signup.jsp'");
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
