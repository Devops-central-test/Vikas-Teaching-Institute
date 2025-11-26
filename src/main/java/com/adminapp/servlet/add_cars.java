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
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)


public class add_cars extends HttpServlet {

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
            Part filepart1=request.getPart("image1");
            Part filepart2=request.getPart("image2");
            Part filepart3=request.getPart("image3");
            String name1=filepart1.getSubmittedFileName();
            String name2=filepart2.getSubmittedFileName();
            String name3=filepart3.getSubmittedFileName();
             String photo1;
             String photo2;
             String photo3;
            File file=new File(filepath());
           if(!file.exists())
           {
               file.mkdir();
           }
           try{
               Connection con=new connect_db().getConnection();
               photo1=filepath()+File.separator+name1;
               photo2=filepath()+File.separator+name2;
               photo3=filepath()+File.separator+name3;
               filepart1.write(photo1);
               filepart2.write(photo2);
               filepart3.write(photo3);
               PreparedStatement ps=con.prepareStatement("insert into cars(economy,standard,luxury) values (?,?,?)");
               ps.setString(1,name1);
               ps.setString(2,name2);
               ps.setString(3,name3);
               int i=ps.executeUpdate();
               if(i>0)
               {
                   out.println("successful");
                 }
               else
               {
                   out.println("unsuccessful");
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
