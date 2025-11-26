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
public class editpin extends HttpServlet {

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
            String id= request.getParameter("id");
           String pincode=request.getParameter("pincode");
           String city=request.getParameter("city");
           int flag=1;
           try{
               Connection con=new connect_db().getConnection();
               PreparedStatement ps1=con.prepareStatement("select * from pincode where pincode=?");
           ps1.setString(1, pincode);
           ResultSet rs1=ps1.executeQuery();
               if(rs1.next())
               {
                   if(rs1.getString("pincode").equals(pincode))
                   {
                        out.println("<script type=\"text/javascript\">");
out.println("alert('pincode already exist')");
out.println("window.location.href='admin/view_pincode.jsp'");
out.println("</script>");
                       flag=0;
                      
                   }
               }
               else if(flag==1)
               {
               PreparedStatement ps=con.prepareStatement("update pincode set pincode=?,city=? where id=?");
               ps.setString(1, pincode);
               ps.setString(2, city);
               ps.setString(3, id);
               int i=ps.executeUpdate();
               System.out.println(i);
               if(i>0){
                   out.println("<script type=\"text/javascript\">");
out.println("alert('data Successfully Updated')");
out.println("window.location.href='admin/view_pincode.jsp'");
out.println("</script>");
               }
               else{
                  out.println("<script type=\"text/javascript\">");
out.println("alert('data Not Updated')");
out.println("window.location.href='admin/add_pincode.jsp'");
out.println("</script>");
               }
           }}catch(SQLException e){
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
            Logger.getLogger(editpin.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editpin.class.getName()).log(Level.SEVERE, null, ex);
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
