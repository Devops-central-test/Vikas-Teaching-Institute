/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author vikas upadhyay
 */
public class connect_db {
        Connection con=null;
    public Connection getConnection()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // CHANGE THIS: use your EC2 PRIVATE IP
            String url = "jdbc:mysql://172.31.25.139:3306/admin?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
            String user = "adminapp_user";
            String pass = "StrongP@ssw0rd";

            con = DriverManager.getConnection(url, user, pass);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }return con;
    }
    
}

