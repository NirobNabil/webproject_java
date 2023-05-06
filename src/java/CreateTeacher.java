/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.util.ArrayList;
import model.Teacher;
import dto.TeacherDto;

/**
 *
 * @author twin_n
 */
public class CreateTeacher extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");

            ArrayList<Teacher> teachers = new ArrayList<>();
            try {
                teachers = TeacherDto.getTeachers();
            } catch (Exception ex) {
                System.out.println("Couldn't get courses");
            }

            System.out.println(teachers.size());

            request.setAttribute("teachers", teachers);

            request.getRequestDispatcher("createTeachers.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws IOException {

        String name = request.getParameter("name");

        Teacher teacher = new Teacher(name);

        try {
            TeacherDto.createTeacher(teacher);
        } catch( Exception e ) {
            System.out.println("sql didnt work man. bummer");
        }

        PrintWriter out = response.getWriter();
        out.println("got it mam " + name );
    }

}
