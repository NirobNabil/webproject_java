package dto;

import java.sql.*;

import java.util.ArrayList;

import model.Teacher;
import model.Student;

public class StudentDto {
    
    
    public static ArrayList<Student> getStudents() throws Exception {
        var conn = dbConn.getConn();
        PreparedStatement ps = null;

        ArrayList<Student> students = new ArrayList<>();
        ResultSet result;
                
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String queryString = "Select userid, firstName, lastName from user where role = \"student\"";
            Statement s = conn.createStatement();
            
            
            // execute the statement
            result = s.executeQuery(queryString);
            
            while(result.next()){
                String id = result.getString(1);
                String firstName = result.getString(2);
                String lastName = result.getString(3);
                students.add(new Student(id, firstName, lastName));
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
                
        
        System.out.println("studentid - " + studentid);
        
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            PreparedStatement statement = conn.prepareStatement("SELECT userid, firstName, lastName from user WHERE role=\"student\" and userid = ?");
            statement.setString(1, studentid);
            
            
            // execute the statement
            result = statement.executeQuery();
            
            while(result.next()){
                String id = result.getString(1);
                String firstName = result.getString(2);
                String lastName = result.getString(3);
                student = new Student(id, firstName, lastName);
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
