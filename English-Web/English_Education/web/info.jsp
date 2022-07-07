<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : course-list
    Created on : Mar 15, 2022, 10:08:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>OneSchool &mdash; Website by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <!-- <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet"> -->
        <jsp:include page="view/style/css.jsp"/>

    </head>
    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

        <!--<div class="site-wrap">-->

        <div class="site-mobile-menu site-navbar-target">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close mt-3">
                    <span class="icon-close2 js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div>

        <!-- Header -->
        <jsp:include page="view/layout/header/header.jsp"/>
        <!-- Header  -->
        <!-- logo-design-course -->
        <div class="intro-section single-cover" id="home-section">

            <div class="slide-1 " style="background-image: url('${pageContext.request.contextPath}/images/img_1.jpg');" data-stellar-background-ratio="0.5">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="row justify-content-center align-items-center text-center">
                                <div class="col-lg-6">
                                    <h1 data-aos="fade-up" data-aos-delay="0"> Your Infomation</h1>
                                    
                                        
                                </div>


                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- logo-design-course  -->

        <div class="site-section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-9 mb-3">
                        <form action="info" method="post" class="form-box" onsubmit="return confirm('Do you want to save?');">
                                            <h3 class="h3 text-black mb-4">Infomation</h3>
                                            <div class="form-group">
                                                <input type="hidden" name="id" value="${sessionScope.user.id}" />
                                                <input type="text" class="form-control" placeholder="first name" name="firstname" required value="${sessionScope.user.firstname}"> 
                                            </div>

                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="last name" name="lastname"  required value="${sessionScope.user.lastname}" > 
                                            </div>

                                            <div class="form-group mb-4">
                                                <input type="date" class="form-control" placeholder="Date of Birth" required name="dob" value="${sessionScope.user.dob}" >
                                            </div>
                                            
                                            <div class="form-group mb-4">               
                                                <input type="radio"  name="gender" value="true"  checked/> Male  &nbsp;<input type="radio"  name="gender" value="false" <c:if test="${sessionScope.user.gender == false}">checked</c:if>/> Female
                                            </div>
                                            
                                            <div class="form-group mb-4">
                                                <input type="text" class="form-control" placeholder="phone" name="phone" required value="${sessionScope.user.phone}" >
                                            </div>
                                                
                                            <div class="form-group mb-4">
                                                <input type="text" class="form-control" placeholder="image" name="img" required  value="${sessionScope.user.img}"> <img src="${sessionScope.user.img}" height="150px"/>
                                            </div>
                                            

                                            <div class="form-group">
                                                <input type="submit" class="btn btn-primary btn-pill" value="Update" >  
                                            </div>
                                        </form>
                                    
                        <!-- Course Description -->
                        <div class="row">
                            
                            <c:forEach var="c" items="${requestScope.courses}">
                                <div class="col-md-5 col-lg-4 mb-4" data-aos="fade-up" data-aos-delay="100">
                                    <div style="width: 20vw">

                                        <!-- course -->
                                        <div class="course bg-white h-3 align-self-auto">
                                            <figure class="m-0">
                                                <a href="${requestScope.contextPath}/course?id=${c.id}"><img src="${c.img}" alt="Image" class="img-fluid"></a>
                                            </figure>
                                            <div class="course-inner-text py-4 px-4">
                                                <span class="course-price">$${c.price}</span>
                                                <div class="meta"><span class="icon-clock-o"></span>${c.lesson} Lessons / ${c.week} week</div>
                                                <h3><a href="course?id=${c.id}">${c.name}</a></h3>
                                                <p style="height: 120px">${c.instruction} </p>
                                            </div>
                                            <div class="d-flex border-top stats">
                                                <div class="py-3 px-4"><span class="icon-users"></span> ${c.numOfStudent} students</div>

                                                


                                            </div>
                                        </div>
                                        <!-- course -->

                                    </div>
                                </div>
                            </c:forEach>

                        </div>


                        <!-- Course Description -->
                    </div>
                                            <% int i=1;%>
                    <div class="col-lg-3 pl-lg-3"> 
                        <h1>Total Money</h1>
                        <div class="meta course-inner-text py-1 px-2">
                            <c:forEach var="l" items="${requestScope.learns}">
                                <p class="meta"><strong><%=i%>) </strong> ${l.course.name} </p>
                            <p class="meta"><h3></h3> ${l.registerDate} </p>
                            <p class="meta"><h3> </h3> ${l.course.price} </p>
                            <br/>
                            <% i++;%>
                        </c:forEach>
                            
                        </div>
                                                   
                        <h3>Total: ${requestScope.total} </h3>    
                    </div>


                </div>
                <br/>
                <br/>
                <h1>Your Course: ${requestScope.coursesize}</h1>
                <div class="container">
                    <div class="row">
                        <!-- list -->
                        <div class="owl-carousel col-12 nonloop-block-14">
                            <c:forEach var="l" items="${requestScope.cour}">
                                <!-- course -->
                                <div class="course bg-white h-100 align-self-stretch">
                                    <figure class="m-0">
                                        <a href="course?id=${l.course.id}"><img src="${l.course.img}" alt="Image" class="img-fluid"></a>
                                    </figure>
                                    <div class="course-inner-text py-4 px-4">
                                        <span class="course-price">$${l.course.price}</span>
                                        <div class="meta"><span class="icon-clock-o"></span>${l.course.lesson} Lessons / ${l.course.week} week</div>
                                        <h3><a href="course?id=${l.course.id}">${l.course.name}</a></h3>
                                        <p style="height: 120px">${l.course.instruction} </p>
                                    </div>
                                    <div class="d-flex border-top stats">
                                        <div class="py-3 px-4"><span class="icon-users"></span> ${l.course.numOfStudent} students</div>
                                        <div class="py-3 px-4 w-25 ml-auto border-left"><span class="icon-chat"></span> </div>
                                    </div>
                                </div>
                                <!-- course -->

                            </c:forEach>


                        </div>



                    </div>
                    <!-- list -->  
                    <div class="row justify-content-center">
                        <div class="col-7 text-center">
                            <button class="customPrevBtn btn btn-primary m-1">Prev</button>
                            <button class="customNextBtn btn btn-primary m-1">Next</button>
                        </div>
                    </div>
                </div>


                <!-- Footer -->
                <jsp:include page="view/layout/footer/footer.jsp"/>
                <!-- Footer -->


                <!-- </div>.site-wrap -->

                <jsp:include page="view/style/js.jsp"/>

                </body>
                </html>