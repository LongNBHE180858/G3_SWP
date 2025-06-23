/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Long0
 */
public class DBContext {
    private static DBContext instance = new DBContext();//singleton pattern
    protected Connection connection;
    String err;

    public static DBContext getInstance() {
        return instance;
    }

    public Connection getConnection() {
        return connection;
    }

    public DBContext() {
        try {
            if (connection == null || connection.isClosed()) {
                //String user = "sa";
                String user = "intern";
                //String password = "123";
                String password = "intern1234qwer!";
                //String url = "jdbc:sqlserver://localhost:1433;databaseName=OLIT;TrustServerCertificate=true";
                String url = "jdbc:sqlserver://10.73.131.12:1433;databaseName=OLIT;encrypt=true;trustServerCertificate=true";
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                connection = DriverManager.getConnection(url, user, password);
            }
        } catch (Exception e) {
            err = e.getMessage();
            connection = null;
        }
    }

    public String getErr() {
        return this.err;
    }
}
