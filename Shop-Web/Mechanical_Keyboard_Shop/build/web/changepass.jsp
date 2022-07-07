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
                    <div class="col-md-7">
                        <!-- Billing Details -->
                        <div class="billing-details">
                            <form action="${pageContext.request.contextPath}/user/pass/change" method="POST" onsubmit="return check();">
                                <div class="section-title">
                                    <h3 class="title">New Password</h3>
                                </div>

                                <input class="input" type="hidden" name="id" value="${requestScope.accId}">
                                
                                <div class="form-group">
                                    <input class="input" type="password" name="password" placeholder="Password" id="password" required >
                                </div>
                                <div class="form-group">
                                    <input class="input" type="password" placeholder="Re-Password" id="Re-Password" required onkeyup='check();'><span id='message'></span>
                                </div>


                                <input type="submit" value="Change" />
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

