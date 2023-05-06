import java.io.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import dto.CourseDto;
import model.Course;

import java.util.ArrayList;


public class CreateCourse extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
                ArrayList<Course> courses = new ArrayList<>();
                try {
                    courses = CourseDto.getCourses();
                } catch (Exception ex) {
                    System.out.println("Couldn't get courses");
                }
                
                System.out.println(courses.size());
                
                request.setAttribute("courses", courses);
                        
                request.getRequestDispatcher("createCourse.jsp").forward(request, response);
	}
        
        protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

            PrintWriter out = response.getWriter();

            String name = request.getParameter("name");
            
            Course course = new Course(name);
            
            try {
                CourseDto.createCourse(course);
//                out.println("successfully added course " + name);
                request.setAttribute("status", "successfully added course " + name);
                request.setAttribute("statusType", "success");
            } catch( Exception e ) {
                request.setAttribute("status", "An error happened while adding course " + name);
                request.setAttribute("statusType", "error");
//                out.println("An error happened while adding course " + name);
            }
            
            ArrayList<Course> courses = new ArrayList<>();
            try {
                courses = CourseDto.getCourses();
            } catch (Exception ex) {
                System.out.println("Couldn't get courses");
            }

            System.out.println(courses.size());

            request.setAttribute("courses", courses);

            request.getRequestDispatcher("createCourse.jsp").forward(request, response);
            
        }
        
        
}