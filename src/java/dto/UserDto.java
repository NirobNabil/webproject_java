package dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.SQLException;

import model.User;

public class UserDto {

    public boolean createUser(User user) throws Exception {
        String url = "jdbc:mysql://localhost:3306/webproject";
        String userString = "shomla";
        String password = "ektamonke";
        String myDriver = "com.mysql.cj.jdbc.Driver";

        Connection con = null;
        PreparedStatement ps = null;
        boolean result = false;

        try {
            // loading drivers for mysql
            // creating connection with the database
            Class.forName(myDriver);
            con = DriverManager.getConnection(url, userString, password);

            //Create a SQL INSERT statement
            String sql = "INSERT INTO User (firstName, lastName, email, password) VALUES (?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());

            // execute the statement
            result = ps.execute();
        } catch (SQLException | ClassNotFoundException ex) {
            throw new Exception("Failed to create user: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

}
