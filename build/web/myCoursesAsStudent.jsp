<%-- 
    Document   : assignCourse
    Created on : May 6, 2023, 1:28:50 AM
    Author     : twin_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
    import="model.Course, model.Student, java.util.ArrayList"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="header.jsp" />
    </head>
    <body class="font-raleway p-8 " >

        <jsp:include page="sidebar.jsp" />

        <div class="sm:ml-64 pl-4 pt-4" >
            
            <jsp:include page="status.jsp" />
            
            <h1 class="text-7xl">
                My Courses
            </h1>


            <div class="mt-12 relative overflow-x-auto shadow-md sm:rounded-lg">
                <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                    
                    <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                        <tr>
                            <th scope="col" class="px-6 py-3 bg-gray-50 dark:bg-gray-800">
                                course id
                            </th>
                            <th scope="col" class="px-6 py-3">
                                course name
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Student student = (Student) request.getAttribute("student_with_enrollments");   
                            ArrayList<Course> courses = student.getEnrolledCourses();
                        %>
                        
                        <%  for (int i = 0; i < student.getEnrolledCourses().size(); i++) { %>

                            <tr class="border-b border-gray-200 dark:border-gray-700">
                                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                    <%= courses.get(i).getId() %>
                                </th>
                                <td class="px-6 py-4">
                                    <%= courses.get(i).getName() %>
                                </td>
                            </tr>
                        
                        <% } %>

                    </tbody>
                </table>
            </div>
    </body>
</html>
