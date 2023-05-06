<%-- 
    Document   : assignCourse
    Created on : May 6, 2023, 1:28:50 AM
    Author     : twin_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
    import="model.Course, model.Teacher, java.util.ArrayList"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            ArrayList<Course> courses_tt = (ArrayList<Course>) request.getAttribute("courses_with_assignment");

            for (int i = 0; i < courses_tt.size(); i++) {
                out.println("<li> id: " + courses_tt.get(i).getId() + " ----- name:  " + courses_tt.get(i).getName() + " ----- assigned to: " + courses_tt.get(i).getAssignedTo().getName() + "</li>" );
            }

        %>
        
        <form action="assignCourse" method="post" >
            
            <select name="courseid">
                <%
                    ArrayList<Course> courses_t = (ArrayList<Course>) request.getAttribute("courses");
            
                    for (int i = 0; i < courses_t.size(); i++) {
                        out.println("<option value=\"" + courses_t.get(i).getId() + "\">" + courses_t.get(i).getName() + "</option>" );
                    }

                %>
            </select>
            
            <select name="teacherid">
                <%
                    ArrayList<Teacher> teachers_t = (ArrayList<Teacher>) request.getAttribute("teachers");

                    for (int i = 0; i < teachers_t.size(); i++) {
                        out.println("<option value=\"" + teachers_t.get(i).getId() + "\">" + teachers_t.get(i).getName() + "</option>" );
                    }

                %>
            </select>
            
            <button type="submit" > assign </button>
            
        </form>
    </body>
</html>
