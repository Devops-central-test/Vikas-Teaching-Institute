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
public class edit_items extends HttpServlet {

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
            String name=request.getParameter("title");
            String id=request.getParameter("id");
            String price=request.getParameter("price");
            String stock=request.getParameter("stock");
            String discount=request.getParameter("discount");
            String description=request.getParameter("description");
            String status=request.getParameter("status");
            Part filepart=request.getPart("image");
            String name1=filepart.getSubmittedFileName();
            String FileName=name1;
            String photo;
            File file=new File(filepath());
           if(!file.exists())
           {
               file.mkdir();
           }
           
           
            try{
            Connection con=new connect_db().getConnection();
            if(filepart.getSize()>0){
                 photo=filepath()+File.separator+FileName;
               filepart.write(photo);
            
            PreparedStatement ps=con.prepareStatement("update item set item_name=?,price=?,stock=?,discount=?,description=?,status=?,image=? where tid=?");
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, stock);
            ps.setString(4, discount);
            ps.setString(5, description);
            ps.setString(6, status);
            ps.setString(7, FileName);
            ps.setString(8, id);
            int i=ps.executeUpdate();
            if(i>0){
                out.println("<script type=\"text/javascript\">");
out.println("alert('item Successfully Updated')");
out.println("window.location.href='admin/view_Item.jsp'");
out.println("</script>");
            }
            else{
                out.println("<script type=\"text/javascript\">");
out.println("alert('item Not Updated')");
out.println("window.location.href='admin/view_Item.jsp'");
out.println("</script>");
            }}
            else
            {
                    PreparedStatement ps=con.prepareStatement("update item set item_name=?,price=?,stock=?,discount=?,description=?,status=? where tid=?");
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, stock);
            ps.setString(4, discount);
            ps.setString(5, description);
            ps.setString(6, status);
           
            ps.setString(7, id);
            int i=ps.executeUpdate();
            if(i>0){
                out.println("<script type=\"text/javascript\">");
out.println("alert('item Successfully Updated')");
out.println("window.location.href='admin/view_Item.jsp'");
out.println("</script>");
            }
            else{
                out.println("<script type=\"text/javascript\">");
out.println("alert('item Not Updated')");
out.println("window.location.href='admin/view_Item.jsp'");
out.println("</script>");
            }}
        }catch(Exception e)
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
