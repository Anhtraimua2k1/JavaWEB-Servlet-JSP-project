<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- TOP HEADER -->
<div id="top-header">
    <div class="container">
        <ul class="header-links pull-left">
            <li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
            <li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
            <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
        </ul>
        <ul class="header-links pull-right">
            <li><c:if test="${sessionScope.account.type==0}"> <a href="${pageContext.request.contextPath}/user/info"><i class="fa fa-user-o"></i> My Account</a> </c:if> </li>
            <li> 
                <c:if test="${sessionScope.account != null}"> <a href="${pageContext.request.contextPath}/logout "><i class="fa fa-gear"></i> Log out</a> </c:if> 
                <c:if test="${sessionScope.account == null}"> <a href="${pageContext.request.contextPath}/login"><i class="fa fa-lg"></i> Login</a> </c:if> 
            </li>
        </ul>
    </div>
</div>
<!-- /TOP HEADER -->
