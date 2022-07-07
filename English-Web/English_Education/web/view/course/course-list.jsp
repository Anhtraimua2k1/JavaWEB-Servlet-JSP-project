<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="site-section courses-entry-wrap"  data-aos="fade-up" data-aos-delay="100">
    <div class="container">
        <div class="row">
            <!-- list -->
            <div class="owl-carousel col-12 nonloop-block-14">
                <c:forEach var="c" items="${requestScope.courses}">
                    <!-- course -->
                    <div class="course bg-white h-100 align-self-stretch">
                        <figure class="m-0">
                            <a href="course?id=${c.id}"><img src="${c.img}" alt="Image" class="img-fluid"></a>
                        </figure>
                        <div class="course-inner-text py-4 px-4">
                            <span class="course-price">${c.price}$</span>
                            <div class="meta"><span class="icon-clock-o"></span>${c.lesson} Lessons / ${c.week} week</div>
                            <h3><a href="course?id=${c.id}">${c.name}</a></h3>
                            <p style="height: 120px">${c.instruction} </p>
                        </div>
                        <div class="d-flex border-top stats">
                            <div class="py-3 px-4"><span class="icon-users"></span> ${c.numOfStudent} students</div>
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
</div>

