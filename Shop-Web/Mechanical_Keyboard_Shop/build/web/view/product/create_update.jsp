<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro - HTML Ecommerce Template</title>

        <jsp:include page="../style/css.jsp"/>


    </head>
    <body>
        <!-- HEADER -->
        <jsp:include page = "../page/header/header.jsp"/>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <jsp:include page="../page/navigation/navigation.jsp"/>
        <!-- /NAVIGATION -->

        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Adminator Page</h3>
                        <ul class="breadcrumb-tree">
                            <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                            <li class="active"></li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <form action="
                          <c:if test="<%= ("" + request.getAttribute("uri")).contains("update")%>">update</c:if>
                          <c:if test="<%= ("" + request.getAttribute("uri")).contains("create")%>">create</c:if>
                              " method="POST">
                <!-- row -->
                <div class="row">
                    
                              <div class="billing-details">
                                  <div class="section-title">
                                      <h3 class="title"> <c:if test="<%= ("" + request.getAttribute("uri")).contains("update")%>">Update</c:if> <c:if test="<%= ("" + request.getAttribute("uri")).contains("create")%>">Create</c:if> Product</h3>
                                  </div>
                                  <div class="form-group">
                                          <input class="input" type="hidden" name="id" placeholder="id" value="${requestScope.product.id}">
                                  </div>
                                  
                                  <div class="form-group">
                                      Product Name: <input class="input" type="text" name="name" placeholder="Name" value="${requestScope.product.name}" required>
                                  </div>
                                  <div class="form-group">
                                      Description: <input class="input" type="text" name="description" placeholder="Description" value="${requestScope.product.description}" required>
                                  </div>
                                  <div class="form-group">
                                      Brand: <input class="input" type="text" name="brand" placeholder="Brand" value="${requestScope.product.brand}"  required>
                                  </div>
                                  <div class="form-group">
                                      Price: <input class="input" type="number" name="price" placeholder="Price" value="${requestScope.product.price}"  required>
                                  </div>
                                  <div class="form-group">

                                      Category: <select name="category" required> 
                                          <option disabled > Category </option>
                                      <c:forEach var="c" items="${requestScope.categories}">
                                          <option value="${c.id}" <c:if test="${requestScope.product.category.id == c.id}"> selected </c:if> >${c.name}</option>
                                      </c:forEach>
                                          
                                      </select>
                                  </div>
                                  <div class="form-group">
                                      Image 1: 
                                      <input class="input" type="text" name="img_1" placeholder="Image 1" value="${requestScope.product.img_1}" required><img src="${requestScope.product.img_1}" height="300px"/> 
                                  </div>
                                  <div class="form-group">
                                      Image 2: 
                                      <input class="input" type="text" name="img_2" placeholder="Image 2" value="${requestScope.product.img_2}" required><img src="${requestScope.product.img_2}" height="300px"/> 
                                  </div>
                                  <div class="form-group">
                                      Image 3: 
                                      <input class="input" type="tel" name="img_3" placeholder="Image 3" value="${requestScope.product.img_3}" required><img src="${requestScope.product.img_3}" height="300px"/> 
                                  </div>
                                  
                                      
                                  
                              </div>    

                          
                                        <input type="submit" style="text-align: center"  value=
                                      <c:if test="<%= ("" + request.getAttribute("uri")).contains("update")%>">"update" Onclick="return confirm('Do you want to update this Product?')" </c:if>
                                      <c:if test="<%= ("" + request.getAttribute("uri")).contains("create")%>">"create"</c:if>
                                           />

                    </div>
                                          
                                          
                    <!-- /row -->
                    </form>
                    
                </div>
                <!-- /container -->
            </div>
            <!-- /SECTION -->



            <!-- FOOTER -->
        <jsp:include page="../page/footer/footer.jsp"/>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <jsp:include page="../style/js.jsp"/>

    </body>
</html>

