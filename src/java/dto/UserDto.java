package dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.ResultSet;

import java.util.*;

import model.User;

public class UserDto {

    public static boolean createUser(User user) throws Exception {
        var con = dbConn.getConn();
        PreparedStatement ps = null;
        boolean result = false;

        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String sql = "INSERT INTO user (firstName, lastName, email, password, role, username) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getRole());            
            ps.setString(6, user.getUsername());


            // execute the statement
            result = ps.execute();
        } catch (SQLException ex) {
            throw new Exception("Failed to create user: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
        }

        return result;
    }
    
    public static ArrayList<String> verifyUser(String username, String password) throws Exception {
        var con = dbConn.getConn();
        PreparedStatement ps = null;
        ResultSet result;
        String role = "";
        String id = "";
        ArrayList<String> res = new ArrayList<>();
        
        
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String sql = "select role, userid from user where username = ? and password = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            // execute the statement
            result = ps.executeQuery();
            System.out.println(username + " " + password);
            System.out.println(result.getRow());
            
            if( !result.next() ) {
                throw new SQLException("No user exists by this username and password");
            } else {
                role = result.getString(1);
                id = result.getString(2);
            }
            
        } catch (SQLException ex) {
            throw new Exception("Failed to find user: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
        }
        
        
        res.add(role);
        res.add(id);
        
        System.out.println("dto " + role + " " + id);
        
        return res;
    }
    
    

}
