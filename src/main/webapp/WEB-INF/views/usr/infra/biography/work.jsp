<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MyPortfolio Bootstrap Template - Works</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
 
    <!-- Favicons -->
  <link href="resources/images/myFortFolio/favicon.png" rel="icon">
  <link href="resources/images/myFortFolio/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=https://fonts.googleapis.com/css?family=Inconsolata:400,500,600,700|Raleway:400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/vender/myFortFolio/aos/aos.css" rel="stylesheet">
  <link href="resources/vender/myFortFolio/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/vender/myFortFolio/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/vender/myFortFolio/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/css/myFortFolio/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: MyPortfolio
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com/myportfolio-bootstrap-portfolio-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

  <!-- fontawesome -->
  <script src="https://kit.fontawesome.com/e402926c7b.js" crossorigin="anonymous"></script>
</head>

<body>

  <!-- ======= Navbar ======= -->
  <div class="collapse navbar-collapse custom-navmenu" id="main-navbar">
    <div class="container py-2 py-md-5">
      <div class="row align-items-start">
        <div class="col-md-2">
          <ul class="custom-menu">
            <li><a href="/">Home</a></li>
            <li><a href="/aboutMe">About Me</a></li>
            <li><a href="/service">Services</a></li>
            <li class="active"><a href="/work">Works</a></li>
            <li><a href="/contact">Contact</a></li>
          </ul>
        </div>
        <div class="col-md-6 d-none d-md-block  mr-auto">
          <h3>SNS</h3>
          <p>
            죄송하지만 SNS는 일절 하지 않고 있어서 개인 SNS사이트가 없는 점 양해바랍니다.<br>
            SNS 시작하면 올려드리겠습니다.<br>
            죄송합니다.
          </p>
        </div>
        <div class="col-md-4 d-none d-md-block">
          <h3>채용 문의</h3>
          <p>아래에 있는 이메일주소로 메일을 보내주신다면 감사하겠습니다. 궁금한 것도 있다면 친절하게 알려드리니 망설이지 마세요! 감사합니다. <br> <a href="mailto:rainy2368@gmail.com">rainy2368@gmail.com</a></p>
      </div>
      </div>

    </div>
  </div>

  <nav class="navbar navbar-light custom-navbar">
    <div class="container">
      <a class="navbar-brand" href="/">MyPortfolio.</a>
      <a href="#" class="burger" data-bs-toggle="collapse" data-bs-target="#main-navbar">
        <span></span>
      </a>
    </div>
  </nav>

  <main id="main">

    <!-- ======= Works Section ======= -->
    <section class="section site-portfolio">
      <div class="container">
        <div class="row mb-5 align-items-center">
          <div class="col-md-12 col-lg-6 mb-4 mb-lg-0" data-aos="fade-up">
            <h2>안녕하세요. 이승민입니다.</h2>
            <p class="mb-0">제가 만든 사이트들입니다. 한번 보시죠</p>
          </div>
          <div class="col-md-12 col-lg-6 text-start text-lg-end" data-aos="fade-up" data-aos-delay="100">
            <div id="filters" class="filters">
              <a href="#" data-filter="*" class="active">All</a>
              <a href="#" data-filter=".web">Web</a>
              <a href="#" data-filter=".design">Design</a>
              <a href="#" data-filter=".branding">Branding</a>
              <a href="#" data-filter=".photography">Photography</a>
            </div>
          </div>
        </div>
        <div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200">
          <div class="item web col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="/work_one" class="item-wrap fancybox">
              <div class="work-info">
                <h3>Project NSA</h3>
                <span>web site - 개인 제작</span>
              </div>
              <img class="img-fluid" src="resources/images/myFortFolio/img_1.jpg">
            </a>
          </div>
          <!-- <div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>Build Indoo</h3>
                <span>Photography</span>
              </div>
              <img class="img-fluid" src="resources/images/myFortFolio/img_2.jpg">
            </a>
          </div> -->
       <!--    <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>Cocooil</h3>
                <span>Branding</span>
              </div>
              <img class="img-fluid" src="resources/images/myFortFolio/img_3.jpg">
            </a>
          </div> -->
          <!-- <div class="item design col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>Nike Shoe</h3>
                <span>Design</span>
              </div>
              <img class="img-fluid" src="resources/images/myFortFolio/img_4.jpg">
            </a>
          </div> -->
          <!-- <div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>Kitchen Sink</h3>
                <span>Photography</span>
              </div>
              <img class="img-fluid" src="resources/images/myFortFolio/img_5.jpg">
            </a>
          </div> -->
         <!--  <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>Amazon</h3>
                <span>brandingn</span>
              </div>
              <img class="img-fluid" src="resources/images/myFortFolio/img_6.jpg">
            </a>
          </div> -->
        </div>
      </div>
    </section><!-- End  Works Section -->

    <!-- ======= Testimonials Section ======= -->
    <section class="section pt-0">
      <div class="container">

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-wrap">
                <div class="testimonial">
                  <img src="resources/images/myFortFolio/person_1.jpg" alt="Image" class="img-fluid">
                  <blockquote>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam necessitatibus incidunt ut officiis
                      explicabo inventore.</p>
                  </blockquote>
                  <p>&mdash; Jean Hicks</p>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-wrap">
                <div class="testimonial">
                  <img src="resources/images/myFortFolio/person_2.jpg" alt="Image" class="img-fluid">
                  <blockquote>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam necessitatibus incidunt ut officiis
                      explicabo inventore.</p>
                  </blockquote>
                  <p>&mdash; Chris Stanworth</p>
                </div>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Testimonials Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer class="footer" role="contentinfo">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p class="mb-1">&copy; Copyright MyPortfolio. All Rights Reserved</p>
          <div class="credits">
            <!--
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=MyPortfolio
          -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>
        <div class="col-sm-6 social text-md-end">
          <a href="#"><span class="bi bi-twitter"></span></a>
          <a href="#"><span class="bi bi-facebook"></span></a>
          <a href="#"><span class="bi bi-instagram"></span></a>
          <a href="#"><span class="bi bi-linkedin"></span></a>
        </div>
      </div>
    </div>
  </footer>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="resources/vender/myFortFolio/aos/aos.js"></script>
  <script src="resources/vender/myFortFolio/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/vender/myFortFolio/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resources/vender/myFortFolio/swiper/swiper-bundle.min.js"></script>
  <script src="resources/vender/myFortFolio/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/js/myFortFolio/main.js"></script>

</body>

</html>