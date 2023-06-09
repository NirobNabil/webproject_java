<%-- 
    Document   : assignCourse
    Created on : May 6, 2023, 1:28:50 AM
    Author     : twin_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
    import="model.Course, model.Student, java.util.ArrayList, dto.CookieDto"
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
                Enroll
            </h1>
            
            <% String userid = CookieDto.getCookie(request, "userid"); %>

            <form action="EnrollCourse" method="post" class=" mt-8">

                <label for="courseid" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select a course</label>
                <select name="courseid" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                    <%
                        ArrayList<Course> courses_t = (ArrayList<Course>) request.getAttribute("courses");

                        for (int i = 0; i < courses_t.size(); i++) {
                            out.println("<option value=\"" + courses_t.get(i).getId() + "\">" + courses_t.get(i).getName() + "</option>" );
                        }
                    %>
                </select>
                <input name="studentid" value="<%= userid %>" class="hidden" />

                <button type="submit" class="mt-8 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Enroll in course</button>

            </form>

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
