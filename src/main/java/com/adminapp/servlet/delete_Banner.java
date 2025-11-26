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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static path.path.filepath;

/**
 *
 * @author vikas upadhyay
 */
public class delete_Banner extends HttpServlet {

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
            String id = request.getParameter("id");
            String image = request.getParameter("image");
            String photo;
            try {
                photo = filepath() + File.separator + image;
                Connection con = new connect_db().getConnection();
                PreparedStatement ps1 = con.prepareStatement("select count(id) from add_banner");
                ResultSet rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    String id1 = rs1.getString("count(id)");
                    int no = Integer.parseInt(id1);

                    if (no > 1) {
                        PreparedStatement ps = con.prepareStatement("delete from add_banner where id=?");
                        ps.setString(1, id);
                        ps.executeUpdate();
                        File file = new File(photo);
                        if (file.delete()) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Banner Successfully deleted')");
                            out.println("window.location.href='admin/view_Banner.jsp'");
                            out.println("</script>");
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Banner deletion Unsuccessful')");
                            out.println("window.location.href='admin/view_Banner.jsp'");
                            out.println("</script>");
                        }
                    } else if (no == 1) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Cannot delete ! Atleast one banner should exist !!')");
                        out.println("window.location.href='admin/view_Banner.jsp'");
                        out.println("</script>");
                    }
                }
            } catch (Exception e) {
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
            Logger.getLogger(delete_Banner.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(delete_Banner.class.getName()).log(Level.SEVERE, null, ex);
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
