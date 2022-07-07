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
                        <h3 class="breadcrumb-header">User INFORMATION</h3>
                        <ul class="breadcrumb-tree">
                            <!--<li><a href="${pageContext.request.contextPath}/home">Home</a></li>-->
                            <!--<li class="active">login</li>-->
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

                    <div class="col-md-7">
                        <!-- Billing Details -->
                        <div class="billing-details">

                            <form action="${pageContext.request.contextPath}/user/info" method="post">
                                <div class="section-title">
                                    <h3 class="title">Your Information</h3>
                                </div>
                                <input type="hidden" name="id" placeholder="Old Password"   value="${sessionScope.account.id}">

                                <div class="form-group">
                                    <input class="input" type="text" name="first_name" value="${sessionScope.account.first_name}" placeholder="First Name" required pattern="{2,30}" title="First Name must in range 2 - 30 character " >
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="last_name" value="${sessionScope.account.last_name}" placeholder="Last Name" required pattern="{2,30}" title="Last Name must in range 2 - 30 character ">
                                </div>

                                <div class="form-group">
                                    <input class="input" type="text" name="address" value="${sessionScope.account.address}" placeholder="Address" required >
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="phone" placeholder="Phone" value="${sessionScope.account.phone}" required pattern="[0-9]{10}" title="Phone must number 10 character " >
                                </div>

                                <div class="order-notes">
                                    <input type="submit" value="Update Infomation"  />
                                </div>

                            </form>
                            <br/>                                <br/>


                            <script>
                                var check = function () {
                                    if (document.getElementById('password').value ==
                                            document.getElementById('Re-Password').value) {
                                        document.getElementById('message').style.color = 'green';
                                        document.getElementById('message').innerHTML = 'matching';
                                        return true;
                                    } else {
                                        document.getElementById('message').style.color = 'red';
                                        document.getElementById('message').innerHTML = 'not matching';
                                        return false;
                                    }
                                }
                            </script>

                            <form action="${pageContext.request.contextPath}/user/pass/change" method="post">
                                <div class="form-group">
                                    <div class="input-checkbox">
                                        <input type="checkbox" id="create-account">
                                        <label for="create-account">
                                            <span></span>
                                            You want to change Password?
                                        </label>
                                        <div class="caption">
                                            <h3 class="title">Input Info.</h3>
                                            <p class="bg-danger"> ${requestScope.changePassMessage}</p>
                                            <input type="hidden" name="id" placeholder="Old Password"   value="${sessionScope.account.id}">
                                            <div class="form-group">
                                                Old-Password<input class="input" type="password" name="old_Pass" placeholder="Old Password"  required >
                                            </div>
                                            <p style ="color: red">${requestScope.wrong_Old_pass}</p>
                                            <div class="form-group">
                                                New-Password<input class="input" type="password" name="password" placeholder="Password" id="password" required >
                                            </div>
                                            <div class="form-group">
                                                Re-New-Password<input class="input" type="password" placeholder="Re-Password" id="Re-Password" required onkeyup='check();'><span id='message'></span>
                                            </div>

                                            <input  type="submit" value="Change" >
                                        </div>
                                    </div>
                                </div>
                            </form>

                        </div>







                    </div>
                    <!-- /Billing Details -->


                    <!-- /Shiping Details -->
                    <!-- Order Details -->
                    <div class="col-md-5 order-details">
                        <div class="section-title text-center">
                            <h3 class="title">Your Old Order</h3>
                        </div>
                        <div class="order-summary">
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th style="text-align: center; width: 1000px">List Old Order</th>
                                        <th style="text-align: center; width: 200px">Order Date</th>
                                        <th style="text-align: center; width: 100px">Total</th>
                                    </tr>
                                    <%int numOrder = 1;
    double total = 0;%>
                                    <c:forEach var="o" items="${requestScope.orders}">
                                        <tr>


                                            <td><div><strong><%=numOrder%>)</strong> 
                                                    <c:forEach var="oi" items="${o.orderItems}">
                                                        <span style="font-weight: 500; font-size: small;">${oi.product.name}</span> <span style="font-size: small; color: gray;">x${oi.quantity}</span><br/>
                                                    </c:forEach>
                                                </div></td>
                                                <td><div>${o.orderDate}</div></td>

                                            <td><div>${o.total}VND</div>  </td>  
                                            

                                                <% numOrder = numOrder + 1;%>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>


                        </div>

                    </div>


                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <!--        <div id="newsletter" class="section">
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
        <jsp:include page="view/page/footer/footer.jsp"/>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <jsp:include page="view/style/js.jsp"/>

    </body>
</html>

