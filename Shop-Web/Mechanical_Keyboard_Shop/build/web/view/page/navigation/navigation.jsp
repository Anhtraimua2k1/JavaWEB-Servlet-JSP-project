<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li <c:if test="<%=request.getServletPath().contains("home")%>">class="active"</c:if>><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <!--<li ><a href="home"></a></li>-->
                <li <c:if test="<%=request.getServletPath().contains("shop")%>"> class="active"</c:if>><a href="${pageContext.request.contextPath}/shop">Shop</a></li>
                
                <c:if test="${sessionScope.account.type==1}">
                    <li <c:if test="<%=request.getServletPath().contains("manager")%>"> class="active"</c:if>><a href="${pageContext.request.contextPath}/manager/product/list">Manager Product</a></li>
                </c:if>
                

            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->
