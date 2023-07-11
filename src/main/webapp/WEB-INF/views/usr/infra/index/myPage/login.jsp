<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>

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
                            <a href="#" class="nav-link">마이페이지</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">장바구니</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">고객센터</a>
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
                            <a class="nav-link">공지사항</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">베스트셀러</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">화제의신간</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">국내도서</a>
                        </li>
                       <li class="nav-item">
                            <a class="nav-link">해외도서</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">이벤트</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">Q&A/1:1문의</a>
                        </li>
                    </ul>
                </div> 
            </nav>
        </div>
    </header>
    <section>
        <div class="wrap_container">
            <div class="d-flex flex-row justify-content-center mt-5">
                <i class="fa-sharp fa-solid fa-book align-self-center" style="font-size: 135px; color: rgb(206, 179, 26);"></i>
                <h1 class="align-self-center">&nbsp;&nbsp;&nbsp;&nbsp;로그인</h1>
            </div>
            <div class="d-flex justify-content-center mt-5">
                <form>
                    <div class="col-auto mb-3" style="width: 500px;">
                        <label for="exampleInputEmail1" class="form-label fs-3">ID</label>
                        <input type="id" class="form-control p-3" id="exampleInputEmail1" aria-describedby="emailHelp">
                    </div>
                    <div class="col-auto mb-3" style="width: 500px;">
                        <label for="exampleInputPassword1" class="form-label fs-3">PW</label>
                        <input type="password" class="form-control p-3" id="exampleInputPassword1">
                    </div>
                    <div class="col-auto mb-3 d-flex justify-content-center">
                        <div class="mb-3 form-check-inline">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">아이디 저장</label>
                        </div>
                        <div class="mb-3 form-check-inline">
                            <input type="checkbox" class="form-check-input" id="exampleCheck2">
                            <label class="form-check-label" for="exampleCheck2">자동 로그인</label>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center">
                        <button type="button" class="btn btn-primary">로그인</button>
                    </div>
                    <!-- 오븐 확인하고 빠진거나 부족한거 수정 예정 -->
                </form>
            </div>
        </div>
    </section>
    <!-- 풋 인클루드 확정 -->
    <footer>
        <div class="container-fluid p-3 text-center">
            <div class="align-items-center">
                <p>NSA Company | 대표 : 이승민 | 사업자등록번호 : 123-12-123456 | 김포시 장기동 2018-2 라베니체마치에비뉴 </p>
                <p>copyright 2023. NSA Company Inc. all rights reserved</p>
            </div>
        </div>
    </footer>
    <!-- 푸터 끝 -->
</body>
</html>