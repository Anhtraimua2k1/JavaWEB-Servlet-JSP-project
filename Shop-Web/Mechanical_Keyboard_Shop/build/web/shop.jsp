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

    </head>
    <body>
        <!-- HEADER -->
        <jsp:include page="view/page/header/header.jsp"/>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <jsp:include page="view/page/navigation/navigation.jsp"/>
        <!-- /NAVIGATION -->

        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb-tree">
                            <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/shop">Shop</a></li>
                            <!--                                                        <li><a href="shop?category={param.category}">Accessories</a></li>-->
                            <li class="active">
                                <c:forEach var="c" items="${requestScope.categories}">
                                    <c:if test="${c.id == param.category}">
                                        ${c.name}
                                    </c:if>
                                </c:forEach>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Categories</h3>
                            <div class="checkbox-filter">
                                <c:forEach var="c" items="${requestScope.categories}">

                                    <div class="input-checkbox">
                                        <input type="checkbox" disabled id="category-${c.id}"   <c:if test="${c.id == requestScope.category}"> checked  </c:if>>
                                            <label for="category-${c.id}">
                                                <a href="${pageContext.request.contextPath}/shop?category=${c.id}">
                                                <span></span>
                                                ${c.name}
                                                <small></small>
                                                </a>
                                            </label>     
                                        

                                    </div>
                                </c:forEach>



                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <!--                            <h3 class="aside-title">Price</h3>
                                                        <div class="price-filter">
                                                            <div id="price-slider"></div>
                                                            <div class="input-number price-min">
                                                                <input id="price-min" type="number">
                                                                <span class="qty-up">+</span>
                                                                <span class="qty-down">-</span>
                                                            </div>
                                                            <span>-</span>
                                                            <div class="input-number price-max">
                                                                <input id="price-max" type="number">
                                                                <span class="qty-up">+</span>
                                                                <span class="qty-down">-</span>
                                                            </div>
                                                        </div>-->
                        </div>
                        <!-- /aside Widget -->

                        <!--						 aside Widget 
                                                                        <div class="aside">
                                                                                <h3 class="aside-title">Brand</h3>
                                                                                <div class="checkbox-filter">
                                                                                        <div class="input-checkbox">
                                                                                                <input type="checkbox" id="brand-1">
                                                                                                <label for="brand-1">
                                                                                                        <span></span>
                                                                                                        SAMSUNG
                                                                                                        <small>(578)</small>
                                                                                                </label>
                                                                                        </div>
                                                                                        <div class="input-checkbox">
                                                                                                <input type="checkbox" id="brand-2">
                                                                                                <label for="brand-2">
                                                                                                        <span></span>
                                                                                                        LG
                                                                                                        <small>(125)</small>
                                                                                                </label>
                                                                                        </div>
                                                                                        <div class="input-checkbox">
                                                                                                <input type="checkbox" id="brand-3">
                                                                                                <label for="brand-3">
                                                                                                        <span></span>
                                                                                                        SONY
                                                                                                        <small>(755)</small>
                                                                                                </label>
                                                                                        </div>
                                                                                        <div class="input-checkbox">
                                                                                                <input type="checkbox" id="brand-4">
                                                                                                <label for="brand-4">
                                                                                                        <span></span>
                                                                                                        SAMSUNG
                                                                                                        <small>(578)</small>
                                                                                                </label>
                                                                                        </div>
                                                                                        <div class="input-checkbox">
                                                                                                <input type="checkbox" id="brand-5">
                                                                                                <label for="brand-5">
                                                                                                        <span></span>
                                                                                                        LG
                                                                                                        <small>(125)</small>
                                                                                                </label>
                                                                                        </div>
                                                                                        <div class="input-checkbox">
                                                                                                <input type="checkbox" id="brand-6">
                                                                                                <label for="brand-6">
                                                                                                        <span></span>
                                                                                                        SONY
                                                                                                        <small>(755)</small>
                                                                                                </label>
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                         /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Top selling</h3>
                            <c:forEach var="p" items="${requestScope.sellProducts}" begin="0" end="5" step="1">
                                <div class="product-widget">
                                    <div class="product-img">
                                        <img src="${p.img_1}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${p.category.name}</p>
                                        <h3 class="product-name"><a href="product?id=${p.id}">${p.name}</a></h3>
                                        <h4 class="product-price">${p.price} VNĐ</h4>
                                    </div>
                                </div>


                            </c:forEach>


                            <!--                            <div class="product-widget">
                                                            <div class="product-img">
                                                                <img src="./img/product02.png" alt="">
                                                            </div>
                                                            <div class="product-body">
                                                                <p class="product-category">Category</p>
                                                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                            </div>
                                                        </div>
                            
                                                        <div class="product-widget">
                                                            <div class="product-img">
                                                                <img src="./img/product03.png" alt="">
                                                            </div>
                                                            <div class="product-body">
                                                                <p class="product-category">Category</p>
                                                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                            </div>
                                                        </div>-->
                        </div>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
                        <div class="store-filter clearfix">
                            <!--                            <div class="store-sort">
                                                            <label>
                                                                Sort By:
                                                                <select class="input-select">
                                                                    <option value="0">Popular</option>
                                                                    <option value="1">Position</option>
                                                                </select>
                                                            </label>
                            
                                                            <label>
                                                                Show:
                                                                <select class="input-select">
                                                                    <option value="0">20</option>
                                                                    <option value="1">50</option>
                                                                </select>
                                                            </label>
                                                        </div>-->
                            <!--							<ul class="store-grid">
                                                                                            <li class="active"><i class="fa fa-th"></i></li>
                                                                                            <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                                                                                    </ul>-->
                        </div>
                        <!-- /store top filter -->

                        <!-- store products -->
                        <div class="row">

                            <!--<div class="clearfix visible-sm visible-xs"> </div>-->
                            <c:forEach var="p" items="${requestScope.products}">
                                <!-- product -->
                                <div class="col-md-4 col-xs-6">
                                    <div class="product">
                                        <div class="product-img">
                                            <img src="${p.img_1}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${p.category.name}</p>
                                            <h3 class="product-name"><a href="product?id=${p.id}">${p.name}</a></h3>
                                            <h4 class="product-price">${p.price} VNĐ</h4>
                                            <div class="product-rating">
                                            </div>
                                            <div class="product-btns">
                                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">${p.category.description}</span></button>
                                            </div>
                                        </div>
                                        <div class="add-to-cart">
                                            <a href="${pageContext.request.contextPath}/addcart?id=${p.id}&quantity=1"> <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /product -->   

                                <div class="clearfix visible-sm visible-xs"> </div>
                            </c:forEach>

                        </div>
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <div class="store-filter clearfix">
                            <span class="store-qty"></span>
                            <ul class="store-pagination">

                                <c:if test="${requestScope.pageindex > 1}">
                                    <li><a href="shop?category=${requestScope.category}&search=${requestScope.search}&page=${requestScope.pageindex - 1}"><i class="fa fa-angle-left"></i></a></li> 
                                        </c:if>

                                <c:choose>
                                    <c:when test="${requestScope.pageindex - 2 < 2}">
                                        <c:forEach var="i" begin="1" end = "<%= Integer.parseInt(request.getAttribute("totalpage")+"") >=5 ? 5 : Integer.parseInt(request.getAttribute("totalpage")+"") %>"  step="1">
                                            <li>    
                                                <c:if test="${i >= 1 && i <= requestScope.totalpage}">
                                                    <c:if test="${i != requestScope.pageindex}">
                                                        <a href="shop?category=${requestScope.category}&search=${requestScope.search}&page=${i}">${i}</a>
                                                    </c:if>
                                                    <c:if test="${i == requestScope.pageindex}">
                                                        <p>${i}</p>
                                                    </c:if>

                                                </c:if>


                                            </li>
                                        </c:forEach>
                                    </c:when> 

                                    <c:when test="${requestScope.pageindex >= (requestScope.totalpage-2)}">
                                        <c:forEach var="i" begin="<%= Integer.parseInt(request.getAttribute("totalpage")+"") <=5 ? 1 : (Integer.parseInt(request.getAttribute("totalpage")+"")-4) %>" end= "${requestScope.totalpage}" step="1">
                                            <li>    
                                                <c:if test="${i >= 1 && i <= requestScope.totalpage}">
                                                    <c:if test="${i != requestScope.pageindex}">
                                                        <a href="shop?category=${requestScope.category}&search=${requestScope.search}&page=${i}">${i}</a>
                                                    </c:if>
                                                    <c:if test="${i == requestScope.pageindex}">
                                                        <p>${i}</p>
                                                    </c:if>

                                                </c:if>

                                            </li>
                                        </c:forEach>
                                    </c:when>

                                    <c:otherwise>
                                        <c:forEach var="i" begin="${requestScope.pageindex - 2}" end= "${requestScope.pageindex + 2}" step="1">

                                            <li>    
                                                <c:if test="${i >= 1 && i <= requestScope.totalpage}">
                                                    <c:if test="${i != requestScope.pageindex}">
                                                        <a href="shop?category=${requestScope.category}&search=${requestScope.search}&page=${i}">${i}</a>
                                                    </c:if>
                                                    <c:if test="${i == requestScope.pageindex}" >
                                                        <p style="background-color: Red; color: aliceblue" >${i}</p>
                                                    </c:if>

                                                </c:if>

                                            </li>


                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>

                                <c:if test="${requestScope.pageindex < (requestScope.totalpage)}">
                                    <li><a href="shop?category=${requestScope.category}&search=${requestScope.search}&page=${requestScope.pageindex + 1}"><i class="fa fa-angle-right"></i></a></li>

                                </c:if>



                            </ul>
                        </div>
                        <!-- /store bottom filter -->
                    </div>
                    <!-- /STORE -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->

        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <jsp:include page="view/page/footer/footer.jsp"/>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <jsp:include page="view/style/js.jsp"/>

    </body>
</html>

