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

                            <!-- Course Description -->
                            <jsp:include page="view/course/course-description.jsp"/>
                            <!-- Course Description -->

                            <div class="pt-5">
                                <h3 class="mb-5">6 Comments</h3>
                                <ul class="comment-list">
                                    <li class="comment">
                                        <div class="vcard bio">
                                            <img src="images/person_1.jpg" alt="Image placeholder">
                                        </div>
                                        <div class="comment-body">
                                            <h3>Jean Doe</h3>
                                            <div class="meta">January 9, 2018 at 2:21pm</div>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                                            <p><a href="#" class="reply">Reply</a></p>
                                        </div>
                                    </li>

                                    <li class="comment">
                                        <div class="vcard bio">
                                            <img src="images/person_1.jpg" alt="Image placeholder">
                                        </div>
                                        <div class="comment-body">
                                            <h3>Jean Doe</h3>
                                            <div class="meta">January 9, 2018 at 2:21pm</div>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                                            <p><a href="#" class="reply">Reply</a></p>
                                        </div>

                                        <ul class="children">
                                            <li class="comment">
                                                <div class="vcard bio">
                                                    <img src="images/person_1.jpg" alt="Image placeholder">
                                                </div>
                                                <div class="comment-body">
                                                    <h3>Jean Doe</h3>
                                                    <div class="meta">January 9, 2018 at 2:21pm</div>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                                                    <p><a href="#" class="reply">Reply</a></p>
                                                </div>


                                                <ul class="children">
                                                    <li class="comment">
                                                        <div class="vcard bio">
                                                            <img src="images/person_1.jpg" alt="Image placeholder">
                                                        </div>
                                                        <div class="comment-body">
                                                            <h3>Jean Doe</h3>
                                                            <div class="meta">January 9, 2018 at 2:21pm</div>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                                                            <p><a href="#" class="reply">Reply</a></p>
                                                        </div>

                                                        <ul class="children">
                                                            <li class="comment">
                                                                <div class="vcard bio">
                                                                    <img src="images/person_1.jpg" alt="Image placeholder">
                                                                </div>
                                                                <div class="comment-body">
                                                                    <h3>Jean Doe</h3>
                                                                    <div class="meta">January 9, 2018 at 2:21pm</div>
                                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                                                                    <p><a href="#" class="reply">Reply</a></p>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="comment">
                                        <div class="vcard bio">
                                            <img src="images/person_1.jpg" alt="Image placeholder">
                                        </div>
                                        <div class="comment-body">
                                            <h3>Jean Doe</h3>
                                            <div class="meta">January 9, 2018 at 2:21pm</div>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                                            <p><a href="#" class="reply">Reply</a></p>
                                        </div>
                                    </li>
                                </ul>
                                <!-- END comment-list -->

                                <div class="comment-form-wrap pt-5">
                                    <h3 class="mb-5">Leave a comment</h3>
                                    <form action="#" class="p-5 bg-light">
                                        <div class="form-group">
                                            <label for="name">Name *</label>
                                            <input type="text" class="form-control" id="name">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email *</label>
                                            <input type="email" class="form-control" id="email">
                                        </div>
                                        <div class="form-group">
                                            <label for="website">Website</label>
                                            <input type="url" class="form-control" id="website">
                                        </div>

                                        <div class="form-group">
                                            <label for="message">Message</label>
                                            <textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" value="Post Comment" class="btn btn-primary">
                                        </div>

                                    </form>
                                </div>
                            </div>



                        </div>
                        <div class="col-lg-4 pl-lg-5">
                            <!-- course-instructor -->
                            <jsp:include page="view/course/course-instructor.jsp"/>
                            <!-- course-instructor -->

                        </div>
                    </div>
                </div>
            </div>
            <!-- More Courses -->
            <div class="site-section courses-title bg-dark" id="courses-section">
                <div class="container">
                    <div class="row mb-5 justify-content-center">
                        <div class="col-lg-7 text-center" data-aos="fade-up" data-aos-delay="">
                            <h2 class="section-title">More Courses</h2>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="view/course/course-list.jsp"/>
            <!-- More Courses -->

            <!-- Footer -->
            <jsp:include page="view/layout/footer/footer.jsp"/>
            <!-- Footer -->


        </div> <!-- .site-wrap -->

        <jsp:include page="view/style/js.jsp"/>
        
    </body>
</html>
