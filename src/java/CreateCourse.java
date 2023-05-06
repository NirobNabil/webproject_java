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
        
        protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws IOException {
            System.out.println("came in");
            
            String name = request.getParameter("name");
            
            Course course = new Course(name);
            
            try {
                CourseDto.createCourse(course);
            } catch( Exception e ) {
                System.out.println("sql didnt work man. bummer");
            }
            
            PrintWriter out = response.getWriter();
            out.println("got it mam " + name );
        }
        
        
}