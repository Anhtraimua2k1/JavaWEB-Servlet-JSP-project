<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${requestScope.course !=null}">
    <div class="mb-5">
        <h3 class="text-black">${requestScope.course.name}</h3>
        <p class="mb-4">
            <strong class="text-black mr-3">Schedule: </strong> MWF ${requestScope.course.schedule.start} - ${requestScope.course.schedule.end}
        </p>
        <p>${requestScope.course.description}</p>
        <p>Molestias sit temporibus ullam voluptatem quibusdam. Accusamus labore perspiciatis similique veritatis ipsum iure quas. Nulla perspiciatis unde eveniet nihil, nesciunt repellat maxime ab libero minima voluptas dolore repudiandae adipisci. Cumque!</p>
        <p>Enim harum voluptatem, itaque in illum quas temporibus tempore sit tempora quam atque eveniet, non aspernatur dignissimos aliquid praesentium exercitationem delectus, maxime velit saepe! Qui asperiores iure reprehenderit ad voluptas!</p>
        <div class="row mb-4">
            <div class="col-md-6">
                <img src="images/img_1.jpg" alt="Image" class="img-fluid rounded">
            </div>
            <div class="col-md-6">
                <img src="images/img_2.jpg" alt="Image" class="img-fluid rounded">
            </div>
        </div>
        <p>Ipsam fuga fugiat vero repudiandae, tenetur a ullam, expedita perspiciatis dolores rem quibusdam numquam dicta sint unde repellat magni recusandae. Id, quibusdam, voluptatum. Amet mollitia ratione, illum animi quia ex?</p>
        <p>Sint aut repudiandae, in amet nemo. Nobis labore id iure molestias reprehenderit quisquam illo quod cum dolorum aspernatur ut sequi, facere beatae, porro cupiditate magnam laborum laudantium laboriosam ab autem!</p>
        
        <c:if test="${sessionScope.user.type != 1}">
            <p class="mt-4"><a href="learn?courseId=${requestScope.course.id}" class="btn btn-primary">Admission</a></p>
        </c:if> 
    </div>

</c:if>

