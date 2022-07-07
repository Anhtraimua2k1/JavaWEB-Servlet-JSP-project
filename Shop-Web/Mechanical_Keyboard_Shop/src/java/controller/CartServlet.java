/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CategoryDBContext;
import dal.OrderDBContext;
import dal.Order_ItemBDContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Cart;
import model.Category;
import model.Order;
import model.Product;

/**
 *
 * @author Admin
 */
public class CartServlet extends HttpServlet {

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
            out.println("<title>Servlet CartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        // connect
        ProductDBContext productDB = new ProductDBContext();
        CategoryDBContext categoryDB = new CategoryDBContext();

        PrintWriter out = response.getWriter();

        ArrayList<Category> categories = categoryDB.getAllCategories();

        Cart a = new Cart();

        request.setAttribute("categories", categories);
//        request.setAttribute("p", p);request.getContextPath()+ "/
        request.getRequestDispatcher("viewcart.jsp").forward(request, response);

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
        String[] productId = request.getParameterValues("productId");

        OrderDBContext orderDB = new OrderDBContext();
        Order_ItemBDContext orderItemDB = new Order_ItemBDContext();

        Account a = (Account) request.getSession().getAttribute("account");
        
        if(a==null){
            response.sendRedirect(request.getContextPath()+"/login");
        }else{
        orderDB.createOrder(a.getId() + "");
        Order o = orderDB.getNewAccountOrder(a.getId() + "");
        PrintWriter out = response.getWriter();
        
//                for (int i = 0; i < productId.length; i++) {
//            out.println(""+ productId[i]);
//        }
//        
//        out.println(""+ productId);
        for (int i = 0; i < productId.length; i++) {
            String quantity = request.getParameter("quantity"+ productId[i]);
            orderItemDB.createOrderItem(o.getId()+"", productId[i], quantity);
        }
        
        orderDB.updateTotalOrders();
        
                Cookie[] cookies = request.getCookies();
        for (Cookie c : cookies) {
            String product = c.getName();
            if (product.contains("productId")) {   
                c.setMaxAge(0);
                response.addCookie(c);
            }
        }
        
        response.sendRedirect(request.getContextPath()+"/home");
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
