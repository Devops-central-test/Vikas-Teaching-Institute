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
public class edit_profile extends HttpServlet {

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
           String name=request.getParameter("name");
           Part filepart=request.getPart("file");
           String email=request.getParameter("email");
           String cemail=request.getParameter("confirm_email");
           String website=request.getParameter("website");
           String designation=request.getParameter("occupation");
           String mobile=request.getParameter("phone");
           String name1=filepart.getSubmittedFileName();
           String photo;
           File file=new File(filepath());
           if(!file.exists())
           {
               file.mkdir();
           }
           String FileName=name1;
           try{
               Connection con=new connect_db().getConnection();
               if(filepart.getSize()>0){
               photo=filepath()+File.separator+FileName;
               filepart.write(photo);
               if(email.equals(cemail)){
               PreparedStatement ps=con.prepareStatement("update admin_profile set name=?,altemail=?,image=?,website=?,designation=?,mobile=? where id=?");
               ps.setString(1,name);
               ps.setString(2, email);
               ps.setString(3,FileName);
               ps.setString(4,website);
               ps.setString(5,designation);
               ps.setString(6,mobile);
               ps.setString(7,id);
               
               int i=ps.executeUpdate();
               if(i>0)
               {
                   out.println("<script type=\"text/javascript\">");
out.println("alert('Profile Successfully Updated')");
out.println("location='admin/dashboard.jsp'");
out.println("</script>");
                 }
               else
               {
                    out.println("<script type=\"text/javascript\">");
out.println("alert('Profile Not Updated')");
out.println("location='admin/edit_profile.jsp'");
out.println("</script>");
               }
           
           }else{
                         out.println("<script type=\"text/javascript\">");
out.println("alert('Email Mismatch')");
out.println("window.location.href='admin/edit_profile.jsp'");
out.println("</script>");  
                            }
               }else{if(email.equals(cemail)){
               PreparedStatement ps=con.prepareStatement("update admin_profile set name=?,altemail=?,website=?,designation=?,mobile=? where id=?");
               ps.setString(1,name);
               ps.setString(2, email);
              
               ps.setString(3,website);
               ps.setString(4,designation);
               ps.setString(5,mobile);
               ps.setString(6,id);
               
               int i=ps.executeUpdate();
               if(i>0)
               {
                   out.println("<script type=\"text/javascript\">");
out.println("alert('Profile Successfully Updated')");
out.println("location='admin/dashboard.jsp'");
out.println("</script>");
                 }
               else
               {
                    out.println("<script type=\"text/javascript\">");
out.println("alert('Profile Not Updated')");
out.println("location='admin/edit_profile.jsp'");
out.println("</script>");
               }
           
           }}
               
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
