/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDB;
import dal.CourseDB;
import dal.LearnDB;
import dal.TeacherDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Course;
import model.Learn;
import model.Teacher;

/**
 *
 * @author Admin
 */
public class InfoServlet extends HttpServlet {

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
            out.println("<title>Servlet InfoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InfoServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("utf-8");

//        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        TeacherDB teacherDB = new TeacherDB();
        CourseDB courseDB = new CourseDB();
        LearnDB learnDB = new LearnDB();

        Account user = (Account) request.getSession().getAttribute("user");

        ArrayList<Teacher> teachers = teacherDB.getTeachers();
        if (user != null) {
            ArrayList<Learn> learns = learnDB.getStudentLearns(user.getId() + "");
            ArrayList<Learn> cour = learnDB.getStudentCourses(user.getId() + "");
            
            double total = 0;
            for (Learn l : learns) {
                total = total + l.getCourse().getPrice();
            }
            
            
            request.setAttribute("learns", learns);
            request.setAttribute("cour",cour );
            request.setAttribute("coursesize",cour.size() );
            request.setAttribute("teachers", teachers);
            request.setAttribute("total", total);

            request.getRequestDispatcher("info.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/home");

        }

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
        AccountDB accDB = new AccountDB();

        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");;
        String DOB = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String img = request.getParameter("img");

//        out.println(""+ gender);
        accDB.updateAccount(id, firstName, lastName, DOB, gender, phone, img);
        
        request.getSession().setAttribute("user", accDB.getAccount(id));

        doGet(request, response);
//        response.sendRedirect(request.getContextPath()+"/info");

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
