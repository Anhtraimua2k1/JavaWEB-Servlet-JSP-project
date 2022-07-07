<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <form >
                            <div style="margin-left: 900px">
                                <select name="teacher">

                                    <option value="0" selected>teacher</option>
                                    <c:forEach var="t" items="${requestScope.teachers}">
                                        <option <c:if test="${ requestScope.teacher == t.id}"> selected</c:if> value="${t.id}" >${t.name}</option>
                                    </c:forEach>
                                </select>
                                <input type="text" name="search" value="${pageContext.request.getParameter("search")}" />
                                <input type="submit" value="search" />
                                
                                </div>
                               <br/> 
                        <div class="col-lg-12 mb-3">
                            <table border="1">
                                <tbody> 
                                    <tr>
                                        <th style="width: 200px; text-align: center;">Name</th>
                                        <th style="width: 100px; text-align: center;">Schedule</th>
                                        <th style="width: 170px; text-align: center;">Lesson / Week</th>
                                        <th style="width: 150px; text-align: center;">Teacher</th>
                                        <th style="width: 600px; text-align: center;">Instruction</th>
                                        <th style="width: 60px; text-align: center;">Price</th>
                                        <th colspan="2"  style="width: 150px; text-align: center;">Action</th>
                                        
                                    </tr>

                                    <c:forEach var="c" items="${requestScope.courses}">
                                        <tr>
                                            <td>${c.name}</td>
                                            <td>Slot ${c.schedule.id} </td>
                                            <td>${c.lesson} lesson / ${c.week} week</td>
                                            <td>${c.teacher.name}</td>
                                            <td>${c.instruction}</td>
                                            <td>${c.price}$</td>
                                            <td><a href="${requestScope.contextPath}/manager/course/delete?id=${c.id}" onclick="return confirm('Do you want to delete this Course');" style="text-height: max-size" class="icon-delete">delete</a></td>
                                            <td>
                                                <a href="${requestScope.contextPath}/manager/course/update?id=${c.id}"  style="text-height: max-size" class="icon-input">update</a>
                                            </td>
                                        </tr>

                                    </c:forEach>

                                </tbody>
                            </table>
                            <a href="${requestScope.contextPath}/manager/course/create"><button class="btn btn-primary rounded-0" >create</button></a>

                        <div class="col-15 text-center">
                                    <a class="" href="${requestScope.contextPath}/manager/course/list?page=${requestScope.pageindex -1}&search=${pageScope.search}&teacher=${requestScope.teacher}">Prev</a> 
                                    <c:choose>
                                        <c:when test="${requestScope.pageindex - 2<2}">
                                            <c:forEach var="i" begin="1" end= "5" step="1">
                                                <a href="${requestScope.contextPath}/manager/course/list?page=${i}&search=${pageScope.search}&teacher=${requestScope.teacher}"
                                                   <c:if test="${i == requestScope.pageindex}">
                                                       style = "text-decoration:none;
                                                       font-weight: bolder;
                                                       color: black"
                                                   </c:if>>${i}</a>
                                            </c:forEach>
                                        </c:when> 

                                        <c:when test="${requestScope.pageindex >= (requestScope.totalpage-2)}">
                                            <c:forEach var="i" begin="${requestScope.totalpage-4}" end= "${requestScope.totalpage}" step="1">
                                                <a href="${requestScope.contextPath}/manager/course/list?page=${i}&search=${pageScope.search}&teacher=${requestScope.teacher}"
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
                                                <a href="${requestScope.contextPath}/manager/course/list?page=${i}&search=${pageScope.search}&teacher=${requestScope.teacher}"
                                                   <c:if test="${i == requestScope.pageindex}">
                                                       style = "text-decoration:none;
                                                       font-weight: bolder;
                                                       color: black"
                                                   </c:if>>${i}</a>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                    <a class="" style="" href="${requestScope.contextPath}/manager/course/list?page=${requestScope.pageindex +1}&search=${pageScope.search}&teacher=${requestScope.teacher}">Next</a> 
                                </div>


                            </form>
                            
                        </div>

                    </div>
                </div>
            </div>


            <%--<jsp:include page="../../course/course-list.jsp"/>--%>
            <!-- More Courses -->

            <!-- Footer -->
            <jsp:include page="../../layout/footer/footer.jsp"/>
            <!-- Footer -->


        </div> <!-- .site-wrap -->

        <jsp:include page="../../style/js.jsp"/>

    </body>
</html>
