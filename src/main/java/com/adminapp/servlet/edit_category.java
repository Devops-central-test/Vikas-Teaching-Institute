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
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vikas upadhyay
 */
public class edit_category extends HttpServlet {

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
            String id= request.getParameter("id");
           String category=request.getParameter("category");
           String status=request.getParameter("status");
            System.out.println(id);
            System.out.println(category);
            System.out.println(status);
           try{
               Connection con=new connect_db().getConnection();
               PreparedStatement ps=con.prepareStatement("update add_category set category=?,status=? where id=?");
               ps.setString(1, category);
               ps.setString(2, status);
               ps.setString(3, id);
               int i=ps.executeUpdate();
               
               PreparedStatement ps2=con.prepareStatement("update courses set status=? where cid=?");
               ps2.setString(1,status);
               ps2.setString(2, id);
               int k=ps2.executeUpdate();
               System.out.println(i);
               if(i>0||k>0){
                  out.println("<script type=\"text/javascript\">");
out.println("alert('Category Successfully edited')");
out.println("window.location.href='admin/view_Category.jsp'");
out.println("</script>");
               }
               else{
                   out.println("<script type=\"text/javascript\">");
out.println("alert('Category Not edited')");
out.println("window.location.href='admin/view_Category.jsp'");
out.println("</script>");
              
               }
           }catch(SQLException e){
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
