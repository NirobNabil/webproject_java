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




public class EnrollCourse extends HttpServlet {
    
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
//            System.out.println("Couldn't get teachers");
//
//        } catch (Exception ex) {
//            System.out.println("Couldn't get teachers");
//        }

        try{
            Student student_with_enrollments;
            String studentid = dto.CookieDto.getCookie(request, "userid");
            student_with_enrollments = CourseEnrollment.getOneStudentsWithCourseEnrollments(studentid);
            request.setAttribute("student_with_enrollments", student_with_enrollments);
        } catch( Exception e ) {
            System.out.println("Some bad exception when getting course enrollments: " + e.getMessage());
        }

        request.setAttribute("courses", courses);
//        request.setAttribute("teachers", teachers);

        request.getRequestDispatcher("enrollCourse.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        sendDefaultPage(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
            
            String courseid = request.getParameter("courseid");
            String studentid = request.getParameter("studentid");
            
            
            try {
                Course course = CourseDto.getCourseById(courseid);
                Student student = StudentDto.getStudentById(studentid);
  
                CourseEnrollment.setEnrollment(course, student);
                
                request.setAttribute("status", "successfully assigned " + student.getName() + " to " + course.getName());
                request.setAttribute("statusType", "success");
            } catch( Exception e ) {
                System.out.println(e.getMessage());
                request.setAttribute("status", "An error happened while enrolling");
                request.setAttribute("statusType", "error");
            }
            
//            PrintWriter out = response.getWriter();
//            out.println("got it mam " + courseid + " " + teacherid );
            
            sendDefaultPage(request, response);
        }
    
}
