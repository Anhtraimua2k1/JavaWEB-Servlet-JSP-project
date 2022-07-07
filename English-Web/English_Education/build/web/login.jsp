<%-- 
    Document   : login
    Created on : Mar 13, 2022, 3:26:19 PM
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

    <div class="slide-1" style="background-image: url('${pageContext.request.contextPath}/images/hero_1.jpg');" data-stellar-background-ratio="0.5">
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
                            <form action="login" method="post" class="form-box">
                                <h3 class="h4 text-black mb-4">Login</h3>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="username" name = "username" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="password" name = "password" required>
                                </div>
                                
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary btn-pill" value="Login"> <a href="sign-up" Style="margin-left: 30px"  > You don't have Account?</a>
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