<%-- 
    Document   : sidebar
    Created on : May 6, 2023, 1:44:24 PM
    Author     : twin_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<button data-drawer-target="default-sidebar" data-drawer-toggle="default-sidebar" aria-controls="default-sidebar" type="button" class="inline-flex items-center p-2 mt-2 ml-3 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
    <span class="sr-only">Open sidebar</span>
    <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewbox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
        <path clip-rule="evenodd" fill-rule="evenodd" d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z"></path>
    </svg>
</button>

<script>
    function logout(){
        const cookies = document.cookie.split(";");

        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i];
            const eqPos = cookie.indexOf("=");
            const name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
            document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
        }
        window.location.replace("index.jsp");
    }
    if( document.cookie == "" ) {
        window.location.replace("index");
    }
</script>

<aside id="default-sidebar" class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full sm:translate-x-0" aria-label="Sidebar">
    <div class="h-full px-3 py-4 overflow-y-auto bg-gray-50 dark:bg-gray-800 flex flex-col grow">
        <h3 class="ml-3 my-8 text-2xl" >Web Project</h3>
        <% 
            
//            import jakarta.servlet.http.*;
            Cookie[] cookies = request.getCookies();

            String cookieName = "role";

            String defaultValue = "default";
            String role = "default";

            try {
                for ( int i=0; i<cookies.length; i++) {

                    Cookie cookie = cookies[i];

                    if (cookieName.equals(cookie.getName())) {
                        role = cookie.getValue();
                        break;
                    }

                    role = defaultValue;

                }
            } catch(Exception e) {}
        %>
        
        <ul class="space-y-2 font-medium flex flex-col">
            <% if( role.equals("admin") ) { %>
            <li>
                <a href="/WebApplication1/createCourse" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                    <svg class="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 110.46 122.88"><defs><style>.cls-1{fill-rule:evenodd;}</style></defs><title>legal-contract-paper</title><path class="cls-1" d="M78.06,80.32a2.94,2.94,0,0,1,1.8.56c.7.45,1.49,1.33,2.47,1.88,1.38.79,3.93-.29,5.23,1.65a5.11,5.11,0,0,1,.85,2.89,5,5,0,0,0,1.2,3.08c1.6,2.12,1.93,3.53,1.11,5-.57,1-1.75,1.56-2,2.19-.58,1.35.06,2.36-.73,3.94a4.19,4.19,0,0,1-2.55,2.17c-1,.31-1.93-.14-2.7.19-1.35.57-2.34,1.89-3.42,2.23a4.06,4.06,0,0,1-1.24.19,4.11,4.11,0,0,1-1.24-.19c-1.08-.33-2.07-1.66-3.42-2.23-.77-.32-1.73.12-2.7-.19a4.11,4.11,0,0,1-2.54-2.17c-.8-1.58-.16-2.59-.74-3.94-.27-.64-1.45-1.2-2-2.19-.83-1.47-.5-2.88,1.11-5a5.06,5.06,0,0,0,1.2-3.08,5.07,5.07,0,0,1,.85-2.89c1.3-1.94,3.86-.85,5.23-1.65,1-.55,1.77-1.44,2.47-1.88a3,3,0,0,1,1.8-.56ZM15.63,122.87c-3.94.06-7.4-.11-10.13-1.39C2.05,119.86,0,116.8,0,111v-5.29H15.1V13.39c-.22-5.31,1.07-8.61,3.44-10.67S24.11.08,27.89,0c.18-.09,74.82,0,82.57,0V110.15c0,4.46-1.1,7.62-3.36,9.73s-5.46,3-9.78,3ZM34.05,23.51a2.13,2.13,0,1,1,0-4.26H72.9a2.13,2.13,0,0,1,0,4.26Zm0,14.51a2.13,2.13,0,0,1,0-4.26h57.1a2.13,2.13,0,0,1,0,4.26Zm0,43.5a2.12,2.12,0,0,1,0-4.24H53.76a2.12,2.12,0,0,1,0,4.24Zm0-14.49a2.13,2.13,0,0,1,0-4.26h57.1a2.13,2.13,0,0,1,0,4.26Zm0-14.54a2.1,2.1,0,1,1,0-4.2H91.48a2.1,2.1,0,1,1,0,4.2ZM33,96.81c4.94-6.49,9.15-3.55,15,.55l.87.61c1.61,1.12,3.48-.53,5.25-2.1a22,22,0,0,1,2.62-2.09l1.82,2.87a18.92,18.92,0,0,0-2.18,1.76c-2.76,2.43-5.65,5-9.44,2.35l-.89-.62c-4.31-3-7.4-5.17-10.37-1.27L33,96.81ZM15.1,110H4.26v1c0,3.83,1.14,5.74,3,6.63s4.61,1,7.81,1V110Zm91.11.18V4.3H27.91c-2.83,0-5.15.39-6.59,1.63s-2.14,3.47-2,7.36V118.61h78c3.22,0,5.51-.56,6.88-1.85s2-3.4,2-6.61ZM78.06,85.52a7.78,7.78,0,1,1-7.77,7.78,7.78,7.78,0,0,1,7.77-7.78Z"/></svg>
                    <span class="ml-3 ">Create Course</span>
                </a>
            </li>
<!--            <li>
                <a href="/WebApplication1/createTeacher" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                    <svg class="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white"  data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 116.79 122.88"><defs><style>.cls-1{fill-rule:evenodd;}</style></defs><title>female-user</title><path class="cls-1" d="M75.4,74c-6.51,11.9-26,12.82-35,.82h0c2.81-1,4.86-2.43,5.53-4.32a19.85,19.85,0,0,0,11.3,3.83c4.6,0,9.15-1.91,13.24-5,.46,2,2.31,3.57,5,4.72ZM30.92,76.52C24.24,78,18,79.88,13.67,82.39c-10,5.85-9.45,19.77-11.86,31-.68,3.17-1.36,6.33-1.81,9.5H22.89V115.2a2.31,2.31,0,1,1,4.61,0v7.68H89.23V115.2a2.31,2.31,0,1,1,4.62,0v7.68h22.94c-.39-2.06-.84-4.09-1.18-6.19-1.88-11.73-1.89-28.4-13-34.23-4.94-2.6-12.08-4.63-19-6.42,10.25,1.28,23-.69,24.66-5.44-15.07-1.22-19.8-24.35-19.7-41.19C86.11,4.64,63.88-4.72,46.68,2.23,25,11,27.87,30.12,25.82,48.11,24.47,59.87,20.46,69.72,9.56,70.6c1.53,4.31,12,6.43,21.36,5.92ZM64.64,18.3c-10.12,10.24-20.79,14.25-32,17.09a6.74,6.74,0,0,0-.11,1.81c0,15.48,11.68,34.06,24.71,34.06S83.4,52.68,83.4,37.2a21.28,21.28,0,0,0-1.1-6.93c-9.84-.11-13.67-5.06-17.66-12Z"/></svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Add teacher</span>
                </a>
            </li>-->
            <li>
                <a href="/WebApplication1/assignCourse" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                    <svg class="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" xmlns="http://www.w3.org/2000/svg" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" image-rendering="optimizeQuality" fill-rule="evenodd" clip-rule="evenodd" viewBox="0 0 512 469.74"><path d="M412.27 270.29c55.1 0 99.73 44.66 99.73 99.72 0 55.1-44.66 99.73-99.73 99.73-55.09 0-99.72-44.65-99.72-99.73 0-55.1 44.65-99.72 99.72-99.72zM232.93 0c31.47 0 61.6 6.3 89.09 17.69l.91.41c28.11 11.8 53.42 28.95 74.62 50.16 21.54 21.55 38.85 47.2 50.62 75.61 11.4 27.49 17.69 57.61 17.69 89.06 0 8.19-.43 16.3-1.27 24.27a122.985 122.985 0 0 0-34.04-10.18c.33-4.65.49-9.35.49-14.09 0-26.89-5.32-52.48-14.97-75.74a198.26 198.26 0 0 0-43.01-64.33c-18.1-18.13-39.61-32.72-63.49-42.74l-.87-.33c-23.27-9.65-48.85-14.97-75.77-14.97-26.91 0-52.5 5.32-75.76 14.97-24.26 10.02-46.07 24.74-64.31 43.01-18.13 18.1-32.72 39.62-42.74 63.5l-.33.87c-9.65 23.26-14.97 48.85-14.97 75.76 0 26.92 5.32 52.5 14.97 75.77a196.716 196.716 0 0 0 30.66 50.78c-.12-1.12 0-2.1.37-2.88 4.46-9.33 11.77-17.95 24.49-25.92 18.02-11.32 54.02-20.41 77.84-29.64-12.64 13.69-23.5 28.27-32.07 45.47l24.81-.61 55.7 44.49 58.45-44.49h.23c-1.52 7.8-2.33 15.86-2.33 24.11 0 30.5 10.99 58.46 29.24 80.1-26.18 10.16-54.63 15.75-84.25 15.75-31.45 0-61.58-6.29-89.08-17.69l-.92-.41c-28.12-11.8-53.42-28.95-74.62-50.15-21.49-21.5-38.79-47.14-50.59-75.6C6.3 294.53 0 264.4 0 232.93s6.3-61.59 17.69-89.08l.41-.92c11.8-28.12 28.95-53.42 50.16-74.62 21.48-21.49 47.12-38.79 75.6-50.59C171.34 6.3 201.46 0 232.93 0zM121.21 262.42c18.01-6.79 26.3-28.07 27.45-59.89.87-23.66-4.04-38.58 4.03-61.93 15.98-46.23 75.04-62.03 107.96-34.98 25.79-2.75 51.81 10.56 57.41 50.35 4.19 29.71-4.69 55.86 4.67 83.23 4.03 11.76 11.05 20.79 22 26.05l-1.55 1.39c-1.6 1.08-3.18 2.18-4.71 3.32-14.49 8.81-40.42 14.23-69.54 16.44v12.07l19.34 25.84-55.33 44-55.26-43.61 14.76-24.79v-14.68c-33.42-3.6-61.57-11.32-71.23-22.81zm177.26 57.45c-4.85-6.55-10.09-12.78-15.68-18.83 6.44 2.49 13.77 4.98 21.38 7.5-2.08 3.67-3.98 7.44-5.7 11.33zm97.21 6.85c-.04-4.9-.49-8.4 5.58-8.31l19.68.24c6.34-.04 8.03 1.97 7.95 7.93v26.83h26.68c4.89-.05 8.39-.49 8.3 5.58l-.24 19.67c.04 6.35-1.97 8.03-7.92 7.96h-26.82v26.81c.08 5.96-1.61 7.97-7.95 7.93l-19.68.24c-6.07.09-5.62-3.41-5.58-8.31v-26.67h-26.83c-5.95.07-7.96-1.61-7.92-7.96l-.24-19.67c-.09-6.07 3.41-5.63 8.3-5.58h26.69v-26.69z"/></svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Assign teacher</span>
                </a>
            </li>
            <% } %>
            
            <% if( role.equals("student") ) { %>
            <li>
                <a href="/WebApplication1/EnrollCourse" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                    <svg class="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" xmlns="http://www.w3.org/2000/svg" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" image-rendering="optimizeQuality" fill-rule="evenodd" clip-rule="evenodd" viewBox="0 0 512 469.74"><path d="M412.27 270.29c55.1 0 99.73 44.66 99.73 99.72 0 55.1-44.66 99.73-99.73 99.73-55.09 0-99.72-44.65-99.72-99.73 0-55.1 44.65-99.72 99.72-99.72zM232.93 0c31.47 0 61.6 6.3 89.09 17.69l.91.41c28.11 11.8 53.42 28.95 74.62 50.16 21.54 21.55 38.85 47.2 50.62 75.61 11.4 27.49 17.69 57.61 17.69 89.06 0 8.19-.43 16.3-1.27 24.27a122.985 122.985 0 0 0-34.04-10.18c.33-4.65.49-9.35.49-14.09 0-26.89-5.32-52.48-14.97-75.74a198.26 198.26 0 0 0-43.01-64.33c-18.1-18.13-39.61-32.72-63.49-42.74l-.87-.33c-23.27-9.65-48.85-14.97-75.77-14.97-26.91 0-52.5 5.32-75.76 14.97-24.26 10.02-46.07 24.74-64.31 43.01-18.13 18.1-32.72 39.62-42.74 63.5l-.33.87c-9.65 23.26-14.97 48.85-14.97 75.76 0 26.92 5.32 52.5 14.97 75.77a196.716 196.716 0 0 0 30.66 50.78c-.12-1.12 0-2.1.37-2.88 4.46-9.33 11.77-17.95 24.49-25.92 18.02-11.32 54.02-20.41 77.84-29.64-12.64 13.69-23.5 28.27-32.07 45.47l24.81-.61 55.7 44.49 58.45-44.49h.23c-1.52 7.8-2.33 15.86-2.33 24.11 0 30.5 10.99 58.46 29.24 80.1-26.18 10.16-54.63 15.75-84.25 15.75-31.45 0-61.58-6.29-89.08-17.69l-.92-.41c-28.12-11.8-53.42-28.95-74.62-50.15-21.49-21.5-38.79-47.14-50.59-75.6C6.3 294.53 0 264.4 0 232.93s6.3-61.59 17.69-89.08l.41-.92c11.8-28.12 28.95-53.42 50.16-74.62 21.48-21.49 47.12-38.79 75.6-50.59C171.34 6.3 201.46 0 232.93 0zM121.21 262.42c18.01-6.79 26.3-28.07 27.45-59.89.87-23.66-4.04-38.58 4.03-61.93 15.98-46.23 75.04-62.03 107.96-34.98 25.79-2.75 51.81 10.56 57.41 50.35 4.19 29.71-4.69 55.86 4.67 83.23 4.03 11.76 11.05 20.79 22 26.05l-1.55 1.39c-1.6 1.08-3.18 2.18-4.71 3.32-14.49 8.81-40.42 14.23-69.54 16.44v12.07l19.34 25.84-55.33 44-55.26-43.61 14.76-24.79v-14.68c-33.42-3.6-61.57-11.32-71.23-22.81zm177.26 57.45c-4.85-6.55-10.09-12.78-15.68-18.83 6.44 2.49 13.77 4.98 21.38 7.5-2.08 3.67-3.98 7.44-5.7 11.33zm97.21 6.85c-.04-4.9-.49-8.4 5.58-8.31l19.68.24c6.34-.04 8.03 1.97 7.95 7.93v26.83h26.68c4.89-.05 8.39-.49 8.3 5.58l-.24 19.67c.04 6.35-1.97 8.03-7.92 7.96h-26.82v26.81c.08 5.96-1.61 7.97-7.95 7.93l-19.68.24c-6.07.09-5.62-3.41-5.58-8.31v-26.67h-26.83c-5.95.07-7.96-1.61-7.92-7.96l-.24-19.67c-.09-6.07 3.41-5.63 8.3-5.58h26.69v-26.69z"/></svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Enroll Course</span>
                </a>
            </li>
            
            <li>
                <a href="/WebApplication1/MyCoursesAsStudent" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                    <svg class="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" xmlns="http://www.w3.org/2000/svg" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" image-rendering="optimizeQuality" fill-rule="evenodd" clip-rule="evenodd" viewBox="0 0 512 469.74"><path d="M412.27 270.29c55.1 0 99.73 44.66 99.73 99.72 0 55.1-44.66 99.73-99.73 99.73-55.09 0-99.72-44.65-99.72-99.73 0-55.1 44.65-99.72 99.72-99.72zM232.93 0c31.47 0 61.6 6.3 89.09 17.69l.91.41c28.11 11.8 53.42 28.95 74.62 50.16 21.54 21.55 38.85 47.2 50.62 75.61 11.4 27.49 17.69 57.61 17.69 89.06 0 8.19-.43 16.3-1.27 24.27a122.985 122.985 0 0 0-34.04-10.18c.33-4.65.49-9.35.49-14.09 0-26.89-5.32-52.48-14.97-75.74a198.26 198.26 0 0 0-43.01-64.33c-18.1-18.13-39.61-32.72-63.49-42.74l-.87-.33c-23.27-9.65-48.85-14.97-75.77-14.97-26.91 0-52.5 5.32-75.76 14.97-24.26 10.02-46.07 24.74-64.31 43.01-18.13 18.1-32.72 39.62-42.74 63.5l-.33.87c-9.65 23.26-14.97 48.85-14.97 75.76 0 26.92 5.32 52.5 14.97 75.77a196.716 196.716 0 0 0 30.66 50.78c-.12-1.12 0-2.1.37-2.88 4.46-9.33 11.77-17.95 24.49-25.92 18.02-11.32 54.02-20.41 77.84-29.64-12.64 13.69-23.5 28.27-32.07 45.47l24.81-.61 55.7 44.49 58.45-44.49h.23c-1.52 7.8-2.33 15.86-2.33 24.11 0 30.5 10.99 58.46 29.24 80.1-26.18 10.16-54.63 15.75-84.25 15.75-31.45 0-61.58-6.29-89.08-17.69l-.92-.41c-28.12-11.8-53.42-28.95-74.62-50.15-21.49-21.5-38.79-47.14-50.59-75.6C6.3 294.53 0 264.4 0 232.93s6.3-61.59 17.69-89.08l.41-.92c11.8-28.12 28.95-53.42 50.16-74.62 21.48-21.49 47.12-38.79 75.6-50.59C171.34 6.3 201.46 0 232.93 0zM121.21 262.42c18.01-6.79 26.3-28.07 27.45-59.89.87-23.66-4.04-38.58 4.03-61.93 15.98-46.23 75.04-62.03 107.96-34.98 25.79-2.75 51.81 10.56 57.41 50.35 4.19 29.71-4.69 55.86 4.67 83.23 4.03 11.76 11.05 20.79 22 26.05l-1.55 1.39c-1.6 1.08-3.18 2.18-4.71 3.32-14.49 8.81-40.42 14.23-69.54 16.44v12.07l19.34 25.84-55.33 44-55.26-43.61 14.76-24.79v-14.68c-33.42-3.6-61.57-11.32-71.23-22.81zm177.26 57.45c-4.85-6.55-10.09-12.78-15.68-18.83 6.44 2.49 13.77 4.98 21.38 7.5-2.08 3.67-3.98 7.44-5.7 11.33zm97.21 6.85c-.04-4.9-.49-8.4 5.58-8.31l19.68.24c6.34-.04 8.03 1.97 7.95 7.93v26.83h26.68c4.89-.05 8.39-.49 8.3 5.58l-.24 19.67c.04 6.35-1.97 8.03-7.92 7.96h-26.82v26.81c.08 5.96-1.61 7.97-7.95 7.93l-19.68.24c-6.07.09-5.62-3.41-5.58-8.31v-26.67h-26.83c-5.95.07-7.96-1.61-7.92-7.96l-.24-19.67c-.09-6.07 3.41-5.63 8.3-5.58h26.69v-26.69z"/></svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">My Courses</span>
                </a>
            </li>
            <% } %>

            <% if( role.equals("teacher") ) { %>
            <li>
                <a href="/WebApplication1/MyCourses" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
                    <svg class="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" xmlns="http://www.w3.org/2000/svg" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" image-rendering="optimizeQuality" fill-rule="evenodd" clip-rule="evenodd" viewBox="0 0 512 469.74"><path d="M412.27 270.29c55.1 0 99.73 44.66 99.73 99.72 0 55.1-44.66 99.73-99.73 99.73-55.09 0-99.72-44.65-99.72-99.73 0-55.1 44.65-99.72 99.72-99.72zM232.93 0c31.47 0 61.6 6.3 89.09 17.69l.91.41c28.11 11.8 53.42 28.95 74.62 50.16 21.54 21.55 38.85 47.2 50.62 75.61 11.4 27.49 17.69 57.61 17.69 89.06 0 8.19-.43 16.3-1.27 24.27a122.985 122.985 0 0 0-34.04-10.18c.33-4.65.49-9.35.49-14.09 0-26.89-5.32-52.48-14.97-75.74a198.26 198.26 0 0 0-43.01-64.33c-18.1-18.13-39.61-32.72-63.49-42.74l-.87-.33c-23.27-9.65-48.85-14.97-75.77-14.97-26.91 0-52.5 5.32-75.76 14.97-24.26 10.02-46.07 24.74-64.31 43.01-18.13 18.1-32.72 39.62-42.74 63.5l-.33.87c-9.65 23.26-14.97 48.85-14.97 75.76 0 26.92 5.32 52.5 14.97 75.77a196.716 196.716 0 0 0 30.66 50.78c-.12-1.12 0-2.1.37-2.88 4.46-9.33 11.77-17.95 24.49-25.92 18.02-11.32 54.02-20.41 77.84-29.64-12.64 13.69-23.5 28.27-32.07 45.47l24.81-.61 55.7 44.49 58.45-44.49h.23c-1.52 7.8-2.33 15.86-2.33 24.11 0 30.5 10.99 58.46 29.24 80.1-26.18 10.16-54.63 15.75-84.25 15.75-31.45 0-61.58-6.29-89.08-17.69l-.92-.41c-28.12-11.8-53.42-28.95-74.62-50.15-21.49-21.5-38.79-47.14-50.59-75.6C6.3 294.53 0 264.4 0 232.93s6.3-61.59 17.69-89.08l.41-.92c11.8-28.12 28.95-53.42 50.16-74.62 21.48-21.49 47.12-38.79 75.6-50.59C171.34 6.3 201.46 0 232.93 0zM121.21 262.42c18.01-6.79 26.3-28.07 27.45-59.89.87-23.66-4.04-38.58 4.03-61.93 15.98-46.23 75.04-62.03 107.96-34.98 25.79-2.75 51.81 10.56 57.41 50.35 4.19 29.71-4.69 55.86 4.67 83.23 4.03 11.76 11.05 20.79 22 26.05l-1.55 1.39c-1.6 1.08-3.18 2.18-4.71 3.32-14.49 8.81-40.42 14.23-69.54 16.44v12.07l19.34 25.84-55.33 44-55.26-43.61 14.76-24.79v-14.68c-33.42-3.6-61.57-11.32-71.23-22.81zm177.26 57.45c-4.85-6.55-10.09-12.78-15.68-18.83 6.44 2.49 13.77 4.98 21.38 7.5-2.08 3.67-3.98 7.44-5.7 11.33zm97.21 6.85c-.04-4.9-.49-8.4 5.58-8.31l19.68.24c6.34-.04 8.03 1.97 7.95 7.93v26.83h26.68c4.89-.05 8.39-.49 8.3 5.58l-.24 19.67c.04 6.35-1.97 8.03-7.92 7.96h-26.82v26.81c.08 5.96-1.61 7.97-7.95 7.93l-19.68.24c-6.07.09-5.62-3.41-5.58-8.31v-26.67h-26.83c-5.95.07-7.96-1.61-7.92-7.96l-.24-19.67c-.09-6.07 3.41-5.63 8.3-5.58h26.69v-26.69z"/></svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">My courses</span>
                </a>
            </li>
            <% } %>
            
            <li class="flex justify-self-end " >
                <button onclick="logout()" type="button" class="mx-2 w-full mt-8 text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Logout</button>
            </li>
            
        </ul>
    </div>
</aside>
