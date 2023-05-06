import java.io.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		System.out.println(email + "  " + pass);
		RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
		rs.include(request, response);
	}
}