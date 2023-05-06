package dto;

import java.io.PrintWriter;
import java.sql.*;


public class dbConn {

    //TODO: implement a destructor to close conn
    private static Connection conn = null;
    private static String url = "jdbc:mysql://localhost:3306/webproject";
    private static String userString = "shomla";
    private static String password = "ektamonke";
    private static String myDriver = "com.mysql.cj.jdbc.Driver";
    
    public static Connection getConn() {

        if( conn != null ) {
            return conn;
        }

        try {
            // creating connection with the database
            Class.forName(myDriver);
            conn = DriverManager.getConnection(url, userString, password);

        } catch (ClassNotFoundException ex) {
            System.out.println("Class not found lol");
        } finally {
            return conn;
        }



            // close resources
//            try {
//                if (conn != null) {
//                    conn.close();
//                }
//            } catch (SQLException ex) {
//                System.out.println("conn close error");
//            }

    }

}
