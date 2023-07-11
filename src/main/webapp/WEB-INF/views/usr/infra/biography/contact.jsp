<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>welcome to SeungMin World</title>
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
            <li><a href="/work">Works</a></li>
            <li class="active"><a href="/contact">Contact</a></li>
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

    <section class="section pb-5">
      <div class="container">

        <div class="row mb-5 align-items-end">
          <div class="col-md-6" data-aos="fade-up">
            <h2>의뢰가 필요하신가요?</h2>
            <p class="mb-0">
              아래의 내용을 작성하시고 보내주시면 확인 후 제가 연락 드리도록 하겠습니다.<br>
              궁금한 문의사항이라도 항상 감사할 따름입니다.<br>
              감사합니다.
            </p>
          </div>

        </div>

        <div class="row">
          <div class="col-md-6 mb-5 mb-md-0" data-aos="fade-up">

            <form action="forms/contact.php" method="post" role="form" class="php-email-form">

              <div class="row gy-3">
                <div class="col-md-6 form-group">
                  <label for="name">이름</label>
                  <input type="text" name="name" class="form-control" id="name" required>
                </div>
                <div class="col-md-6 form-group">
                  <label for="name">이메일주소</label>
                  <input type="email" class="form-control" name="email" id="email" required>
                </div>
                <div class="col-md-12 form-group">
                  <label for="name">의뢰하실 프로젝트 명</label>
                  <input type="text" class="form-control" name="subject" id="subject" required>
                </div>
                <div class="col-md-12 form-group">
                  <label for="name">의뢰 내용</label>
                  <textarea class="form-control" name="message" cols="30" rows="10" required></textarea>
                </div>

                <div class="col-md-12 my-3">
                  <div class="loading">Loading</div>
                  <div class="error-message"></div>
                  <div class="sent-message">메세지가 전달 되었습니다. 감사합니다!</div>
                </div>

                <div class="col-md-6 mt-0 form-group">
                  <input type="submit" class="readmore d-block w-100" value="Send Message">
                </div>
              </div>

            </form>

          </div>

          <div class="col-md-4 ml-auto order-2" data-aos="fade-up">
            <ul class="list-unstyled">
              <li class="mb-3">
                <strong class="d-block mb-1">Address</strong>
                <span>김포시 장기동 2018-2 라베니체마치에비뉴. 대한민국</span>
              </li>
              <li class="mb-3">
                <strong class="d-block mb-1">Phone</strong>
                <span>+82 010 5035 5926</span>
              </li>
              <li class="mb-3">
                <strong class="d-block mb-1">Email</strong>
                <span>rainy2368@gmail.com</span>
              </li>
            </ul>
          </div>

        </div>

      </div>

    </section>

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

 <!-- Vender JS Files -->
  <script src="resources/vender/myFortFolio/aos/aos.js"></script>
  <script src="resources/vender/myFortFolio/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/vender/myFortFolio/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resources/vender/myFortFolio/swiper/swiper-bundle.min.js"></script>
  <script src="resources/vender/myFortFolio/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/js/myFortFolio/main.js"></script>

</body>

</html>