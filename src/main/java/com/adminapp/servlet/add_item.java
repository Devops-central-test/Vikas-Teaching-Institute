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
public class add_item extends HttpServlet {

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
            String title=request.getParameter("title");
            String cid=request.getParameter("country");
            String sid=request.getParameter("state");
            String price=request.getParameter("price");
            String stock=request.getParameter("stock");
            String discount=request.getParameter("discount");
            String status=request.getParameter("status");
            String description=request.getParameter("description");
            Part filepart=request.getPart("image");
            String name=filepart.getSubmittedFileName();
            String photo;
            String FileName=name;
             File file=new File(filepath());
           
             
             try{
               Connection con=new connect_db().getConnection();
               
               photo=filepath()+File.separator+FileName;
               filepart.write(photo);
               PreparedStatement ps=con.prepareStatement("insert into item(item_name,image,price,stock,discount,description,status,cid,sid) values(?,?,?,?,?,?,?,?,?)");
               ps.setString(1,title);
               ps.setString(2,FileName);
               ps.setString(3,price);
               ps.setString(4,stock);
               ps.setString(5,discount);
               ps.setString(6,description);
               ps.setString(7,status);
               ps.setString(8,cid);
               ps.setString(9,sid);
              
               
               int i=ps.executeUpdate();
               if(i>0)
               {
                  out.println("<script type=\"text/javascript\">");
out.println("alert('Item Successfully Added')");
out.println("window.location.href='admin/Add_Item.jsp'");
out.println("</script>");
                 }
               else
               {
                  out.println("<script type=\"text/javascript\">");
out.println("alert('Item Addition Failed')");
out.println("window.location.href='admin/Add_Item.jsp'");
out.println("</script>");
               }}
             catch(Exception e){
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
            Logger.getLogger(add_item.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(add_item.class.getName()).log(Level.SEVERE, null, ex);
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
