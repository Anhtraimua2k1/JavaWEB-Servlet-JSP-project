<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : course-create
    Created on : Mar 14, 2022, 1:52:17 PM
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
        <jsp:include page="../../style/css.jsp"/>

    </head>
    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
        <form action="${requestScope.uri}" method="post">

            <div class="site-wrap">

                <div class="site-mobile-menu site-navbar-target">
                    <div class="site-mobile-menu-header">
                        <div class="site-mobile-menu-close mt-3">
                            <span class="icon-close2 js-menu-toggle"></span>
                        </div>
                    </div>
                    <div class="site-mobile-menu-body"></div>
                </div>

                <!-- Header -->
                <jsp:include page="../../layout/header/header.jsp"/>
                <!-- Header  -->
                <!-- logo-design-course -->
                <div class="intro-section single-cover" id="home-section">

                    <div class="slide-1 " style="background-image: url('<%=request.getContextPath()%>/images/img_1.jpg');" data-stellar-background-ratio="0.5">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <div class="row justify-content-center align-items-center text-center">
                                        <div class="col-lg-6">
                                            <h1 data-aos="fade-up" data-aos-delay="0"><c:if test="<%= (""+request.getAttribute("URI")).contains("create") %>">Create</c:if>  
                                                           <c:if test="<%= (""+request.getAttribute("URI")).contains("update") %>">Update</c:if> Course</h1>
                                            <!--<p data-aos="fade-up" data-aos-delay="100">requestScope.course.lesson} Lessons / {requestScope.course.week} Week &bullet; {requestScope.course.numOfStudent} students &bullet; <a href="#" class="text-white">6 comments</a></p>-->
                                        </div>


                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- logo-design-course  -->

                <div class="site-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 mb-5">
                                
                                <!-- Course Description -->
                                <input type="hidden" class="form-control" placeholder="Course ID"  name="id" value="${requestScope.course.id}" /> 
                                <div class="mb-5">
                                    <h3 class="text-black">Course Name: <input type="text" class="form-control" placeholder="Course Name"  name="name" value="${requestScope.course.name}" required />  </h3>
                                    <p class="mb-4">
                                        <strong class="text-black mr-3">Schedule: </strong> MWF
                                        <select name="schedule" placeholder="Schedule">
                                            <c:forEach var="s" items="${requestScope.schedules}">
                                                <option value="${s.id}"<c:if test="${s.id == requestScope.course.schedule.id }"> checked</c:if> >${s.start}- ${s.end}</option>
                                            </c:forEach>
                                        </select> 
                                        
                                    </p>
                                    <p class="mb-4">
                                        <strong class="text-black mr-3">Lesson: </strong><input type="number"  name="lesson" required  value="${requestScope.course.lesson}"  placeholder="lesson"/>  &emsp; &emsp; &emsp;
                                        <strong class="text-black mr-3">Week: </strong><input type="number"  name="week" required  value="${requestScope.course.week}"  placeholder="week"/>
                                        
                                    </p>
                                    <p> 
                                        <strong class="text-black mr-3">Price: </strong><input type="number" class="form-control" name="price" required  value="${requestScope.course.price}"  placeholder="price"/>
                                    </p>
                                    <p> 
                                        <strong class="text-black mr-3">Description: </strong> <input type="text" class="form-control" name="description" required  value="${requestScope.course.description}"  placeholder="description"/>
                                    </p>
                                    <p> 
                                        <strong class="text-black mr-3">Instruction: </strong> <input type="text" class="form-control" name="instruction" required  value="${requestScope.course.instruction}"  placeholder="instruction"/>
                                    </p>
                                    
                                    <p>
                                        <strong class="text-black mr-3">Image link:</strong> <input type="text" name="img" class="form-control" required  value="${requestScope.course.img}" placeholder="Image" />
                                    </p>
                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <img src="${requestScope.contextPath}/${requestScope.course.img}" alt="" class="img-fluid rounded">
                                            <img src="${requestScope.course.img}" alt="" class="img-fluid rounded">
                                        </div>
                                    </div>

                                    <p class="mt-4"><input type="submit" class="btn btn-primary" 
                                                           value= <c:if test="<%= (""+request.getAttribute("URI")).contains("create") %>">"create"</c:if>  
                                                           <c:if test="<%= (""+request.getAttribute("URI")).contains("update") %>">"update" onclick="return confirm('Do you want to Update this Course');"  </c:if>
                                                           /></p>
                                </div>
                                <!-- Course Description -->
                            </div>
                          
                            <div class="col-lg-4 pl-lg-5">
                                <c:forEach var="t" items="${requestScope.teachers}">

                                    <div class="mb-5 text-center border rounded course-instructor">

                                        <div class="mb-5 text-center border rounded course-instructor">
                                            <input type="radio" name="teacher" required  value="${t.id}"<c:if test="${requestScope.course.teacher.id == t.id}"> checked </c:if>/>
                                                <h3 class="mb-5 text-black text-uppercase h6 border-bottom pb-3">Course Instructor</h3>
                                                <div class="mb-4 text-center">
                                                    <img src="${requestScope.contextPath}/${t.img}" alt="" class="w-25 rounded-circle mb-4">  
                                                    <img src="${t.img}" alt="" class="w-25 rounded-circle mb-4">  
                                                <h3 class="h5 text-black mb-4">${t.name}</h3>
                                                <p style="height: 10px">${t.instruction}</p>
                                            </div>

                                        </div>
                                    </div>  

                                </c:forEach>
                            </div> 

                                        
                        </div>                  
                    </div>                  

                    </form>
                    <!-- Footer -->
                    <jsp:include page="../../layout/footer/footer.jsp"/>
                    <!-- Footer -->


                </div> <!-- .site-wrap -->

                <jsp:include page="../../style/js.jsp"/>

                </body>
                </html>