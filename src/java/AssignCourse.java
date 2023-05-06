import dto.CourseDto;
import java.io.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.util.ArrayList;
import model.Course;
import model.Teacher;
import dto.CourseDto;
import dto.TeacherDto;
import dto.CourseAssignment;




public class AssignCourse extends HttpServlet {
    
    protected void sendDefaultPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
		
        ArrayList<Course> courses = new ArrayList<>();
        try {
            courses = CourseDto.getCourses();
        } catch (Exception ex) {
            System.out.println("Couldn't get courses");
        }

        ArrayList<Teacher> teachers = new ArrayList<>();
        try {
            teachers = TeacherDto.getTeachers();
        } catch (Exception ex) {
            System.out.println("Couldn't get teachers");
        }

        ArrayList<Course> courses_with_assignment = new ArrayList<>();
        try{
            courses_with_assignment = CourseAssignment.getCourseAssignments();
        } catch( Exception e ) {
            System.out.println("Some bad exception when getting course assignments");
        }

        request.setAttribute("courses_with_assignment", courses_with_assignment);
        request.setAttribute("courses", courses);
        request.setAttribute("teachers", teachers);

        request.getRequestDispatcher("assignCourse.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        sendDefaultPage(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
            
            String courseid = request.getParameter("courseid");
            String teacherid = request.getParameter("teacherid");
            
            
            try {
                Course course = CourseDto.getCourseById(courseid);
                Teacher teacher = TeacherDto.getTeacherById(teacherid);
  
                CourseAssignment.setAssignment(course, teacher);
                
                request.setAttribute("status", "successfully assigned " + teacher.getName() + " to " + course.getName());
                request.setAttribute("statusType", "success");
            } catch( Exception e ) {
                request.setAttribute("status", "An error happened while assigning");
                request.setAttribute("statusType", "error");
            }
            
//            PrintWriter out = response.getWriter();
//            out.println("got it mam " + courseid + " " + teacherid );
            
            sendDefaultPage(request, response);
        }
    
}
