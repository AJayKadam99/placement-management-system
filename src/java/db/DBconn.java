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
 * @author DEEPAK
 */
public class DBconn {
    static Connection connection;
    
    public static Connection connect() throws Exception{
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/placement_management_updated", "root", null);
        return connection;
    }
    catch(Exception ex){
        System.out.println("Ex: " + ex.toString());
    }
    return null;
    }
}
