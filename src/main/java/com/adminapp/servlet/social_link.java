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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vikas upadhyay
 */
public class social_link extends HttpServlet {

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
            String id=request.getParameter("id");
            String facebook=request.getParameter("facebook");
           String google=request.getParameter("google");
           String instagram=request.getParameter("instagram");
           String youtube=request.getParameter("youtube");
           System.out.println(id);
           System.out.println(facebook);
           System.out.println(google);
           System.out.println(instagram);
              try{
                  Connection con=new connect_db().getConnection();
                  PreparedStatement ps1=con.prepareStatement("update location_link set facebook=?,google=?,instagram=?,youtube=? where id=?");
                      ps1.setString(1,facebook);
                      ps1.setString(2,google);
                      ps1.setString(3,instagram);
                      ps1.setString(4,youtube);
                      ps1.setString(5,id);
                      
                      int i=ps1.executeUpdate();
                      if(i>0){
                      out.println("<script type=\"text/javascript\">");
out.println("alert('successfully registered')");
out.println("location='admin/location_link.jsp'");
out.println("</script>");
                        }
                      else{
                         out.println("<script type=\"text/javascript\">");
out.println("alert('unsuccessful')");
out.println("location='admin/contacts.jsp'");
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
