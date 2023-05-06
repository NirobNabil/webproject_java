import dto.UserDto;
import java.io.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.sql.SQLException;
import model.User;

public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		System.out.println(email + "  " + pass);
		UserDto userDto = new UserDto();
		User user = new User();

		try {
			user = userDto.fetchUser(email, pass);
			//Do something with the user object
                        System.out.println(user);
                        request.setAttribute("user", user);
                        request.getRequestDispatcher("/loginSuccess.jsp").forward(request, response);
		} catch (SQLException e) {
			// Handle SQL exception
			e.printStackTrace();
		} catch (Exception e) {
			// Handle other exceptions
			e.printStackTrace();
		}
	}
}
