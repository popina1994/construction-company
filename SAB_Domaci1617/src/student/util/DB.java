/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package student.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author popina
 */
public class DB {
    private static Connection connection = null;
    
    private static final String connectionString = "jdbc:sqlserver://localhost:1433;databaseName=Projekat;username=popina;password=1";
    

    public static Connection getConnection() throws SQLException{
        if (connection == null)
        {
            connection = DriverManager.getConnection(connectionString);
        }
        return connection;
    }

    public static void setConnection(Connection connection) {
        DB.connection = connection;
    }
    
    
    
}
