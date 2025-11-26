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
public class forgot_user_pass extends HttpServlet {

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
            String email=request.getParameter("email");
            String altemail;
             String pass="";
            try
            {
                Connection con= new connect_db().getConnection();
                PreparedStatement ps= con.prepareStatement("select * from user_register where email=?");
                ps.setString(1, email);
                ResultSet rs=ps.executeQuery();
                 if(rs.next())
                {
                    String sub="Password for secure access";
                    pass=rs.getString("password");
                   String body=" Hi,<br>Greetings!<br><br>You are just a step away from accessing your account<br>We are sharing a Password to access your account. <br> This is to ensure that only you have access to your account.<br><br><b>Your Password: </b>"+pass+"<br><br>Best Regards,<br>Team Shiva Teaching<br>";
                   mailer.mailer.send(email,sub,body); 
                   out.println("<script type=\"text/javascript\">");
                      out.println("alert('Thank you! Check your mail to reset password!')");
                     out.println("window.location.href='signin.jsp'");
                      out.println("</script>");
                }
                else
                {
                    out.println("alert('Error! Try again to reset password!')");
                     out.println("window.location.href='signin.jsp'");
                      out.println("</script>");
                }
            }
            catch(Exception e)
            {out.println(e);}
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
