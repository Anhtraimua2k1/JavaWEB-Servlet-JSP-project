/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.user;

import dal.AccountDBContext;
import dal.CategoryDBContext;
import dal.OrderDBContext;
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
import model.Order;
import model.Product;

/**
 *
 * @author Admin
 */
public class UserInfoServlet extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");

        try (PrintWriter out = response.getWriter()) {

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

        Account a = (Account) request.getSession().getAttribute("account");

        if (a == null) {
            response.sendRedirect(request.getContextPath() + "/home");

        } else {
            
            OrderDBContext orderDB = new OrderDBContext();
            CategoryDBContext categoryDB = new CategoryDBContext();
//
            ArrayList<Category> categories = categoryDB.getAllCategories();
            ArrayList<Order> orders = orderDB.getAccountOrders(a.getId()+"");

            request.setAttribute("categories", categories);
            request.setAttribute("orders", orders);

            request.getRequestDispatcher("../userinfo.jsp").forward(request, response);
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

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        AccountDBContext accDB = new AccountDBContext();

        Account a = (Account) request.getSession().getAttribute("account");

        if (a == null) {
            response.sendRedirect(request.getContextPath() + "/home");
        } else {

            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            
            
//            out.println(" " + first_name + " " + last_name + " " + address+ " " + phone);
            accDB.updateUser(a.getId(), first_name, last_name, address, phone);
            
            Account update = accDB.getAccount(a.getId()+"");
            request.getSession().setAttribute("account", update);
            doGet(request, response);
            
//            response.sendRedirect(request.getContextPath()+"/user/info");
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
