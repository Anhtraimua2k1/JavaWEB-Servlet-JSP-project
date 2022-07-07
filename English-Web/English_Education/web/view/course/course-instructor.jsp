<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="mb-5 text-center border rounded course-instructor">
              <h3 class="mb-5 text-black text-uppercase h6 border-bottom pb-3">Course Instructor</h3>
              <div class="mb-4 text-center">
                <img src="${requestScope.course.teacher.img}" alt="${requestScope.course.teacher.img}" class="w-25 rounded-circle mb-4">  
                <h3 class="h5 text-black mb-4">${requestScope.course.teacher.name}</h3>
                <p style="height: 120px">${requestScope.course.teacher.instruction}</p>
              </div>
            </div>
