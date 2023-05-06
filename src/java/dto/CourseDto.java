package dto;

import java.sql.*;

import java.util.ArrayList;

import model.Course;

public class CourseDto {

    public static boolean createCourse(Course course) throws Exception {
        
        var con = dbConn.getConn();
        PreparedStatement ps = null;
        boolean result = false;

        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String sql = "INSERT INTO course (name) VALUES (?)";
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
    
    
    public static ArrayList<Course> getCourses() throws Exception {
        var conn = dbConn.getConn();
        PreparedStatement ps = null;

        ArrayList<Course> courses = new ArrayList<>();
        ResultSet result;
                
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String queryString = "Select * from course";
            Statement s = conn.createStatement();
            
            
            // execute the statement
            result = s.executeQuery(queryString);
            
            while(result.next()){
                String id = result.getString(1);
                String name = result.getString(2);
                courses.add(new Course(id, name));
            }
            
        } catch (SQLException ex) {
            throw new Exception("Failed to create user: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
        }

        return courses;
    }
    
    public static Course getCourseById(String courseid) throws Exception {
        var conn = dbConn.getConn();
        PreparedStatement ps = null;

        Course course = null;
        ResultSet result;
                
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            PreparedStatement statement = conn.prepareStatement("SELECT * from course WHERE courseid = ?");
            statement.setString(1, courseid);
            
            
            // execute the statement
            result = statement.executeQuery();
            
            while(result.next()){
                String id = result.getString(1);
                String name = result.getString(2);
                course = new Course(id, name);
            }
            
        } catch (SQLException ex) {
            throw new Exception("Failed to create user: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
        }

        return course;
    }

}
