import java.io.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.util.*;

import dto.UserDto;
import dto.CookieDto;

public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
                String role, userid;
                try {
                    ArrayList<String> res = UserDto.verifyUser(username, pass);
                    role = res.get(0);
                    userid = res.get(1);
                    
                    System.out.println(username + "  " + pass);
                    Cookie usernameCookie = new Cookie("username", username);
                    Cookie roleCookie = new Cookie("role", role);
                    Cookie idCookie = new Cookie("userid", userid);
                    response.addCookie(usernameCookie);
                    response.addCookie(roleCookie);
                    response.addCookie(idCookie);
                    request.setAttribute("username", username);
                    RequestDispatcher rs = request.getRequestDispatcher("loginSuccess.jsp");
                    rs.include(request, response);
                } catch( Exception ex ) {
                    System.out.println(ex.getMessage());
                    RequestDispatcher rs = request.getRequestDispatcher("loginFailed.jsp");
                    rs.include(request, response);
                }
                
		
	}
}