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
                        <h3 class="breadcrumb-header">Forgot Password</h3>
                        <ul class="breadcrumb-tree">
                            <li><a href="#">Home</a></li>
                            <li class="active">login</li>
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
                            <form action="${pageContext.request.contextPath}/forgotpass" method="POST">
                                <div class="section-title">
                                    <h3 class="title">Yous username is</h3>
                                </div>
                                <p class="bg-danger"> ${requestScope.checkMessage}</p>
                                <div class="form-group">
                                    <input class="input" type="text" name="username" placeholder="Username" required pattern="[A-Za-z0-9]{5,30}" title="username must alpha or digit and in range 5 - 30 character ">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="phone" placeholder="Phone" required pattern="[0-9]{10}" title=" must 10 digit ">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="address" placeholder="Address" required >
                                </div>
                                
                                
                                    <input type="submit" value="Check" />
                                </div>

                            </form>



                        </div>
                        <!-- /Billing Details -->


                        <!-- /Shiping Details -->


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

