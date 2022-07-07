/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
public class SchoolServlet extends HttpServlet {

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
            out.println("<title>Servlet SchoolServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SchoolServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        TeacherDB teacherDB = new TeacherDB();
        scheduleDB scheduleDB = new scheduleDB();
        CourseDB courseDB = new CourseDB();

        ArrayList<Schedule> schedules = scheduleDB.getSchedules();
        ArrayList<Teacher> teachers = teacherDB.getTeachers();
//        processRequest(request, response);

        request.setAttribute("URI", request.getRequestURI());
        request.setAttribute("contextPath", request.getContextPath());
        request.setAttribute("teachers", teachers);
        request.setAttribute("schedules", schedules);

        String search = request.getParameter("search");
        if (search == null || search.length() == 0) {
            search = "";
        }
        String teacher = request.getParameter("teacher");
        if (teacher == null) {
            teacher = "0";
        }

        int totalrow = courseDB.getRowCount(teacher, search);
        int pagesize = 6;

        String page = request.getParameter("page");
        if (page == null || page.length() == 0) {
            page = "1";
        }

        int pageindex = Integer.parseInt(page);

        int totalpage = (totalrow % pagesize == 0) ? (totalrow / pagesize) : (totalrow / pagesize + 1);

        if (pageindex < 1) {
            response.sendRedirect(request.getContextPath() + "/school?page=1&search=" + search + "&teacher=" + teacher);
        } else if (pageindex > totalpage) {

            response.sendRedirect(request.getContextPath() + "/school?page=" + totalpage + "&search=" + search + "&teacher=" + teacher);
        } else {
            ArrayList<Course> courses = courseDB.getPaggingSearchCourses(pagesize, pageindex, teacher, search);

            request.setAttribute("pageindex", pageindex);
            request.setAttribute("totalpage", totalpage);
            request.setAttribute("courses", courses);
            request.setAttribute("teacher", teacher);
            
            
            request.getRequestDispatcher("school.jsp").forward(request, response);
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
        processRequest(request, response);
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
