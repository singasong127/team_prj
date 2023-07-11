<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../resources/css/project_nsa/user/UserPage.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/e402926c7b.js" crossorigin="anonymous"></script>
    <title>project NSA(예제 프로젝트)</title>
</head>
<body>
    <header id="head_backg">
        <div id="wrap" class="wrap_container">
            <div class="">
                <div id="head_nav_bar">
                    <ul class="nav justify-content-end">
                        <li class="nav-item">
                            <a href="/projectNSA/join" class="nav-link">회원가입</a>
                        </li>
                        <li class="nav-item">
                            <a href="/projectNSA/login" class="nav-link">로그인</a>
                        </li>
                        <li class="nav-item">
                            <a href="myPage.html" class="nav-link">마이페이지</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">장바구니</a>
                        </li>
                        <li class="nav-item">
                            <a href="QandA.html" class="nav-link">고객센터</a>
                        </li>
                    </ul>
                </div>
                <div id="title_box" class="d-flex flex-row justify-content-evenly">
                    <i class="fa-solid fa-book-open-reader align-self-center" style="font-size: 135px; color: rgb(206, 179, 26);"></i>
                    <div class="text-center">
                        <h1 id="title_box_title">예제 : PROJECT NSA(문고/서점)</h1>
                        <form class="d-flex col-auto" role="search">
                            <button class="btn btn-outline-success" type="submit"><i class="bi bi-search"></i></button>
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        </form>
                    </div>
                </div>
            </div>
            <nav class="nav navbar-expand-lg bg-light">
               <div class="">
                   <ul class="nav">
                        <li class="nav-item">
                            <a href="notice.html" class="nav-link">공지사항</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">베스트셀러</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">화제의신간</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">국내도서</a>
                        </li>
                       <li class="nav-item">
                            <a href="#" class="nav-link">해외도서</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">이벤트</a>
                        </li>
                        <li class="nav-item">
                            <a href="QandA.html" class="nav-link">Q&A/1:1문의</a>
                        </li>
                    </ul>
                </div> 
            </nav>
        </div>
    </header>
    <section>
        <div class="wrap_container">
            <div id="section_content_sec1">
                <h1>??의 강추 도서</h1>
                <div id="section_content_nav">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link">추천도서</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">베스트셀러</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">화제의 신간!</a>
                        </li>
                    </ul>
                </div>
                <div id="" class="col-auto d-flex justify-content-around mx-auto p-4">
                    <figure class="figure">
                        <img src="..." class="figure-img img-fluid rounded text-center" alt="...">
                        <figcaption>A caption for the above image.</figcaption>
                    </figure>
                    <figure class="figure">
                        <img src="..." class="figure-img img-fluid rounded text-center" alt="...">
                        <figcaption>A caption for the above image.</figcaption>
                    </figure>
                    <figure class="figure">
                        <img src="..." class="figure-img img-fluid rounded text-center" alt="...">
                        <figcaption>A caption for the above image.</figcaption>
                    </figure>
                    <figure class="figure">
                        <img src="..." class="figure-img img-fluid rounded text-center" alt="...">
                        <figcaption>A caption for the above image.</figcaption>
                    </figure>
                </div>
                <div id="#" class="">
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                </div>
                <div id="#" class="">
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                </div>
            </div>

            <div id="section_content_sec2" class="">
                <h1>분류별 추천 도서(국내)</h1>
                <div  id="section_content_nav">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link">소설</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">비문학</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">문학</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">수험서</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">코믹/만화</a>
                        </li>
                    </ul>
                </div>
                <div id="#" class="col-auto d-flex justify-content-around mx-auto p-4">
                    <figure>
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791191891287.jpg" width="200" height="200" class="figure-img img-fluid rounded text-center" alt="메리골드 마음세탁소">
                        <figcaption>메리골드 마음세탁소</figcaption>
                    </figure>
                    <figure>
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791161571188.jpg" width="200" height="200" class="figure-img img-fluid rounded text-center" alt="불편한 편의점(벚꽃 에디션)">
                        <figcaption>불편한 편의점(벚꽃 에디션)</figcaption>
                    </figure>
                    <figure>
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788998441012.jpg" width="200" height="200" class="figure-img img-fluid rounded text-center" alt="모순">
                        <figcaption>모순</figcaption>
                    </figure>
                    <figure>
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791167913678.jpg" width="200" height="200" class="figure-img img-fluid rounded text-center" alt="단 하루의 부활">
                        <figcaption>단 하루의 부활</figcaption>
                    </figure>
                </div>
                <div id="#" class="">
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                </div>
                <div id="#" class="">
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                </div>
                <div id="#" class="">
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                </div>
                <div id="#" class="">
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                </div>
            </div>
            <div id="section_content_sec3">
                <h1>분류별 추천 도서(해외)</h1>
                <div  id="section_content_nav">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link">소설</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">비문학</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">문학</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">수험서</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">코믹/만화</a>
                        </li>
                    </ul>
                </div>
                <div class="col-auto d-flex justify-content-around mx-auto p-4">
                    <figure class="figure">
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791168473690.jpg" width="200" height="200" class="figure-img img-fluid rounded text-center" alt="세이노의 가르침">
                        <figcaption>세이노의 가르침</figcaption>
                    </figure>
                    <figure class="figure">
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791192579504.jpg" width="200" height="200" class="figure-img img-fluid rounded text-center" alt="바다가 들리는 편의점">
                        <figcaption>바다가 들리는 편의점</figcaption>
                    </figure>
                    <figure class="figure">
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791169791977.jpg" width="200" height="200" class="figure-img img-fluid rounded text-center" alt="스즈메의 문단속">
                        <figcaption>스즈메의 문단속</figcaption>
                    </figure>
                    <figure class="figure">
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788973814725.jpg" width="200" height="200" class="figure-img img-fluid rounded text-center" alt="멋진 신세계">
                        <figcaption>멋진 신세계</figcaption>
                    </figure>
                </div>
                <div id="#" class="">
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                </div>
                <div id="#" class="">
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                </div>
                <div id="#" class="">
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                </div>
                <div id="#" class="">
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                    <figure>
                        <figcaption></figcaption>
                    </figure>
                </div>
            </div>
        </div>
        <div id="popup_remote">
            <div>
                <button type="button" class="btn btn-outline-primary" onclick="location.href='QandA.html'" style="width :150px; height: 100px;">
                    <i class="fa-regular fa-comment-dots fa-2xl"></i>
                   문의하기
                </button>
            </div>
            <div>
                <button type="button" class="btn btn-outline-success" style="width :150px; height: 100px;">
                    <i class="fa-solid fa-truck fa-2xl"></i>
                    배송현황
                </button>
            </div>
            <div>
                <button type="button" class="btn btn-outline-info" style="width :150px; height: 100px;">
                    <i class="fa-solid fa-cart-shopping fa-2xl"></i>
                    장바구니
                </button>
            </div>
            <div >
                <button type="button" class="btn btn-primary" onclick="window.scrollTo(0,0)" style="width :150px">TOP</button>
                <button type="button" class="btn btn-secondary" onclick="window.scrollTo(0,document.body.scrollHeight)" style="width :150px">BOTTOM</button>
            </div>
        </div>
    </section>
    <footer>
        <div class="container-fluid p-3 text-center">
            <div class="align-items-center">
                <p>NSA Company | 대표 : 이승민 | 사업자등록번호 : 123-12-123456 | 김포시 장기동 2018-2 라베니체마치에비뉴 </p>
                <p>copyright 2023. NSA Company Inc. all rights reserved</p>
            </div>
        </div>
    </footer>
</body>
</html>