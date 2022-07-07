<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="intro-section single-cover" id="home-section">
      
      <div class="slide-1 " style="background-image: url('${requestScope.course.img}');" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-12">
              <div class="row justify-content-center align-items-center text-center">
                <div class="col-lg-6">
                  <h1 data-aos="fade-up" data-aos-delay="0">${requestScope.course.name}</h1>
                  <p data-aos="fade-up" data-aos-delay="100">${requestScope.course.lesson} Lessons / ${requestScope.course.week} Week &bullet; ${requestScope.course.numOfStudent} students &bullet; <a href="#" class="text-white">6 comments</a></p>
                </div>

                
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>
