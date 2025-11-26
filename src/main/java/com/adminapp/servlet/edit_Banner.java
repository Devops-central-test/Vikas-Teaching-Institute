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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import static path.path.filepath;

/**
 *
 * @author vikas upadhyay
 */
@MultipartConfig(
fileSizeThreshold = 1024*1024*2, 
maxFileSize = 1024*1024*10,
maxRequestSize = 1024*1024*50
)
public class edit_Banner extends HttpServlet {

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
          // String title=request.getParameter("title");
           Part filepart=request.getPart("image");
           String status=request.getParameter("status");
           String na=filepart.getSubmittedFileName();
           System.out.println(status);
         //  System.out.println(title);
           System.out.println(id);
           String photo;
           String fileName=na;
           
             String temp;          
           try{
             Connection con=new connect_db().getConnection();
             if(filepart.getSize()>0){
             photo=filepath()+File.separator+fileName;
             filepart.write(photo);
            PreparedStatement ps=con.prepareStatement("update add_banner set title=?,status=? where id=?");
            ps.setString(1, fileName);
            ps.setString(2, status);
            ps.setString(3,id);
               int i=ps.executeUpdate();
               System.out.println(i);
               if(i>0)
               {
                  out.println("<script type=\"text/javascript\">");
out.println("alert('Banner Successfully edited')");
out.println("window.location.href='admin/view_Banner.jsp'");
out.println("</script>");
                 }
               else
               {
                  out.println("<script type=\"text/javascript\">");
out.println("alert('Banner Not edited')");
out.println("window.location.href='admin/Add_Banner.jsp'");
out.println("</script>");
              
               }}else{
                 
            PreparedStatement ps=con.prepareStatement("update add_banner set status=? where id=?");
            ps.setString(1, status);
            ps.setString(2,id);
               int i=ps.executeUpdate();
               System.out.println(i);
               if(i>0)
               {
                  out.println("<script type=\"text/javascript\">");
out.println("alert('Banner Successfully edited')");
out.println("window.location.href='admin/view_Banner.jsp'");
out.println("</script>");
                 }
               else
               {
                  out.println("<script type=\"text/javascript\">");
out.println("alert('Banner Not edited')");
out.println("window.location.href='admin/Add_Banner.jsp'");
out.println("</script>");
              
               }
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
