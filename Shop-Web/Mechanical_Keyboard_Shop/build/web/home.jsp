<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro - HTML Ecommerce Template</title>
        <jsp:include page="view/style/css.jsp"/>

        <%ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");%>
    </head>
    <body>
        <!-- HEADER -->
        <jsp:include page="view/page/header/header.jsp"/>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <jsp:include page="view/page/navigation/navigation.jsp"/>
        <!-- /NAVIGATION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- shop -->
                    <c:forEach var="c" items="${requestScope.categories}">    
                        <div class="col-md-4 col-xs-6">
                            <div class="shop">
                                <div class="shop-img">
                                    <img src="${c.img}" alt="${c.name}" width="170px" height="250px">
                                </div>
                                <div class="shop-body">
                                    <h3>${c.name}<br>Collection</h3>
                                    <a href="${pageContext.request.contextPath}/shop?category=${c.id}" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div> 
                    </c:forEach>
                    <!-- /shop -->

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->
        
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">New Products</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <li class="active"><a data-toggle="tab" href="#NewAll">All</a></li>
                                        <c:forEach var="c" items="${requestScope.categories}">   
                                        <li><a data-toggle="tab" href="#New${c.id}">${c.name}</a></li>
                                        </c:forEach>



                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!--list product-->
                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">

                                <%
                                    for (Category c : categories) {
                                %>
                                <!-- tab -->
                                <div id="New<%=c.getId()%>" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">

                                        <%ArrayList<Product> prod = (ArrayList<Product>) request.getAttribute("newProduct" + c.getId());

                                            for (Product p : prod) {
                                        %>



                                        <!-- product -->
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="<%=p.getImg_1()%>" alt="<%=p.getName()%>">
                                                <div class="product-label">
                                                    <!--<span class="sale">-30%</span>-->
                                                    <span class="new">NEW</span>
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category"><%=p.getCategory().getName()%></p>
                                                <h3 class="product-name"><a href="product?id=<%=p.getId()%>"><%=p.getName()%></a></h3>
                                                <h4 class="product-price"><%=p.getPrice()%> VNĐ<!--<del class="product-old-price">12345</del>--></h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <a href="${pageContext.request.contextPath}/addcart?id=<%=p.getId()%>&quantity=1"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button></a>
                                            </div>
                                        </div>

                                        <!-- /product -->

                                        <%}%>

                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->

                                <%
                                    }
                                %>


                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <!-- jsp:include page="section/hot-deal.jsp"-->
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Top selling</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <li class="active"><a data-toggle="tab" href="#SellAll">All</a></li>
                                        <c:forEach var="c" items="${requestScope.categories}">   
                                        <li><a data-toggle="tab" href="#Sell${c.id}">${c.name}</a></li>
                                        </c:forEach>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">

                                <% for (Category c : categories) {
                                %>


                                <!-- tab -->
                                <div id="Sell<%=c.getId()%>" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">

                                        <%ArrayList<Product> prod = (ArrayList<Product>) request.getAttribute("sellProduct" + c.getId());

                                            for (Product p : prod) {
                                        %>

                                        <!-- product -->
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="<%=p.getImg_1()%>" alt="">
                                                <div class="product-label">
                                                    <!--<span class="sale">-30%</span>-->
                                                    <!--<span class="new">NEW</span>-->
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category"><%=p.getCategory().getName()%></p>
                                                <h3 class="product-name"><a href="product?id=<%=p.getId()%>"><%=p.getName()%></a></h3>
                                                <h4 class="product-price"><%=p.getPrice()%> VNĐ<!--<del class="product-old-price">$990.00</del>--></h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <a href="${pageContext.request.contextPath}/addcart?id=<%=p.getId()%>&quantity=1"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button></a>
                                            </div>
                                        </div>
                                        <!-- /product -->
                                        <%
                                            }
                                        %>

                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->


                                <%
                                    }
                                %>



                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        

        <!-- FOOTER -->
        <jsp:include page="view/page/footer/footer.jsp"/>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <jsp:include page="view/style/js.jsp"/>

    </body>
</html>

