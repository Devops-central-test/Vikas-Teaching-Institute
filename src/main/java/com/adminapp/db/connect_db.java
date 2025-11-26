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
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","root");
        }
        catch(Exception e)
        {
            System.out.println(e);
        }return con;
    }
    
}
