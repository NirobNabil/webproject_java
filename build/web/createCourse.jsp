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
        <jsp:include page="header.jsp" />
    </head>
    <script>
        const handleCreateCourse = (e, form) => {
            console.log(new FormData(form));
            e.preventDefault();
            const name = document.getElementById("name").value;
            fetch('createCourse', {
                method: 'POST',
                body: new URLSearchParams(new FormData(form))
            })
            return false;
        }
    </script>
    <body class="font-raleway p-8 " >
        
        <jsp:include page="sidebar.jsp" />
        
        
        
        <div class="ml-64 pl-4 pt-4" >
            
            <jsp:include page="status.jsp" />
            
            
            <h1 class="text-7xl" > Create Course </h1>
            <form action="createCourse" method="post">
                <div class="mb-6 font-raleway mt-8">
                  <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Course name</label>
                  <input type="name" id="name" name="name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="name@flowbite.com" required>
                </div>
                <button type="submit" class="mt-8 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Create Course</button>
            </form>
            

            <div class="mt-12 relative overflow-x-auto shadow-md sm:rounded-lg">
                <%
                    ArrayList<Course> courses_t = (ArrayList<Course>) request.getAttribute("courses");
                %>

              <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                  <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                      <tr>
                          <th scope="col" class="px-6 py-3 bg-gray-50 dark:bg-gray-800">
                              Course id
                          </th>
                          <th scope="col" class="px-6 py-3">
                              Course name
                          </th>
                      </tr>
                  </thead>
                  <tbody>

                      <% for (int i = 0; i < courses_t.size(); i++) { %>

                      <tr class="border-b border-gray-200 dark:border-gray-700">
                          <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                              <%= courses_t.get(i).getId() %>
                          </th>
                          <td class="px-6 py-4">
                              <%= courses_t.get(i).getName() %>
                          </td>
                      </tr>

                      <% } %>

                  </tbody>
              </table>
            </div>
        <div>
        
    </body>
</html>
