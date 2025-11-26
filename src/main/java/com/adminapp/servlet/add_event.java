/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.connect_db;
import java.io.File;
import java.io.IOException;
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
public class add_event extends HttpServlet {

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
            String title=request.getParameter("title");
            String content=request.getParameter("contents");
            String org=request.getParameter("org");
            String date=request.getParameter("date");
            Part filepart=request.getPart("image");
            String name=filepart.getSubmittedFileName();
            String photo;
            System.out.println(title);
            System.out.println(content);
            System.out.println(org);
            System.out.println(date);
            
            File file=new File(filepath());
           if(!file.exists())
           {
               file.mkdir();
           }
           
           try{
               Connection con=new connect_db().getConnection();
               photo=filepath()+File.separator+name;
               filepart.write(photo);
               PreparedStatement ps=con.prepareStatement("insert into events(heading,date,organizer,details,image) values (?,?,?,?,?)");
               ps.setString(1,title);
               ps.setString(2,date);
               ps.setString(3,org);
               ps.setString(4,content);
               ps.setString(5, name);
               int i=ps.executeUpdate();
               if(i>0)
               {
                   out.println("<script type=\"text/javascript\">");
out.println("alert('Event Successfully Added')");
out.println("window.location.href='admin/view_events.jsp'");
out.println("</script>");
                 }
               else
               {
                   out.println("<script type=\"text/javascript\">");
out.println("alert('Event Addition Unsuccessful ')");
out.println("window.location.href='admin/view_events.jsp'");
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
