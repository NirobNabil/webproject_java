<%-- 
    Document   : createCourse
    Created on : May 5, 2023, 11:31:58 PM
    Author     : twin_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
   import="model.Course, java.util.ArrayList"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div>
        
        <%
            ArrayList<Course> courses_t = (ArrayList<Course>) request.getAttribute("courses");
            
            for (int i = 0; i < courses_t.size(); i++) {
                out.println("<li>" + courses_t.get(i).getId() + " - " + courses_t.get(i).getName() + "</li>" );
            }

        %>
        
        </div>
        <form action="createCourse" method="post" >
            <input name="name" type="text" />
            <button type="submit" > create course </button>
        </form>
    </body>
</html>
