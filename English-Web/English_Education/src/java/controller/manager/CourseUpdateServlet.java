/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.manager;

import dal.CourseDB;
import dal.TeacherDB;
import dal.scheduleDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.Schedule;
import model.Teacher;

/**
 *
 * @author Admin
 */
public class CourseUpdateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CourseUpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseUpdateServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        CourseDB courseDB = new CourseDB();
        TeacherDB teacherDB = new TeacherDB();
        scheduleDB scheduleDB = new scheduleDB();

        ArrayList<Schedule> schedules = scheduleDB.getSchedules();
        ArrayList<Teacher> teachers = teacherDB.getTeachers();

        Course course = courseDB.getCourse(request.getParameter("id"));

        if (course == null) {
            response.sendRedirect("../../home");
        } else {
            request.setAttribute("URI", request.getRequestURI());
            request.setAttribute("contextPath", request.getContextPath());
            request.setAttribute("teachers", teachers);
            request.setAttribute("schedules", schedules);
            request.setAttribute("course", course);
            request.getRequestDispatcher("../../view/course/manager/create-update.jsp").forward(request, response);
        }
//        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        CourseDB courseDB = new CourseDB();

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String instruction = request.getParameter("instruction");
        String description = request.getParameter("description");
        String schedule = request.getParameter("schedule");
        String lesson = request.getParameter("lesson");
        String week = request.getParameter("week");
        String price = request.getParameter("price");
        String teacherId = request.getParameter("teacher");
        String img = request.getParameter("img");
        PrintWriter out = response.getWriter();

        courseDB.updateCourse(id, name, instruction, description, schedule, lesson, week, price, teacherId, img);
        out.println(" " + id + " " + name + " " + instruction + " " + description + " " + schedule + " " + lesson + " " + week + " " + price + " " + teacherId + " " + img);

        response.sendRedirect(request.getRequestURI() + "?id=" + id);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
