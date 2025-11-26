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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vikas upadhyay
 */
public class add_category extends HttpServlet {

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
            String category=request.getParameter("title");
           String status=request.getParameter("status");
            System.out.println(category);
            System.out.println(status);
           int flag=1;
           try{
               Connection con=new connect_db().getConnection();
               PreparedStatement ps=con.prepareStatement("select category from add_category where category=?");
               ps.setString(1, category);
               ResultSet rs=ps.executeQuery();
               if(rs.next())
               {
                  if(rs.getString("category").equals(category))
                  {
                       out.println("<script type=\"text/javascript\">");
out.println("alert('Category already exist')");
out.println("window.location.href='admin/view_Category.jsp'");
out.println("</script>");
                      flag=0;
                  }
               }
               if(flag==1)
               {
                   PreparedStatement ps1=con.prepareStatement("insert into add_category(category,status) values(?,?)");
                   ps1.setString(1, category);
                   ps1.setString(2, status);
                   int i=ps1.executeUpdate();
                   if(i>0){
                      out.println("<script type=\"text/javascript\">");
out.println("alert('Category Successfully Upload')");
out.println("window.location.href='admin/view_Category.jsp'");
out.println("</script>");
                       }
                   else{
                       out.println("<script type=\"text/javascript\">");
out.println("alert('Category Not Upload')");
out.println("window.location.href='admin/Add_Category.jsp'");
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
