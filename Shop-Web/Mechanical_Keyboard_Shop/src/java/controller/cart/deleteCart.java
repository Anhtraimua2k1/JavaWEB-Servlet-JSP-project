/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.cart;

import dal.CategoryDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.Order;
import model.Product;

/**
 *
 * @author Admin
 */
public class deleteCart extends HttpServlet {

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
            out.println("<title>Servlet deleteCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet deleteCart at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        ProductDBContext productDB = new ProductDBContext();
        CategoryDBContext categoryDB = new CategoryDBContext();

//        
//        Product p = new Product();
        Order order = new Order();
        Product products = new Product();
        ArrayList<Cart> carts = new ArrayList<>();
// take cookies to cart
        Cookie[] cookies = request.getCookies();
        for (Cookie c : cookies) {
            String product = c.getName();
            if (product.contains("productId")) {
                int id = Integer.parseInt(product.substring(9));
                int quantity = Integer.parseInt(c.getValue());
                Product p = productDB.getProductsById(id);

                Cart cart = new Cart();
                cart.setProduct(p);
                cart.setQuantity(quantity);
                carts.add(cart);

                c.setMaxAge(0);
                response.addCookie(c);
            }
        }

        int id = Integer.parseInt(request.getParameter("id"));

        for (int i = 0; i < carts.size(); i++) {
            Cart cart = carts.get(i);

            if (cart.getProduct().getId() == id) {

                Cookie c = new Cookie("productId" + cart.getProduct().getId(), "");
                c.setMaxAge(0);

                response.addCookie(c);
                carts.remove(i);
            }

        }// have product

        request.getSession().setAttribute("listCarts", carts);

        for (Cart cart : carts) {
            Cookie c = new Cookie("productId" + cart.getProduct().getId(), "" + cart.getQuantity());
            c.setMaxAge(3600 * 24 * 7 * 365);
            response.addCookie(c);
        }

        if (request.getParameter("from") != null) {
            response.sendRedirect(request.getContextPath() + "/cart");
        } else {

            response.sendRedirect(request.getContextPath() + "/shop");
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
