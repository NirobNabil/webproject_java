<%-- 
    Document   : createCourse
    Created on : May 5, 2023, 11:31:58 PM
    Author     : twin_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
   import="model.Teacher, java.util.ArrayList"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Teacher</title>
    </head>
    <body>
        
        <div>
        
        <%
            ArrayList<Teacher> teachers_t = (ArrayList<Teacher>) request.getAttribute("teachers");
            
            for (int i = 0; i < teachers_t.size(); i++) {
                out.println("<li>" + teachers_t.get(i).getId() + " - " + teachers_t.get(i).getName() + "</li>" );
            }

        %>
        
        </div>
        <form action="createTeacher" method="post" >
            <input name="name" type="text" />
            <button type="submit" > create teacher </button>
        </form>
    </body>
</html>
