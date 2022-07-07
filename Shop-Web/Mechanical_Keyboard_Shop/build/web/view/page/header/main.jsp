<%@page import="java.io.PrintWriter"%>
<%@page import="dal.CategoryDBContext"%>
<%@page import="dal.ProductDBContext"%>
<%@page import="model.Order"%>
<%@page import="model.Product"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("utf-8");

    ProductDBContext productDB = new ProductDBContext();
    ArrayList<Cart> carts = new ArrayList<Cart>();
// take cookies to cart
    Cookie[] cookies = request.getCookies();
    for (Cookie c : cookies) {
        String productCart = c.getName();
        if (productCart.contains("productId")) {
            int id = Integer.parseInt(productCart.substring(9));
            int quantity = Integer.parseInt(c.getValue());
            Product p = productDB.getProductsById(id);

            Cart cart = new Cart();
            cart.setProduct(p);
            cart.setQuantity(quantity);
            if(cart.getProduct()!=null){
                carts.add(cart);
            }
            

            c.setMaxAge(0);
            response.addCookie(c);
        }
    }
    
    request.getSession().setAttribute("listCarts", carts);

    for (Cart cart : carts) {
        Cookie c = new Cookie("productId" + cart.getProduct().getId(), "" + cart.getQuantity());
        c.setMaxAge(3600 * 24 * 7 * 365);
        response.addCookie(c);
    }
%>

<%
//    ArrayList<Cart> carts = new ArrayList<>();
%>
<!-- MAIN HEADER -->
<div id="header">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- LOGO -->
            <div class="col-md-3">
                <div class="header-logo">
                    <a href="#" class="logo">
                        <img src="${pageContext.request.contextPath}/img/logo.png" alt="" style="width: 169px; height: 70px;">
                    </a>
                </div>
            </div>
            <!-- /LOGO -->

            <!-- SEARCH BAR -->
            <div class="col-md-6">
                <div class="header-search">
                    <form action="shop" method="get">
                        <select name="category" class="input-select">
                            <option value="0" >All Categories</option>

                            <c:forEach var="c" items="${requestScope.categories}">
                                <option value="${c.id}" <c:if test="${c.id eq requestScope.category}">selected</c:if> >${c.name}</option>
                            </c:forEach>


                        </select>
                        <input class="input" name="search" placeholder="Search here" value="${requestScope.search}">
                        <button class="search-btn">Search</button>
                    </form>
                </div>
            </div>
            <!-- /SEARCH BAR -->

            <!-- ACCOUNT -->
            <div class="col-md-3 clearfix">
                <div class="header-ctn">
                    <!-- Wishlist -->

                    <!-- /Wishlist -->
                    <%
                        double Total = 0;
//                        if (request.getSession().getAttribute("listCarts") != null) {
//                            ArrayList<Cart> carts = (ArrayList<Cart>) request.getSession().getAttribute("listCarts");
                    %> 
                    <!-- Cart -->
                    <div class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                            <i class="fa fa-shopping-cart"></i>
                            <span>Your Cart</span>
                            <div class="qty"><%=carts.size()%></div>
                        </a>
                        <div class="cart-dropdown">
                            <div class="cart-list">

                                <%

                                    for (Cart cart : carts) {

                                %>

                                <div class="product-widget">
                                    <div class="product-img">
                                        <img src="<%=cart.getProduct().getImg_1()%>" alt="">
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="${pageContext.request.contextPath}/product?id=<%=cart.getProduct().getId()%>"><%=cart.getProduct().getName()%></a></h3>
                                        <h4 class="product-price"><span class="qty"><%=cart.getQuantity()%>.x</span><%=cart.getProduct().getPrice()%></h4>
                                    </div>
                                    <a href= "${pageContext.request.contextPath}/deletecart?id=<%=cart.getProduct().getId()%>" ><button class="delete"><i class="fa fa-close"></i></button></a>
                                </div>
                                <%
                                        Total = Total + (cart.getQuantity() * cart.getProduct().getPrice());
                                    }
                                    request.getSession().setAttribute("totalCart", Total);
                                %>


                            </div>
                            <div class="cart-summary">
                                <small><%=carts.size()%> Item(s) selected</small>
                                <h5>SUBTOTAL: <%=Total%>VND</h5>
                            </div>
                            <% //}%>
                            <div class="cart-btns">
                                
                                <a href="${pageContext.request.contextPath}/cart">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /Cart -->

                    <!-- Menu Toogle -->
                    <div class="menu-toggle">
                        <a href="#">
                            <i class="fa fa-bars"></i>
                            <span>Menu</span>
                        </a>
                    </div>
                    <!-- /Menu Toogle -->
                </div>
            </div>
            <!-- /ACCOUNT -->
        </div>
        <!-- row -->
    </div>
    <!-- container -->
</div>
<!-- /MAIN HEADER -->