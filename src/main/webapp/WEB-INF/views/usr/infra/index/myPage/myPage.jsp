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
            	<!-- include head 확정 -->
    <header id="head_backg">
        <div id="wrap" class="wrap_container">
            <div class="">
                <div id="head_nav_bar">
                    <ul class="nav justify-content-end">
                        <li class="nav-item">
                            <a href="#" class="nav-link">회원가입</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">로그인</a>
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
    <!-- 헤드 끝 -->
    <section>
        <div class="wrap_container">
            <div class="d-flex flex-row justify-content-center mt-5">
                <i class="fa-sharp fa-solid fa-book align-self-center" style="font-size: 135px; color: rgb(206, 179, 26);"></i>
                <h1 class="align-self-center">&nbsp;&nbsp;&nbsp;&nbsp;마이페이지</h1>
            </div>
            <div class="d-flex justify-content-center mt-5">
                <form>
                    <!-- 인적사항 내용 창 -->
                    <div class="d-flex flex-column">
                        <div class="col-auto mb-3" style="width: 500px;">
                            <span>이름 : </span>
                            <span>@@@</span>
                        </div>
                        <div class="col-auto mb-3" style="width: 500px;">
                            <span>성별 : </span>
                            <span>비공개</span>
                        </div>
                        <div class="col-auto mb-3" style="width: 500px;">
                            <span>이메일 : </span>
                            <span>Loremipsum@dolorsit.com</span>
                        </div>
                        <div class="col-auto mb-3" style="width: 500px;">
                            <span>우편번호 : </span>
                            <span>11010</span>
                        </div>
                        <div class="col-auto mb-3" style="width: 500px;">
                            <span>주소 : </span>
                            <span>@@시 !@#구 ##동 @!#$%%</span>
                        </div>
                    </div>
                        
                    <!-- 변경 툴 -->
                    <div class="d-grid gap-2 col-10 mx-auto">
                        <button class="btn btn-primary" type="button">인적사항 변경하기</button>
                        <button class="btn btn-primary" type="button">비밀번호 변경</button>
                        <button class="btn btn-primary" type="button">회원 탈퇴</button>
                      </div>
                    <!-- 오븐 확인하고 빠진거나 부족한거 수정 예정 -->
                </form>
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