package dto;

import java.sql.*;

import java.util.*;

import model.Course;
import model.Student;
import model.Teacher;

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
    
    public static Student getOneStudentsWithCourseEnrollments(String studentid) throws Exception {
        var conn = dbConn.getConn();
        PreparedStatement ps = null;

        ResultSet result;
        Student student = dto.StudentDto.getStudentById(studentid);

                
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String queryString = "Select courseid from enrolled where studentid = ?";
            ps = conn.prepareStatement(queryString);
            ps.setString(1, studentid);
            
            // execute the statement
            result = ps.executeQuery();
            
            while(result.next()){
                String course_id = result.getString(1);
                Course c = CourseDto.getCourseById(course_id);
                
                student.enrollIn(c);
            }
            
        } catch (SQLException ex) {
            throw new Exception("Failed to create user: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
        }
        
        

        return student;
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
    
    public static ArrayList<Course> getCoursesWithStudentEnrollments(Teacher teacher) throws Exception {
        var conn = dbConn.getConn();
        PreparedStatement ps = null;

        HashMap<String, Course> courses = new HashMap<>();
        ResultSet result;
                
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            
            System.out.println("hahalol" + teacher.getId());
            String queryString = "Select * from enrolled natural join assigned where teacherid = ?";
            ps = conn.prepareStatement(queryString);
            ps.setString(1, teacher.getId());
            
            
            // execute the statement
            result = ps.executeQuery();
            
            while(result.next()){
                String course_id = result.getString(1);
                String student_id = result.getString(2);

                Student student = StudentDto.getStudentById(student_id);
                Course course;

                System.out.println(courses.containsKey(course_id));
                
                if( courses.containsKey(course_id) == true ) {
                    course = courses.get(course_id);

                    course.addStudent(student);
                } else {
                    course = CourseDto.getCourseById(course_id);
                    try {
                        course.addStudent(student);
                        System.out.println(course_id + " - " + student_id);
                        courses.put(course_id, course);
                    } catch( Exception ex ) {
                        System.out.println(ex.getMessage());
                    }
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
        
        ArrayList<Course> courses_array = new ArrayList<>();
        for (String courseid : courses.keySet()) {
            courses_array.add(courses.get(courseid));
        }

        return courses_array;
    }
    
    
    public static ArrayList<Course> getEnrolledCourses(Student student) throws Exception {
        var conn = dbConn.getConn();
        PreparedStatement ps = null;

        ArrayList<Course> courses = new ArrayList<>();
        ResultSet result;
                
        try {
            // loading drivers for mysql
            // creating connection with the database

            //Create a SQL INSERT statement
            String queryString = "Select course.courseid, name from course, enrolled where enrolled.studentid = ? and enrolled.courseid = course.courseid";
            PreparedStatement s = conn.prepareStatement(queryString);
            s.setString(1, student.getId());
            
            
            // execute the statement
            result = s.executeQuery();
            
            while(result.next()){
                String course_id = result.getString(1);
                String course_name = result.getString(2);

                courses.add( new Course(course_id, course_name) );
            }
            
        } catch (SQLException ex) {
            throw new Exception("Failed to fetch courses: " + ex.getMessage());
        } finally {
            // close resources
            if (ps != null) {
                ps.close();
            }
        }
        

        return courses;
    }

}
