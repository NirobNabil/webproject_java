package dto;

import java.sql.*;

import java.util.ArrayList;

import model.Course;
import model.Teacher;

public class CourseAssignment {

    public static boolean setAssignment(Course course, Teacher teacher) throws Exception {
        
        var con = dbConn.getConn();
        PreparedStatement ps = null;
        boolean result = false;

        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String sql = "INSERT INTO assigned (courseid, teacherid) VALUES (?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, course.getId());
            ps.setString(2, teacher.getId());

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
    
    
    public static ArrayList<Course> getCourseAssignments() throws Exception {
        var conn = dbConn.getConn();
        PreparedStatement ps = null;

        ArrayList<Course> courses = new ArrayList<>();
        ResultSet result;
                
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String queryString = "Select * from assigned";
            Statement s = conn.createStatement();
            
            
            // execute the statement
            result = s.executeQuery(queryString);
            
            while(result.next()){
                String course_id = result.getString(1);
                String teacher_id = result.getString(2);
                Course c = CourseDto.getCourseById(course_id);
                Teacher t = TeacherDto.getTeacherById(teacher_id);
                c.assignTo(t);
                courses.add(c);
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

}
