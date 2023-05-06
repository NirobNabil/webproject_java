package dto;

import java.sql.*;

import java.util.ArrayList;

import model.Teacher;

public class TeacherDto {

    public static boolean createTeacher(Teacher course) throws Exception {
        
        var con = dbConn.getConn();
        PreparedStatement ps = null;
        boolean result = false;

        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String sql = "INSERT INTO teacher (name) VALUES (?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, course.getName());

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
    
    
    public static ArrayList<Teacher> getTeachers() throws Exception {
        var conn = dbConn.getConn();
        PreparedStatement ps = null;

        ArrayList<Teacher> teachers = new ArrayList<>();
        ResultSet result;
                
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String queryString = "Select * from teacher";
            Statement s = conn.createStatement();
            
            
            // execute the statement
            result = s.executeQuery(queryString);
            
            while(result.next()){
                String id = result.getString(1);
                String name = result.getString(2);
                teachers.add(new Teacher(id, name));
            }
            
        } catch (SQLException ex) {
            throw new Exception("Failed to create user: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
        }

        return teachers;
    }
    
    
    public static Teacher getTeacherById(String teacherid) throws Exception {
        var conn = dbConn.getConn();
        PreparedStatement ps = null;

        Teacher teacher = null;
        ResultSet result;
                
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            PreparedStatement statement = conn.prepareStatement("SELECT * from teacher WHERE teacherid = ?");
            statement.setString(1, teacherid);
            
            
            // execute the statement
            result = statement.executeQuery();
            
            while(result.next()){
                String id = result.getString(1);
                String name = result.getString(2);
                teacher = new Teacher(id, name);
            }
            
        } catch (SQLException ex) {
            throw new Exception("Failed to create user: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
        }

        return teacher;
    }

}
