<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.List"%>
    <%@page import="bean.Course"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
     <meta name="description" content="">
     <meta name="keywords" content="">
     <meta name="author" content="">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

     <link rel="stylesheet" href="../css/bootstrap.min.css">
     <link rel="stylesheet" href="../css/font-awesome.min.css">
     <link rel="stylesheet" href="../css/owl.carousel.css">
     <link rel="stylesheet" href="../css/owl.theme.default.min.css">

     <!-- MAIN CSS -->
     <link rel="stylesheet" href="../css/templatemo-style.css">
<title>Insert title here</title>
</head>
<% 
	List<Course> cnum=(List<Course>)session.getAttribute("allcourse");
	String price=(String)session.getAttribute("price");
%>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

     <!-- PRE LOADER -->
     <section class="preloader">
          <div class="spinner">

               <span class="spinner-rotate"></span>
               
          </div>
     </section>


     <!-- MENU -->
     <section class="navbar custom-navbar navbar-fixed-top" role="navigation">
          <div class="container">

               <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                         <span class="icon icon-bar"></span>
                         <span class="icon icon-bar"></span>
                         <span class="icon icon-bar"></span>
                    </button>

                    <!-- lOGO TEXT HERE -->
                    <a href="#" class="navbar-brand">嗨嗖教育</a>
               </div>

               <!-- MENU LINKS -->
               <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-nav-first">
                         <li><a href="#top" class="smoothScroll">首页</a></li>
                         <li><a href="#about" class="smoothScroll">发布课程</a></li>
                         <li><a href="#team" class="smoothScroll">我们老师</a></li>
                         <li><a href="#courses" class="smoothScroll">热门课程</a></li>
                         <li><a href="#testimonial" class="smoothScroll">累积收益：<%=price %>元</a></li>
                         <li><a href="#contact" class="smoothScroll">联系我们</a></li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                         <li><a href="#"><i class="fa fa-phone"></i> +151 1364 9268</a></li>
                    </ul>
               </div>

          </div>
     </section>


     <!-- HOME -->
     <section id="home">
          <div class="row">

                    <div class="owl-carousel owl-theme home-slider">
                         <div class="item item-first">
                              <div class="caption">
                                   <div class="container">
                                        <div class="col-md-6 col-sm-12">
                                             <h1>Distance Learning Education Center</h1>
                                             <h3>Our online courses are designed to fit in your industry supporting all-round with latest technologies.</h3>
                                             <a href="#feature" class="section-btn btn btn-default smoothScroll">Discover more</a>
                                        </div>
                                   </div>
                              </div>
                         </div>

                         <div class="item item-second">
                              <div class="caption">
                                   <div class="container">
                                        <div class="col-md-6 col-sm-12">
                                             <h1>Start your journey with our practical courses</h1>
                                             <h3>Our online courses are built in partnership with technology leaders and are designed to meet industry demands.</h3>
                                             <a href="#courses" class="section-btn btn btn-default smoothScroll">Take a course</a>
                                        </div>
                                   </div>
                              </div>
                         </div>

                         <div class="item item-third">
                              <div class="caption">
                                   <div class="container">
                                        <div class="col-md-6 col-sm-12">
                                             <h1>Efficient Learning Methods</h1>
                                             <h3>Nam eget sapien vel nibh euismod vulputate in vel nibh. Quisque eu ex eu urna venenatis sollicitudin ut at libero. Visit <a rel="nofollow" href="https://www.facebook.com/templatemo">templatemo</a> page.</h3>
                                             <a href="#contact" class="section-btn btn btn-default smoothScroll">Let's chat</a>
                                        </div>
                                   </div>
                              </div>
                         </div>
                    </div>
          </div>
     </section>


     <!-- FEATURE -->
     <section id="feature">
          <div class="container">
               <div class="row">

                    <div class="col-md-4 col-sm-4">
                         <div class="feature-thumb">
                              <span>01</span>
                              <h3>聚焦热门</h3>
                              <p>嗨嗖教育是紧扣当下最热门的专业课程，给你最新，最权威，最想要的学习资源，让你学习不走弯路！</p>
                         </div>
                    </div>

                    <div class="col-md-4 col-sm-4">
                         <div class="feature-thumb">
                              <span>02</span>
                              <h3>方便划算</h3>
                              <p>嗨嗖教育致力于让你以最低的资本投入，获取最大的资本学习收益，让你随时都能方便快捷获取到你想要的的学习资源！</p>
                         </div>
                    </div>

                    <div class="col-md-4 col-sm-4">
                         <div class="feature-thumb">
                              <span>03</span>
                              <h3>优质资源</h3>
                              <p>嗨嗖教育打造一流的教师团队，每一位教师都经过我们严格审核才有资格上传教学资源或进行教学活动！</p>
                         </div>
                    </div>

               </div>
          </div>
     </section>


     <!-- ABOUT -->
     <section id="about">
          <div class="container">
               <div class="">
                     <div class="col-md-offset-1 col-md-4 col-sm-12">
                          <div class="entry-form" id="form">
                               <form action="../homepage/AddcourseAction" method="post" enctype="multipart/form-data" >
                    <div><h2 align="center" id="title1">创建课程</h2></div>
                    <div class="same1"><input type="text" value="<%=cnum.get(0).getTno()%>" id="input1" class="form-control" placeholder="讲师编号" name="tno"></div>
                    <div class="same1"><input type="text" value="" id="input2" class="form-control" placeholder="课程编号" name="cno"></div>
                    <div class="same1"><select  id="input3" class="form-control" placeholder="课程类型" name="ctype">
                         <option value="电脑办公">电脑办公</option>
                         <option value="平面设计">平面设计</option>
                         <option value="程序开发">程序开发</option>
                         <option value="网页设计">网页设计</option>
                         <option value="影视动画">影视动画</option>
                         <option value="室内设计">室内设计</option>
                         <option value="室外设计">室外设计</option>
                    </select></div>
                    <div class="same1"><input type="text" value="" id="input4" class="form-control" placeholder="课程名称" name="cname"></div>
                    <div class="same1"><input type="text" value="" id="input5" class="form-control" placeholder="课程描述" name="cdescribe"></div>
                    <div class="same1"><input type="text" value=""  placeholder="课程价格" class="form-control" name="cprice"></div>
                    <div class="same1"><input type="file" value="" id="input7" class="form-control" placeholder="上传文件" name="filename"></div>
                    <div align="center"><input type="submit" value="提交" class="submit-btn form-control" id="form-submit" ></div>
                 </form>
                          </div>
                     </div>
                   

                    <div class="col-md-offset-1 col-md-4 col-sm-12">
                         <div class="entry-form">
                              <form action="../homepage/AddchapterAction" method="post" enctype="multipart/form-data">
                    <div><h2 align="center" id="title2">发布课程</h2></div>
                    <div class="same1"><select id="" placeholder="课程编号" class="form-control" name="cno">
                         <%for(int i=0;i<cnum.size();i++) {%>
                         <option value="<%=cnum.get(i).getCno()%>"><%=cnum.get(i).getCname()%></option>
                         <%} %>
                    </select></div>
                    <div class="same1"><input type="text" value="" id="input9" class="form-control" placeholder="文件编号" name="fno"></div>
                    <div class="same1"><input type="text" value="" id="input10" class="form-control" placeholder="文件名字" name="fname"></div>
                    <div class="same1"><input type="text" value="" id="input11" class="form-control" placeholder="课程金币" name="fprice"></div>
                    <div class="same1"><input type="file" value="" id="input12" class="form-control" placeholder="上传视频" name="upload"> </div>
                    <div align="center"><input type="submit" value="提交" class="submit-btn form-control" id="form-submit"></div>
               </form>
                         </div>
                    </div>

               </div>
          </div>
     </section>


     <!-- TEAM -->
     <section id="team">
          <div class="container">
               <div class="row">

                    <div class="col-md-12 col-sm-12">
                         <div class="section-title">
                              <h2>Teachers <small>Meet Professional Trainers</small></h2>
                         </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                         <div class="team-thumb">
                              <div class="team-image">
                                   <img src="../images/author-image1.jpg" class="img-responsive" alt="">
                              </div>
                              <div class="team-info">
                                   <h3>Mark Wilson</h3>
                                   <span>I love Teaching</span>
                              </div>
                              <ul class="social-icon">
                                   <li><a href="#" class="fa fa-facebook-square" attr="facebook icon"></a></li>
                                   <li><a href="#" class="fa fa-twitter"></a></li>
                                   <li><a href="#" class="fa fa-instagram"></a></li>
                              </ul>
                         </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                         <div class="team-thumb">
                              <div class="team-image">
                                   <img src="../images/author-image2.jpg" class="img-responsive" alt="">
                              </div>
                              <div class="team-info">
                                   <h3>Catherine</h3>
                                   <span>Education is the key!</span>
                              </div>
                              <ul class="social-icon">
                                   <li><a href="#" class="fa fa-google"></a></li>
                                   <li><a href="#" class="fa fa-instagram"></a></li>
                              </ul>
                         </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                         <div class="team-thumb">
                              <div class="team-image">
                                   <img src="../images/author-image3.jpg" class="img-responsive" alt="">
                              </div>
                              <div class="team-info">
                                   <h3>Jessie Ca</h3>
                                   <span>I like Online Courses</span>
                              </div>
                              <ul class="social-icon">
                                   <li><a href="#" class="fa fa-twitter"></a></li>
                                   <li><a href="#" class="fa fa-envelope-o"></a></li>
                                   <li><a href="#" class="fa fa-linkedin"></a></li>
                              </ul>
                         </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                         <div class="team-thumb">
                              <div class="team-image">
                                   <img src="../images/author-image4.jpg" class="img-responsive" alt="">
                              </div>
                              <div class="team-info">
                                   <h3>Andrew Berti</h3>
                                   <span>Learning is fun</span>
                              </div>
                              <ul class="social-icon">
                                   <li><a href="#" class="fa fa-twitter"></a></li>
                                   <li><a href="#" class="fa fa-google"></a></li>
                                   <li><a href="#" class="fa fa-behance"></a></li>
                              </ul>
                         </div>
                    </div>

               </div>
          </div>
     </section>


     <!-- Courses -->
     <section id="courses">
          <div class="container">
               <div class="row">

                    <div class="col-md-12 col-sm-12">
                         <div class="section-title">
                              <h2>Popular Courses <small>Upgrade your skills with newest courses</small></h2>
                         </div>

                         <div class="owl-carousel owl-theme owl-courses">
                              <div class="col-md-4 col-sm-4">
                                   <div class="item">
                                        <div class="courses-thumb">
                                             <div class="courses-top">
                                                  <div class="courses-image">
                                                       <img src="../images/courses-image1.jpg" class="img-responsive" alt="">
                                                  </div>
                                                  <div class="courses-date">
                                                       <span><i class="fa fa-calendar"></i> 12 / 7 / 2018</span>
                                                       <span><i class="fa fa-clock-o"></i> 7 Hours</span>
                                                  </div>
                                             </div>

                                             <div class="courses-detail">
                                                  <h3><a href="#">Social Media Management</a></h3>
                                                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                             </div>

                                             <div class="courses-info">
                                                  <div class="courses-author">
                                                       <img src="../images/author-image1.jpg" class="img-responsive" alt="">
                                                       <span>Mark Wilson</span>
                                                  </div>
                                                  <div class="courses-price">
                                                       <a href="#"><span>USD 25</span></a>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>

                              <div class="col-md-4 col-sm-4">
                                   <div class="item">
                                        <div class="courses-thumb">
                                             <div class="courses-top">
                                                  <div class="courses-image">
                                                       <img src="../images/courses-image2.jpg" class="img-responsive" alt="">
                                                  </div>
                                                  <div class="courses-date">
                                                       <span><i class="fa fa-calendar"></i> 20 / 7 / 2018</span>
                                                       <span><i class="fa fa-clock-o"></i> 4.5 Hours</span>
                                                  </div>
                                             </div>

                                             <div class="courses-detail">
                                                  <h3><a href="#">Graphic & Web Design</a></h3>
                                                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                             </div>

                                             <div class="courses-info">
                                                  <div class="courses-author">
                                                       <img src="../images/author-image2.jpg" class="img-responsive" alt="">
                                                       <span>Jessica</span>
                                                  </div>
                                                  <div class="courses-price">
                                                       <a href="#"><span>USD 80</span></a>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>

                              <div class="col-md-4 col-sm-4">
                                   <div class="item">
                                        <div class="courses-thumb">
                                             <div class="courses-top">
                                                  <div class="courses-image">
                                                       <img src="../images/courses-image3.jpg" class="img-responsive" alt="">
                                                  </div>
                                                  <div class="courses-date">
                                                       <span><i class="fa fa-calendar"></i> 15 / 8 / 2018</span>
                                                       <span><i class="fa fa-clock-o"></i> 6 Hours</span>
                                                  </div>
                                             </div>

                                             <div class="courses-detail">
                                                  <h3><a href="#">Marketing Communication</a></h3>
                                                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                             </div>

                                             <div class="courses-info">
                                                  <div class="courses-author">
                                                       <img src="../images/author-image3.jpg" class="img-responsive" alt="">
                                                       <span>Catherine</span>
                                                  </div>
                                                  <div class="courses-price free">
                                                       <a href="#"><span>Free</span></a>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>

                              <div class="col-md-4 col-sm-4">
                                   <div class="item">
                                        <div class="courses-thumb">
                                             <div class="courses-top">
                                                  <div class="courses-image">
                                                       <img src="../images/courses-image4.jpg" class="img-responsive" alt="">
                                                  </div>
                                                  <div class="courses-date">
                                                       <span><i class="fa fa-calendar"></i> 10 / 8 / 2018</span>
                                                       <span><i class="fa fa-clock-o"></i> 8 Hours</span>
                                                  </div>
                                             </div>

                                             <div class="courses-detail">
                                                  <h3><a href="#">Summer Kids</a></h3>
                                                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                             </div>

                                             <div class="courses-info">
                                                  <div class="courses-author">
                                                       <img src="../images/author-image1.jpg" class="img-responsive" alt="">
                                                       <span>Mark Wilson</span>
                                                  </div>
                                                  <div class="courses-price">
                                                       <a href="#"><span>USD 45</span></a>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>

                              <div class="col-md-4 col-sm-4">
                                   <div class="item">
                                        <div class="courses-thumb">
                                             <div class="courses-top">
                                                  <div class="courses-image">
                                                       <img src="../images/courses-image5.jpg" class="img-responsive" alt="">
                                                  </div>
                                                  <div class="courses-date">
                                                       <span><i class="fa fa-calendar"></i> 5 / 10 / 2018</span>
                                                       <span><i class="fa fa-clock-o"></i> 10 Hours</span>
                                                  </div>
                                             </div>

                                             <div class="courses-detail">
                                                  <h3><a href="#">Business &amp; Management</a></h3>
                                                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                             </div>

                                             <div class="courses-info">
                                                  <div class="courses-author">
                                                       <img src="../images/author-image2.jpg" class="img-responsive" alt="">
                                                       <span>Jessica</span>
                                                  </div>
                                                  <div class="courses-price free">
                                                       <a href="#"><span>Free</span></a>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>

                         </div>

               </div>
          </div>
     </section>


     <!-- TESTIMONIAL -->
     <section id="testimonial">
          <div class="container">
               <div class="row">

                    <div class="col-md-12 col-sm-12">
                         <div class="section-title">
                              <h2>Student Reviews <small>from around the world</small></h2>
                         </div>

                         <div class="owl-carousel owl-theme owl-client">
                              <div class="col-md-4 col-sm-4">
                                   <div class="item">
                                        <div class="tst-image">
                                             <img src="../images/tst-image1.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="tst-author">
                                             <h4>Jackson</h4>
                                             <span>Shopify Developer</span>
                                        </div>
                                        <p>You really do help young creative minds to get quality education and professional job search assistance. I’d recommend it to everyone!</p>
                                        <div class="tst-rating">
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                        </div>
                                   </div>
                              </div>

                              <div class="col-md-4 col-sm-4">
                                   <div class="item">
                                        <div class="tst-image">
                                             <img src="../images/tst-image2.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="tst-author">
                                             <h4>Camila</h4>
                                             <span>Marketing Manager</span>
                                        </div>
                                        <p>Trying something new is exciting! Thanks for the amazing law course and the great teacher who was able to make it interesting.</p>
                                        <div class="tst-rating">
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                        </div>
                                   </div>
                              </div>

                              <div class="col-md-4 col-sm-4">
                                   <div class="item">
                                        <div class="tst-image">
                                             <img src="../images/tst-image3.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="tst-author">
                                             <h4>Barbie</h4>
                                             <span>Art Director</span>
                                        </div>
                                        <p>Donec erat libero, blandit vitae arcu eu, lacinia placerat justo. Sed sollicitudin quis felis vitae hendrerit.</p>
                                        <div class="tst-rating">
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                        </div>
                                   </div>
                              </div>

                              <div class="col-md-4 col-sm-4">
                                   <div class="item">
                                        <div class="tst-image">
                                             <img src="../images/tst-image4.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="tst-author">
                                             <h4>Andrio</h4>
                                             <span>Web Developer</span>
                                        </div>
                                        <p>Nam eget mi eu ante faucibus viverra nec sed magna. Vivamus viverra sapien ex, elementum varius ex sagittis vel.</p>
                                        <div class="tst-rating">
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                        </div>
                                   </div>
                              </div>

                         </div>

               </div>
          </div>
     </section> 


     <!-- CONTACT -->
     <section id="contact">
          <div class="container">
               <div class="row">

                    <div class="col-md-6 col-sm-12">
                         <form id="contact-form" role="form" action="" method="post">
                              <div class="section-title">
                                   <h2>Contact us <small>we love conversations. let us talk!</small></h2>
                              </div>

                              <div class="col-md-12 col-sm-12">
                                   <input type="text" class="form-control" placeholder="Enter full name" name="name" required="">
                    
                                   <input type="email" class="form-control" placeholder="Enter email address" name="email" required="">

                                   <textarea class="form-control" rows="6" placeholder="Tell us about your message" name="message" required=""></textarea>
                              </div>

                              <div class="col-md-4 col-sm-12">
                                   <input type="submit" class="form-control" name="send message" value="Send Message">
                              </div>

                         </form>
                    </div>

                    <div class="col-md-6 col-sm-12">
                         <div class="contact-image">
                              <img src="../images/contact-image.jpg" class="img-responsive" alt="Smiling Two Girls">
                         </div>
                    </div>

               </div>
          </div>
     </section>       


     <!-- FOOTER -->
     <footer id="footer">
          <div class="container">
               <div class="row">

                    <div class="col-md-4 col-sm-6">
                         <div class="footer-info">
                              <div class="section-title">
                                   <h2>Headquarter</h2>
                              </div>
                              <address>
                                   <p>1800 dapibus a tortor pretium,<br> Integer nisl dui, ABC 12000</p>
                              </address>

                              <ul class="social-icon">
                                   <li><a href="#" class="fa fa-facebook-square" attr="facebook icon"></a></li>
                                   <li><a href="#" class="fa fa-twitter"></a></li>
                                   <li><a href="#" class="fa fa-instagram"></a></li>
                              </ul>

                              <div class="copyright-text"> 
                                   <p>Copyright &copy; 2019 Company Name</p>
                                   
                                   <p>Design: TemplateMo</p>
                              </div>
                         </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                         <div class="footer-info">
                              <div class="section-title">
                                   <h2>Contact Info</h2>
                              </div>
                              <address>
                                   <p>+65 2244 1100, +66 1800 1100</p>
                                   <p><a href="mailto:youremail.co">hello@youremail.co</a></p>
                              </address>

                              <div class="footer_menu">
                                   <h2>Quick Links</h2>
                                   <ul>
                                        <li><a href="#">Career</a></li>
                                        <li><a href="#">Investor</a></li>
                                        <li><a href="#">Terms & Conditions</a></li>
                                        <li><a href="#">Refund Policy</a></li>
                                   </ul>
                              </div>
                         </div>
                    </div>

                    <div class="col-md-4 col-sm-12">
                         <div class="footer-info newsletter-form">
                              <div class="section-title">
                                   <h2>Newsletter Signup</h2>
                              </div>
                              <div>
                                   <div class="form-group">
                                        <form action="#" method="get">
                                             <input type="email" class="form-control" placeholder="Enter your email" name="email" id="email" required="">
                                             <input type="submit" class="form-control" name="submit" id="form-submit" value="Send me">
                                        </form>
                                        <span><sup>*</sup> Please note - we do not spam your email.</span>
                                   </div>
                              </div>
                         </div>
                    </div>
                    
               </div>
          </div>
     </footer>


     <!-- SCRIPTS -->
     <script src="../js/jquery.js"></script>
     <script src="../js/bootstrap.min.js"></script>
     <script src="../js/owl.carousel.min.js"></script>
     <script src="../js/smoothscroll.js"></script>
     <script src="../js/custom.js"></script>

</body>
</html>