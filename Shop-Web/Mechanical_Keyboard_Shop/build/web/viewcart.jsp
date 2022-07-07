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
        <jsp:include page = "view/page/header/header.jsp"/>
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
                        <h3 class="breadcrumb-header">View Cart</h3>
                        <ul class="breadcrumb-tree">
                            <li><a href="#">Home</a></li>
                            <li class="active"></li>
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



                    <table class="table-hover table-bordered text-center"  >
                        <form action="cart" method="post">

                            <tbody>
                                <tr>
                                    <th style="width: 500px; text-align: center;">Name</th>
                                    <th style="width: 200px; text-align: center;">Image</th>
                                    <th style="width: 175px; text-align: center;">Quantity</th>
                                    <th style="width: 175px; text-align: center;">Price</th>
                                    <th style="width: 200px; text-align: center;">Delete</th>
                                    <!--<th style="width: 50px"></th>-->
                                </tr>
                                <input type="hidden" name="from" value="cart" /> 
                                <c:forEach var="cart" items="${sessionScope.listCarts}">
                                    <tr>
                                        <!--<td>{cart.product.id}</td>-->
                                   
                                <input type="hidden" name="productId" value="${cart.product.id}" />
                                <td>${cart.product.name}</td>
                                <td> <div class="product-img"><img class="center-block" src="${cart.product.img_1}" height="100px" width="200px"/>  </div> </td>

                                <td> <input type="number" name="quantity${cart.product.id}" value="${cart.quantity}" style="width: 80%" class="text-center" /> </td>
                                <td>${cart.product.price} VNĐ</td>
                                <td><a href="${pageContext.request.contextPath}/deletecart?id=${cart.product.id}&from=cart" onclick="return confirm('Do you want to delete this Product');"><i class="fa fa-trash" style="font-size: 2.5em; display: inline-block;width: 100%;text-align:center;"></i></a> </td>
                                </tr>
                            </c:forEach>

                            <tr>

                                <th colspan="4" style="font-size: x-large; text-align: center">Total Price</th>
                                <th  style="width: 200px; text-align: center;">${sessionScope.totalCart} VNĐ</th>
                                <!--<th style="width: 50px"></th>-->
                            </tr>
                            <tr>

                                <th colspan="5" class="text-center"><input type="submit" value="Buy" class="primary-btn order-submit" onclick="return confirm('Do you want to order now? Your total is ${sessionScope.totalCart} VNĐ');"/> </th>
                                <!--<th style="width: 50px"></th>-->
                            </tr>
                            </tbody>
                        </form>
                    </table>
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

