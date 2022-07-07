<%-- 
    Document   : signUp
    Created on : Mar 13, 2022, 6:25:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>OneSchool &mdash; Website by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <jsp:include page="view/style/css.jsp"/>

    </head>
    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
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
        <div class="site-wrap">

            <div class="site-mobile-menu site-navbar-target">
                <div class="site-mobile-menu-header">
                    <div class="site-mobile-menu-close mt-3">
                        <span class="icon-close2 js-menu-toggle"></span>
                    </div>
                </div>
                <div class="site-mobile-menu-body"></div>
            </div>


            <!--Header -->
            <jsp:include page="view/layout/header/header.jsp"/>

            <!--Header -->

            <!--Login -->
            <div class="intro-section" id="home-section">

                <div class="slide-1" style="background-image: url('images/hero_1.jpg');" data-stellar-background-ratio="0.5">
                    <div class="container" >
                        <div class="row align-items-center" >
                            <div class="col-12">
                                <div class="row align-items-center">
                                    <div class="col-lg-6 mb-4">
                                        <h1  data-aos="fade-up" data-aos-delay="100">Learn From The Expert</h1>
                                        <p class="mb-4"  data-aos="fade-up" data-aos-delay="200">Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime ipsa nulla sed quis rerum amet natus quas necessitatibus.</p>
                                        <p data-aos="fade-up" data-aos-delay="300"></p>

                                    </div>




                                    <div class="col-lg-5 ml-auto" data-aos="fade-up" data-aos-delay="500">
                                        <form action="sign-up" method="post" class="form-box" onsubmit="return check();">
                                            <h3 class="h4 text-black mb-4">Sign Up</h3>
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="first name" name="firstname" required> 
                                            </div>

                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="last name" name="lastname"  required title=""> 
                                            </div>

                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Username" name="username">
                                            </div>

                                            <div class="form-group">
                                                <input type="password" class="form-control" placeholder="Password" name="password" required id="password" onkeyup='check();'>
                                            </div>

                                            <div class="form-group">
                                                <input type="password" class="form-control" placeholder="Re-Password" id="Re-Password" required onkeyup='check();' ><span id='message'></span>
                                            </div>

                                            <div class="form-group mb-4">
                                                <input type="date" class="form-control" placeholder="Date of Birth" required name="dob">
                                            </div>
                                            
                                            <div class="form-group mb-4">               
                                                 <input type="radio"  name="gender" value="true" checked/> Male  &nbsp;<input type="radio"  name="gender" value="false" /> Female 
                                            </div>
                                            
                                            <div class="form-group mb-4">
                                                <input type="text" class="form-control" placeholder="phone" name="phone" required>
                                            </div>

                                            <div class="form-group mb-4">
                                                <input type="text" class="form-control" placeholder="image" name="img" required>
                                            </div>

                                            <div class="form-group">
                                                <input type="submit" class="btn btn-primary btn-pill" value="Sign up" >          <a href="login" Style="margin-left: 30px"  > You have an Account?</a>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                </div>


            </div>


            <!--Login -->


            <div style="  ">
                <!-- Footer -->
                <jsp:include page="view/layout/footer/footer.jsp"/>
                <!-- Footer -->



                <!-- .site-wrap -->
            </div>
            <jsp:include page="view/style/js.jsp"/>


    </body>
</html>