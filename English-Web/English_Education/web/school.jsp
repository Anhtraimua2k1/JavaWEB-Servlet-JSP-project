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

            <div class="slide-1 " style="background-image: url('${requestScope.contextPath}/images/img_1.jpg');" data-stellar-background-ratio="0.5">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="row justify-content-center align-items-center text-center">
                                <div class="col-lg-6">
                                    <h1 data-aos="fade-up" data-aos-delay="0"> List Course</h1>
                                    
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
                                                <span class="course-price">${c.price}$</span>
                                                <div class="meta"><span class="icon-clock-o"></span>${c.lesson} Lessons / ${c.week} week</div>
                                                <h3><a href="course?id=${c.id}">${c.name}</a></h3>
                                                <p style="height: 120px">${c.instruction} </p>
                                            </div>
                                            <div class="d-flex border-top stats">
                                                <div class="py-3 px-4"><span class="icon-users"></span> ${c.numOfStudent} students</div>
                                                
                                                <c:if test="${sessionScope.user.type == 1}">
                                                <!--<div class="py-3 px-4 w-25 ml-auto border-left"><a href="{requestScope.contextPath}/manager/course/delete?id={c.id}" onclick="return confirm('Do you want to delete this Course');" style="text-height: max-size" class="icon-delete"></a> </div>-->
                                                <!--<div class="py-3 px-4 w-25 ml-auto border-left"><a href="{requestScope.contextPath}/manager/course/update?id={c.id}"  style="text-height: max-size" class="icon-input"></a> </div>-->
                                                </c:if>
                                    
                                                
                                            </div>
                                        </div>
                                        <!-- course -->

                                    </div>
                                </div>
                            </c:forEach>

                        </div>


                        <!-- Course Description -->
                    </div>
                    <div class="col-lg-3 pl-lg-3"> 
                        <form action="${pageContext.request.contextPath}/school">

                            <select name="teacher">

                                <option value="0" selected>teacher</option>
                                <c:forEach var="t" items="${requestScope.teachers}">
                                    <option <c:if test="${ requestScope.teacher == t.id}"> selected</c:if> value="${t.id}">${t.name}</option>
                                </c:forEach>
                            </select>
                            <input type="text" name="search" value="${pageContext.request.getParameter("search")}" />
                            <input type="submit" value="search" />

                            <div class="col-15 text-center">
                                <a class="customPrevBtn btn btn-primary m-1" href="${requestScope.contextPath}/school?page=${requestScope.pageindex -1}&search=${pageScope.search}&teacher=${requestScope.teacher}">Prev</a> 
                                <c:choose>
                                    <c:when test="${requestScope.pageindex - 2<2}">
                                        <c:forEach var="i" begin="1" end= "5" step="1">
                                            <a href="${requestScope.contextPath}/school?page=${i}&search=${pageScope.search}&teacher=${requestScope.teacher}"
                                               <c:if test="${i == requestScope.pageindex}">
                                                   style = "text-decoration:none;
                                                   font-weight: bolder;
                                                   color: black"
                                               </c:if>>${i}</a>
                                        </c:forEach>
                                    </c:when> 

                                    <c:when test="${requestScope.pageindex >= (requestScope.totalpage-2)}">
                                        <c:forEach var="i" begin="${requestScope.totalpage-4}" end= "${requestScope.totalpage}" step="1">
                                            <a href="${requestScope.contextPath}/school?page=${i}&search=${pageScope.search}&teacher=${requestScope.teacher}"
                                               <c:if test="${i == requestScope.pageindex}">
                                                   style = "text-decoration:none;
                                                   font-weight: bolder;
                                                   color: black"
                                               </c:if>>${i}</a>
                                        </c:forEach>
                                    </c:when>

                                    <c:otherwise>
                                        <c:forEach var="i" begin="${requestScope.pageindex - 2}" end= "${requestScope.pageindex + 2}" step="1">

                                            <!--<a href="search?page=">$Integer.parseInt(requestScope.pageindex)</a>-->
                                            <a href="${requestScope.contextPath}/school?page=${i}&search=${pageScope.search}&teacher=${requestScope.teacher}"
                                               <c:if test="${i == requestScope.pageindex}">
                                                   style = "text-decoration:none;
                                                   font-weight: bolder;
                                                   color: black"
                                               </c:if>>${i}</a>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                <a class="customPrevBtn btn btn-primary" style="" href="${requestScope.contextPath}/school?page=${requestScope.pageindex +1}&search=${pageScope.search}&teacher=${requestScope.teacher}">Next</a> 
                            </div>


                        </form>
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