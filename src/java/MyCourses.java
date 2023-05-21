import dto.CourseDto;
import java.io.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.util.ArrayList;
import model.Course;
import model.Teacher;
import model.Student;

import dto.CourseDto;
import dto.TeacherDto;
import dto.StudentDto;
import dto.CourseAssignment;
import dto.CourseEnrollment;
import dto.CookieDto;




public class MyCourses extends HttpServlet {
    
    protected void sendDefaultPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
		
        ArrayList<Course> courses = new ArrayList<>();
        try {
            courses = CourseDto.getCourses();
        } catch (Exception ex) {
            System.out.println("Couldn't get courses");
        }

//        ArrayList<Student> students = new ArrayList<>();
//        try {
//            students = StudentDto.getStudents();
//        } catch (Exception ex) {
//            System.out.println("Couldn't get teachers");
//        }

        ArrayList<Course> courses_with_assignments = new ArrayList<>();
        ArrayList<Course> courses_with_enrollments = new ArrayList<>();
        String userid = CookieDto.getCookie(request, "userid");

        try{
            courses_with_assignments = CourseAssignment.getTeacherCourseAssignments(userid);
        } catch( Exception e ) {
            System.out.println("Some bad exception when getting course assignments: " + e.getMessage());
        }
        
        try {
            Teacher teacher = TeacherDto.getTeacherById(userid);
            courses_with_enrollments = CourseEnrollment.getCoursesWithStudentEnrollments(teacher);
        } catch( Exception e ) {
            System.out.println("some bad exception when getting course with enrollments " + e.getMessage());
        }
        
        
        request.setAttribute("courses_with_enrollments", courses_with_enrollments);
        request.setAttribute("courses_with_assignments", courses_with_assignments);
        request.setAttribute("courses", courses);
//        request.setAttribute("teachers", teachers);

        request.getRequestDispatcher("myCourses.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        sendDefaultPage(request, response);
    }

    
}
