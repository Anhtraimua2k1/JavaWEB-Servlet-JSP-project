/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDBContext;
import dal.CategoryDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

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

        ProductDBContext productDB = new ProductDBContext();
        CategoryDBContext categoryDB = new CategoryDBContext();

        ArrayList<Category> categories = categoryDB.getAllCategories();
        ArrayList<Product> products = productDB.getAllProducts();

        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("login.jsp").include(request, response);
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
        PrintWriter out = response.getWriter();

        if (request.getSession().getAttribute("account") != null) {
            response.sendRedirect("home");
        }
        String message;
        AccountDBContext accDB = new AccountDBContext();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstname = request.getParameter("first_name");
        String lastname = request.getParameter("last_name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        if (firstname == null && lastname == null) {  // login

            Account a = accDB.getAccount(username, password);

            if (a == null) {
                message = "Wrong Username or Password";
                request.setAttribute("loginMessage", message);
                this.doGet(request, response);
            } else {
                request.getSession().setAttribute("account", a);
                response.sendRedirect(request.getContextPath() + "/home");
            }

        } else {     //sign up
            if (accDB.checkAccount(username) == false) {
                accDB.createAccount(username, password, firstname, lastname, phone, address);
                response.sendRedirect("login");
            } else {
                message = "Username has exist!";
                request.setAttribute("signupMessage", message);

                this.doGet(request, response);
            }
        }

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
