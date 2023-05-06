package dto;

import java.sql.*;

import java.util.*;

import model.Course;
import model.Student;

public class CourseEnrollment {

    public static boolean setEnrollment(Course course, Student student) throws Exception {
        
        var con = dbConn.getConn();
        PreparedStatement ps = null;
        boolean result = false;

        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String sql = "INSERT INTO enrolled (courseid, studentid) VALUES (?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, course.getId());
            ps.setString(2, student.getId());

            // execute the statement
            result = ps.execute();
        } catch (SQLException ex) {
            throw new Exception("Failed to create enrollment: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
        }

        return result;
    }
    
    
    public static ArrayList<Student> getStudentsWithCourseEnrollments() throws Exception {
        var conn = dbConn.getConn();
        PreparedStatement ps = null;

        HashMap<String, Student> students = new HashMap<>();
        ResultSet result;
                
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String queryString = "Select * from enrolled";
            Statement s = conn.createStatement();
            
            
            // execute the statement
            result = s.executeQuery(queryString);
            
            while(result.next()){
                String course_id = result.getString(1);
                String student_id = result.getString(2);
                Course c = CourseDto.getCourseById(course_id);
                Student student;
                
                if( students.containsKey(student_id) ) {
                    student = students.get(student_id);
                    student.enrollIn(c);
                } else {
                    student = StudentDto.getStudentById(student_id);
                    student.enrollIn(c);
                    students.put(student_id, student);
                }
            }
            
        } catch (SQLException ex) {
            throw new Exception("Failed to create user: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
        }
        
        ArrayList<Student> students_array = new ArrayList<>();
        for (String studentid : students.keySet()) {
            students_array.add(students.get(studentid));
        }

        return students_array;
    }

}
