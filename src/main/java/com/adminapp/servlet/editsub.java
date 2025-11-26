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
public class editsub extends HttpServlet {

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
           String sname=request.getParameter("title");
           String email=request.getParameter("email");
           String status=request.getParameter("status");
           String spassword=request.getParameter("password");
           Part filepart=request.getPart("image");
            String na=filepart.getSubmittedFileName();
           String photo;
           String fileName=na;
           
           
           System.out.println(status);
           System.out.println(sname);
           System.out.println(id);
           try{
                
           Connection con=new connect_db().getConnection();
           if(filepart.getSize()>0){
               photo=filepath()+File.separator+fileName;
                  filepart.write(photo);
            PreparedStatement ps=con.prepareStatement("update add_subadmin set sname=?,spassword=?,status=?,email=?,image=? where id=?");
            ps.setString(1, sname);
            ps.setString(2, spassword);
            ps.setString(3,status);
            ps.setString(4,email);
            ps.setString(5,fileName);
            ps.setString(6,id);
            
               int i=ps.executeUpdate();
               System.out.println(i);
               if(i>0)
               {
                  String sub="Sub-Admin Registration Password";
                      String body=spassword ;
                      mailer.mailer.send(email,sub,body);
                   out.println("<script type=\"text/javascript\">");
out.println("alert('Data Successfully Updated')");
out.println("window.location.href='admin/view_subadmin.jsp'");
out.println("</script>");
                 }
               else
               {
                  out.println("<script type=\"text/javascript\">");
out.println("alert('Data not Updated')");
out.println("window.location.href='admin/view_subadmin.jsp'");
out.println("</script>");
              
               }}else{
               PreparedStatement ps=con.prepareStatement("update add_subadmin set sname=?,spassword=?,status=?,email=? where id=?");
            ps.setString(1, sname);
            ps.setString(2, spassword);
            ps.setString(3,status);
            ps.setString(4,email);
          
            ps.setString(5,id);
            
               int i=ps.executeUpdate();
               System.out.println(i);
               if(i>0)
               {
                   String sub="Sub-Admin Registration Password";
                      String body=spassword ;
                      mailer.mailer.send(email,sub,body);
                  out.println("<script type=\"text/javascript\">");
out.println("alert('Data Successfully Updated')");
out.println("window.location.href='admin/view_subadmin.jsp'");
out.println("</script>");
                 }
               else
               {
                  out.println("<script type=\"text/javascript\">");
out.println("alert('Data not Updated')");
out.println("window.location.href='admin/view_subadmin.jsp'");
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
