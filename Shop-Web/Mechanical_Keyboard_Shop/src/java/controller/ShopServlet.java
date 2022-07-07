/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CategoryDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class ShopServlet extends HttpServlet {

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
            out.println("<title>Servlet ShopServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopServlet at " + request.getContextPath() + "</h1>");
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
        // connect
        ProductDBContext productDB = new ProductDBContext();
        CategoryDBContext categoryDB = new CategoryDBContext();

        PrintWriter out = response.getWriter();

        ArrayList<Category> categories = categoryDB.getAllCategories();
        
        
        String search = request.getParameter("search");
        if (search == null || search.length() ==0 ) {
            search = "";
        }
        String category = request.getParameter("category");
        if ( category == null) {
            category = "0";
        }
        int totalRow = productDB.getRowCount(category, search);
        int pageSize = 6;
        
        
        String page = request.getParameter("page");
        if (page == null || page.length() == 0 || page.equals("0")) {
            page = "1";
        }
        
        int pageIndex = Integer.parseInt(page);
        
        int totalPage = (totalRow % pageSize == 0) ? (totalRow / pageSize) : (totalRow / pageSize + 1);

        
        
        
//        if(){}
        ArrayList<Product> products = productDB.getSearchPaggingProducts(pageSize, pageIndex, category, search);
        ArrayList<Product> sellProducts = productDB.getTopSellProducts();
        
//        out.println(""+productDB.getSearchPaggingProducts(pageSize, pageIndex, category, search).get(0).getName() );;
//        
//        
//        out.println("  "+ pageIndex + "  "+totalPage + "  "+category + "  "+search);
        
        request.setAttribute("category", category);
        request.setAttribute("search", search);
        request.setAttribute("totalpage", totalPage);
        request.setAttribute("pageindex", pageIndex);
        request.setAttribute("products", products);
        request.setAttribute("sellProducts", sellProducts);
        request.setAttribute("categories", categories);
//        request.setAttribute("p", p);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
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
