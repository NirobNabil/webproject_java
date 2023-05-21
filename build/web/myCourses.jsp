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
    <script>
        function khulja(g){ 
            document.querySelectorAll('.course_enrollment_containers').forEach( (a) => {
                a.style.display = "none";
            } )
            document.querySelector('#'+g).style.display = "block";
        }
    </script>
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
                            
                            <th scope="col" class="px-6 py-3">
                                enrolled students
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Course> courses = (ArrayList<Course>) request.getAttribute("courses_with_assignments");                            
                    %>
                        
                        
                    

                    <!-- drawer component -->
                    <div id="drawer-right-example" class="fixed top-0 right-0 z-40 h-screen p-4 overflow-y-auto transition-transform translate-x-full bg-white dark:bg-gray-800" tabindex="-1" aria-labelledby="drawer-right-label">
                        <%
                            ArrayList<Course> courses_with_enrollments = (ArrayList<Course>) request.getAttribute("courses_with_enrollments");
                            
                            for( int i=0; i<courses_with_enrollments.size(); i++ ) {
                        %>
                            <div id="<%= courses_with_enrollments.get(i).getName() %>" class="course_enrollment_containers">
                                <ul class="mx-8 w-48 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg dark:bg-gray-700 dark:border-gray-600 dark:text-white">
                                <%
                                    ArrayList<Student> students = courses_with_enrollments.get(i).getEnrolledStudents();
                                    for( int x=0; x<students.size(); x++ ) {
                                %>
                                    <li class="w-full px-4 py-2 border-b border-gray-200 bg-gray-200 rounded-md dark:border-gray-600">
                                        <%= students.get(x).getName() %>
                                    </li>
                                <%
                                    }
                                %>
                            </div>
                        <% } %>

                        
                        <%  for (int i = 0; i < courses.size(); i++) { %>

                            <tr class="border-b border-gray-200 dark:border-gray-700">
                                <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                    <%= courses.get(i).getId() %>
                                </td>
                                
                                <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                    <%= courses.get(i).getName() %>
                                    <!-- drawer init and toggle -->
                                </td>
                                
                                <td class="p-4" >
                                    <button onclick="khulja('<%= courses.get(i).getName() %>')" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800" type="button" data-drawer-target="drawer-right-example" data-drawer-show="drawer-right-example" data-drawer-placement="right" aria-controls="drawer-right-example">
                                        view enrolled students
                                    </button>
                                </td>
                                
                                
                                
                                
                            </tr>
                        
                        <% } %>

                    </tbody>
                </table>
            </div>
    </body>
</html>
