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

        <jsp:include page="../style/css.jsp"/>


    </head>
    <body>
        <!-- HEADER -->
        <jsp:include page = "../page/header/header.jsp"/>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <jsp:include page="../page/navigation/navigation.jsp"/>
        <!-- /NAVIGATION -->

        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Manager Page</h3>
                        <ul class="breadcrumb-tree">
                            <li><a href="#">Home</a></li>
                            <li class="active">Manager Product</li>
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


                    <div class="col-md-12">
                        <!-- Billing Details -->
                        <table class="table-hover table-bordered text-center"  >

                            <tbody>
                                <tr>
                                    <th colspan="6">
                                        <div class="header-search">
                                            <form action="list" method="get">
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

                                    </th> 

                                </tr>

                                <tr>
                                    <th style="width: 50px ; text-align: center;"  >ID</th>
                                    <th style="width: 350px; text-align: center;">Name</th>
                                    <th style="width: 300px; text-align: center;">Image</th>
                                    <th style="width: 150px; text-align: center;">Price</th>
                                    <th colspan="2" style="width: 200px; text-align: center;">Action</th>
                                    <!--<th style="width: 50px"></th>-->
                                </tr>
                                <c:forEach var="p" items="${requestScope.products}">

                                    <tr>
                                    <td>${p.id}</td>
                                    <td>${p.name}</td>
                                    <td> <div class="product-img"><img class="center-block" src="${p.img_1}" height="100px" width="200px"/>  </div> </td>
                                    <td>${p.price}</td>
                                    <td><a href="${pageContext.request.contextPath}/manager/product/update?id=${p.id}"><i class="fa fa-refresh" style="font-size: 2.5em; display: inline-block;width: 100%;text-align:center;"></i></a> </td>
                                    <td><a href="${pageContext.request.contextPath}/manager/product/delete?id=${p.id}" onclick="return confirm('Do you want to delete this Product');"><i class="fa fa-trash" style="font-size: 2.5em; display: inline-block;width: 100%;text-align:center;"></i></a> </td>
                                    </tr>
                                </c:forEach>

                                
                                <tr>

                                    <td colspan="4">
                                        <ul class="store-pagination center-block" style="text-align: center">

                                            <c:if test="${requestScope.pageindex > 1}">
                                                <li><a href="${pageContext.request.contextPath}/manager/product/list?category=${requestScope.category}&search=${requestScope.search}&page=${requestScope.pageindex - 1}"><i class="fa fa-angle-left"></i></a></li> 
                                                    </c:if>

                                            <c:choose>
                                                <c:when test="${requestScope.pageindex - 2 < 2}">
                                                    <c:forEach var="i" begin="1" end= "<%= Integer.parseInt(request.getAttribute("totalpage")+"") >=5 ? 5 : Integer.parseInt(request.getAttribute("totalpage")+"") %>" step="1">
                                                        <li>    
                                                            <c:if test="${i >= 1 && i <= requestScope.totalpage}">
                                                                <c:if test="${i != requestScope.pageindex}">
                                                                    <a href="${pageContext.request.contextPath}/manager/product/list?category=${requestScope.category}&search=${requestScope.search}&page=${i}">${i}</a>
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
                                                                    <a href="${pageContext.request.contextPath}/manager/product/list?category=${requestScope.category}&search=${requestScope.search}&page=${i}">${i}</a>
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
                                                                    <a href="${pageContext.request.contextPath}/manager/product/list?category=${requestScope.category}&search=${requestScope.search}&page=${i}">${i}</a>
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
                                                <li><a href="${pageContext.request.contextPath}/manager/product/list?category=${requestScope.category}&search=${requestScope.search}&page=${requestScope.pageindex + 1}"><i class="fa fa-angle-right"></i></a></li>

                                            </c:if>



                                        </ul>
                                    </td> 
                                    
                                    <td colspan="2"><a href="${pageContext.request.contextPath}/manager/product/create"><i class="fa fa-upload" style="font-size: 2.5em;  display: inline-block;width: 100%;text-align:center;"></i></a> </td>

                                </tr>
                            </tbody>
                        </table>

                        <!-- /Order notes -->
                    </div>

                    <!-- Order Details -->
                    <!--					<div class="col-md-2 ">
                                                                    
                                                            </div>-->







                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <!--		<div id="newsletter" class="section">
                                 container 
                                <div class="container">
                                         row 
                                        <div class="row">
                                                <div class="col-md-12">
                                                        <div class="newsletter">
                                                                <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                                                                <form>
                                                                        <input class="input" type="email" placeholder="Enter Your Email">
                                                                        <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                                                                </form>
                                                                <ul class="newsletter-follow">
                                                                        <li>
                                                                                <a href="#"><i class="fa fa-facebook"></i></a>
                                                                        </li>
                                                                        <li>
                                                                                <a href="#"><i class="fa fa-twitter"></i></a>
                                                                        </li>
                                                                        <li>
                                                                                <a href="#"><i class="fa fa-instagram"></i></a>
                                                                        </li>
                                                                        <li>
                                                                                <a href="#"><i class="fa fa-pinterest"></i></a>
                                                                        </li>
                                                                </ul>
                                                        </div>
                                                </div>
                                        </div>
                                         /row 
                                </div>
                                 /container 
                        </div>-->
        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <jsp:include page="../page/footer/footer.jsp"/>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <jsp:include page="../style/js.jsp"/>

    </body>
</html>

