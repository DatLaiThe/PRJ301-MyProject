/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Dat Lai
 */
public class DBContext {
    protected Connection connection;
    public DBContext() {
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName= TimeKeeping";
            String user = "sa";
            String pass = "12345";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
