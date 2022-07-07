<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- top footer -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-3 col-xs-6">
                <div class="footer">
                    <h3 class="footer-title">About Us</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                    <ul class="footer-links">
                        <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                        <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-xs-6">
                <div class="footer">
                    <h3 class="footer-title">Categories</h3>
                    <ul class="footer-links">
                        <li <c:if test="<%=request.getServletPath().contains("home")%>">class="active"</c:if>><a href="${pageContext.request.contextPath}/home">Home</a></li>
                        <!--<li ><a href="home"></a></li>-->
                        <li <c:if test="<%=request.getServletPath().contains("shop")%>"> class="active"</c:if>><a href="${pageContext.request.contextPath}/shop">Shop</a></li>

                        <c:if test="${sessionScope.account.type==1}">
                            <li <c:if test="<%=request.getServletPath().contains("manager")%>"> class="active"</c:if>><a href="${pageContext.request.contextPath}/manager/product/list">Manager Product</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>

            <div class="clearfix visible-xs"></div>

            <div class="col-md-3 col-xs-6">
                <div class="footer">
                    <h3 class="footer-title">Information</h3>
                    <ul class="footer-links">
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Orders and Returns</a></li>
                        <li><a href="#">Terms & Conditions</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-xs-6">
                <div class="footer">
                    <h3 class="footer-title">Service</h3>
                    <ul class="footer-links">
                        <li><a href="#">My Account</a></li>
                        <li><a href="#">View Cart</a></li>
                        <li><a href="#">Wishlist</a></li>
                        <li><a href="#">Track My Order</a></li>
                        <li><a href="#">Help</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /top footer -->
