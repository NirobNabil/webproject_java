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
        <jsp:include page="header.jsp" />
    </head>
    <body class="font-raleway p-8 " >
        
        <jsp:include page="sidebar.jsp" />

        <div class="sm:ml-64 pl-4 pt-4" >
            
            <jsp:include page="status.jsp" />
            
            <h1 class="text-7xl">
                Assign Teacher
            </h1>

            <form action="assignCourse" method="post" class=" mt-8">

                <label for="courseid" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select a course</label>
                <select name="courseid" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                    <%
                        ArrayList<Course> courses_t = (ArrayList<Course>) request.getAttribute("courses");

                        for (int i = 0; i < courses_t.size(); i++) {
                            out.println("<option value=\"" + courses_t.get(i).getId() + "\">" + courses_t.get(i).getName() + "</option>" );
                        }   

                    %>
                </select>

                <label for="teacherid" class="mt-8 block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select a teacher</label>
                <select name="teacherid" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                    <%
                        ArrayList<Teacher> teachers_t = (ArrayList<Teacher>) request.getAttribute("teachers");

                        for (int i = 0; i < teachers_t.size(); i++) {
                            out.println("<option value=\"" + teachers_t.get(i).getId() + "\">" + teachers_t.get(i).getName() + "</option>" );
                        }

                    %>
                </select>

                <button type="submit" class="mt-8 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Assign Teacher</button>

            </form>

            <div class="mt-12 relative overflow-x-auto shadow-md sm:rounded-lg">
                <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                    <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                        <tr>
                            <th scope="col" class="px-6 py-3 bg-gray-50 dark:bg-gray-800">
                                Course id
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Course name
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Assigned To
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Course> courses_tt = (ArrayList<Course>) request.getAttribute("courses_with_assignment");                            
                        %>
                        
                        <%  for (int i = 0; i < courses_tt.size(); i++) { %>

                            <tr class="border-b border-gray-200 dark:border-gray-700">
                                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                    <%= courses_tt.get(i).getId() %>
                                </th>
                                <td class="px-6 py-4">
                                    <%= courses_tt.get(i).getName() %>
                                </td>
                                <td class="px-6 py-4">
                                    <%= courses_tt.get(i).getAssignedTo().getName() %>
                                </td>
                            </tr>
                        
                        <% } %>

                    </tbody>
                </table>
            </div>
    </body>
</html>
