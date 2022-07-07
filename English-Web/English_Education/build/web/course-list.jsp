<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <jsp:include page="view/layout/header/header.jsp"/>
            <!-- Header  -->
            <!-- logo-design-course -->
            <jsp:include page="view/course/course-logo.jsp"/>
            <!-- logo-design-course  -->

            <div class="site-section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 mb-5">

                            <table border="1">


                                <tbody> 
                                    <tr>
                                        <th>Name</th>
                                        <th>Schedule</th>
                                        <th>Lesson / Week</th>
                                        <th>Teacher</th>
                                        <th>Instruction</th>
                                        <th>Price</th>
                                        <th colspan="2">Action</th>
                                        <th></th>
                                    </tr>
                                    
                                    <c:forEach var="c" items="${requestScope.courses}">
                                    <tr>
                                        <td>${c.name}</td>
                                        <td>${c.schedule.id}: ${c.schedule.start} - ${c.schedule.end}</td>
                                        <td>${c.lesson} / ${c.week}</td>
                                        <td>${c.teacher.name}</td>
                                        <td>${c.instruction}</td>
                                        <td>${c.price}</td>
                                        <td><a href="${requestScope.contextPath}/manager/course/delete?id=${c.id}" onclick="return confirm('Do you want to delete this Course');" style="text-height: max-size" class="icon-delete"></a> </td>
                                        <td><a href="${requestScope.contextPath}/manager/course/update?id=${c.id}"  style="text-height: max-size" class="icon-input"></a></td>
                                    </tr>
                                    
                                </c:forEach>
                                    
                                </tbody>
                            </table>




                        </div>
                        <div class="col-lg-4 pl-lg-5">
                            <form>

                                <select name="teacher">

                                    <option value="0" selected>teacher</option>
                                    <c:forEach var="t" items="${requestScope.teachers}">
                                        <option value="${t.id}">${t.name}</option>
                                    </c:forEach>
                                </select>
                                <input type="text" name="search" value="${requestScope.search}" />
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
            </div>


            <%--<jsp:include page="view/course/course-list.jsp"/>--%>
            <!-- More Courses -->

            <!-- Footer -->
            <jsp:include page="view/layout/footer/footer.jsp"/>
            <!-- Footer -->


        </div> <!-- .site-wrap -->

        <jsp:include page="view/style/js.jsp"/>

    </body>
</html>
