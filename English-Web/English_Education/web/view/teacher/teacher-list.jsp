<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="site-section" id="teachers-section">
    <div class="container">

        <div class="row mb-5 justify-content-center">
            <div class="col-lg-7 mb-5 text-center"  data-aos="fade-up" data-aos-delay="">
                <h2 class="section-title">Our Teachers</h2>
                <p class="mb-5">In here we have the best teacher English for you </p>
            </div>
        </div>

        <div class="row">
            
            <c:forEach var="t" items="${requestScope.teachers}">

                <div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="teacher text-center">
                        <img src="${t.img}" alt="Image" class="img-fluid w-50 rounded-circle mx-auto mb-4">
                        <div class="py-2">
                            <h3 class="text-black">${t.name}</h3>
                            <p class="position">${t.position}</p>
                            <p style="height: 120px">${t.instruction}</p>
                        </div>
                    </div>
                </div>

            </c:forEach>

        </div>
    </div>
</div>
