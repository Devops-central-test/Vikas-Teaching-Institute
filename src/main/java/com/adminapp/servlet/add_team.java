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
public class add_team extends HttpServlet {

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
            String name=request.getParameter("title");
            String desc=request.getParameter("des");
            Part filepart=request.getPart("image");
            String email=request.getParameter("email");
            String na=filepart.getSubmittedFileName();
            String FileName=na;
           int flag=1;
            String photo;
            File file=new File(filepath());
           if(!file.exists())
           {
               file.mkdir();
           }
           
            try{
                  Connection con=new connect_db().getConnection();
                  PreparedStatement ps21=con.prepareStatement("select email from add_team where email=?");
               ps21.setString(1,email);
               ResultSet rs21=ps21.executeQuery();
                    if(rs21.next())
                    {
                     if(rs21.getString("email").equals(email))
                     {
                         out.println("<script type=\"text/javascript\">");
out.println("alert('Email Already Exist')");
out.println("window.location.href='admin/View_team.jsp'");
out.println("</script>");
flag=0;
                     }
                    }
                    else if(flag==1)
                    {  
                  
                  photo=filepath()+File.separator+FileName;
                  filepart.write(photo);
                  PreparedStatement ps1=con.prepareStatement("insert into add_team(name,designation,image,email) values(?,?,?,?)");
                  ps1.setString(1,name);
                  ps1.setString(2, desc);
                  ps1.setString(3, FileName);
                   ps1.setString(4, email);
                      int i=ps1.executeUpdate();
                      if(i>0){
                          out.println("<script type=\"text/javascript\">");
out.println("alert('Team Successfully Upload')");
out.println("window.location.href='admin/View_team.jsp'");
out.println("</script>");
                        }
                      else{
                         out.println("<script type=\"text/javascript\">");
out.println("alert('Team Not Upload')");
out.println("window.location.href='admin/Add_team.jsp'");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(add_team.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(add_team.class.getName()).log(Level.SEVERE, null, ex);
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
