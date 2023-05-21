import java.io.*;

import dto.UserDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class Registration extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
            try {
                response.setContentType("text/html;charset=UTF-8");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String role = request.getParameter("role");
                String username = request.getParameter("username");


                System.out.println(firstName + " " + lastName + " " + email + " " + password + " " + role);
                
                User user = new User(firstName,lastName,email,password,role,username);
                boolean isCreated = UserDto.createUser(user);
                System.out.println(isCreated);
                request.getRequestDispatcher("/registrationSuccess.jsp").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
            }
	}
}

