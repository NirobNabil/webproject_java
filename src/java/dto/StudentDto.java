package dto;

import java.sql.*;

import java.util.ArrayList;

import model.Teacher;
import model.Student;

public class StudentDto {

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
    
    
    public static ArrayList<Student> getStudents() throws Exception {
        var conn = dbConn.getConn();
        PreparedStatement ps = null;

        ArrayList<Student> students = new ArrayList<>();
        ResultSet result;
                
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String queryString = "Select * from student";
            Statement s = conn.createStatement();
            
            
            // execute the statement
            result = s.executeQuery(queryString);
            
            while(result.next()){
                String id = result.getString(1);
                String name = result.getString(2);
                students.add(new Student(id, name));
            }
            
        } catch (SQLException ex) {
            throw new Exception("Failed to fetch students: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
        }

        return students;
    }
    
    
    public static Student getStudentById(String studentid) throws Exception {
        var conn = dbConn.getConn();
        PreparedStatement ps = null;

        Student student = null;
        ResultSet result;
                
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            PreparedStatement statement = conn.prepareStatement("SELECT * from student WHERE studentid = ?");
            statement.setString(1, studentid);
            
            
            // execute the statement
            result = statement.executeQuery();
            
            while(result.next()){
                String id = result.getString(1);
                String name = result.getString(2);
                student = new Student(id, name);
            }
            
        } catch (SQLException ex) {
            throw new Exception("Failed to fetch student: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
        }

        return student;
    }

}
