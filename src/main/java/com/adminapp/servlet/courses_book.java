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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vikas upadhyay
 */
public class courses_book extends HttpServlet {

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
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String courses = request.getParameter("courses");
            String price = request.getParameter("price");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String email1="";
            int flag = 1;
            try {
                Connection con = new connect_db().getConnection();
                PreparedStatement ps2 = con.prepareStatement("select * from course_register where email=? and courses=? ");
                ps2.setString(1, email);
                ps2.setString(2, courses);
                ResultSet rs1 = ps2.executeQuery();

                if (rs1.next()) {
                    if (rs1.getString("status").equalsIgnoreCase("accept") || rs1.getString("status").equalsIgnoreCase("pending")) {

                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Course already registered')");
                        out.println("window.location.href='courses.jsp'");
                        out.println("</script>");
                        flag = 0;
                    } else if (rs1.getString("status").equalsIgnoreCase("cancel")) {
                        PreparedStatement ps1 = con.prepareStatement("insert into course_register(name,email,courses,price,phone,address) values(?,?,?,?,?,?)");
                        ps1.setString(1, name);
                        ps1.setString(2, email);
                        ps1.setString(3, courses);
                        ps1.setString(4, price);
                        ps1.setString(5, phone);
                        ps1.setString(6, address);

                        int i = ps1.executeUpdate();
                        if (i > 0) {
                            String sub = "Regarding Course Booking";
                           String body="Hello!User<br><br>Greetings<br>Your request for Course Registration (<b>Course Name:</b> "+courses+") has been received. We will Contact you shortly.<br>Best Regards,<br>Shiva Teaching<br>";
                            System.out.println(email);
                            System.out.println(sub);
                            System.out.println(body);
                            mailer.mailer.send(email, sub, body);
                            
                            PreparedStatement ps22=con.prepareStatement("select * from admin_profile ");
                       ResultSet rs22=ps22.executeQuery();
                           
                           if(rs22.next()){
                            email1=rs22.getString("altemail");
                           }
                       String subject1="Regarding Course Booking";
                          String body1=" Hello!Admin.<br>Greetings<br><br> New Course Booking from "+email+"  has been Received.<br><b>Course Details:</b><br>UserName:"+name+"<br>CourseName:"+courses+"<br><br>Best Regards,<br>Team Shiva Teaching<br>";
                          mailer.mailer.send(email1,subject1,body1);
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('successfully registered')");
                            out.println("location='index.jsp'");
                            out.println("</script>");
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('unsuccessful')");
                            out.println("location='courses.jsp'");
                            out.println("</script>");
                        }
                    }

                }else{
                PreparedStatement ps1 = con.prepareStatement("insert into course_register(name,email,courses,price,phone,address) values(?,?,?,?,?,?)");
                        ps1.setString(1, name);
                        ps1.setString(2, email);
                        ps1.setString(3, courses);
                        ps1.setString(4, price);
                        ps1.setString(5, phone);
                        ps1.setString(6, address);

                        int i = ps1.executeUpdate();
                        if (i > 0) {
                            String sub = "Regarding Course Registration";
                            String body="Hello!User<br>Greetings<br><br>Your request for Course Registration <b>Course Name:</b> "+courses+" has been received. We will Contact you shortly.<br><br>Best Regards,<br>Team Shiva Teaching<br>";
                            System.out.println(email);
                            System.out.println(sub);
                            System.out.println(body);
                             PreparedStatement ps22=con.prepareStatement("select * from admin_profile ");
                       ResultSet rs22=ps22.executeQuery();
                            mailer.mailer.send(email, sub, body);
                            if(rs22.next()){
                            email1=rs22.getString("altemail");
                           }
                       String subject1="Regarding Course Booking";
                          String body1=" Hello!Admin.<br>Greetings<br><br> New Course Booking from "+email+"  has been Received.<br><b>Course Details:</b><br>UserName:"+name+"<br>CourseName:"+courses+"<br><br>Best Regards,<br>Team Shiva Teaching<br>";
                          mailer.mailer.send(email1,subject1,body1);
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('successfully registered')");
                            out.println("location='index.jsp'");
                            out.println("</script>");
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('unsuccessful')");
                            out.println("location='courses.jsp'");
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
            Logger.getLogger(courses_book.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(courses_book.class.getName()).log(Level.SEVERE, null, ex);
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
