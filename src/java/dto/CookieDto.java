package dto;


import jakarta.servlet.http.*;

public class CookieDto {
    
    public static String getCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();

        String cookieName = name;

        String defaultValue = null;
        
        try {
            for ( int i=0; i<cookies.length; i++) {

                Cookie cookie = cookies[i];

                if (cookieName.equals(cookie.getName())) {
                    return cookie.getValue();
                }

            }
        } catch(Exception e) {
            System.out.println("Error while getting cookie");
        }

        return defaultValue;
    }
    
}
