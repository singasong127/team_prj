<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../resources/css/project_nsa/user/UserPage.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/e402926c7b.js" crossorigin="anonymous"></script>
    <title>회원가입</title>
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
        <!-- 섹션 웹 컨테이너 -->
        <div id="wrap" class="wrap_container">
            <!-- 타이틀 박스 -->
            <div class="d-flex justify-content-evenly mt-4" style="font-size: 60px;">
                <i class="fa-solid fa-book-open-reader align-self-center"></i>
                <h1>회원가입</h1>
            </div>
            <form name="formList" class="col-auto g-3">

                <!-- 아이디 -->
                <div class="mt-3">
                    <label for = "userID" class = "form-label">아이디</label>
                    <div class="input-group">
                        <input type = "text" name="userID" class = "form-control" placeholder = "아이디를 입력하세요">
                    </div>
                </div>

                <!-- 비밀번호  -->
                <div class="mt-3">
                    <label for = "userPW" class = "form-label">비밀번호</label>
                    <div class="input-group">
                        <input type = "password" name="userPw" class = "form-control" >
                    </div>
                </div>
                
                <div class = "mt-3">
                    <label for = "userID" class = "form-label">비밀번호 확인</label>
                    <div class="input-group">
                        <input type = "password" name="userPw" class = "form-control" >
                    </div>
                </div>
                    
                <!-- 이름 -->
                <div class="mt-3">
                    <label for = "userID" class = "form-label">이름</label>
                    <div class="input-group mt-3">
                        <input type = "text" name="userAge" class = "form-control" placeholder = "이름을 입력하세요">
                    </div>
                </div>

                <!-- 성별 -->
                <div class = "col-auto mt-3 mb-5">
                    <div class = "form-check form-check-inline">
                        <label for = "man" class = "form-check-label">남자</label>
                        <input type = "radio" name="gender" value="1" class = "form-check-input">    
                    </div>
                    <div class="form-check form-check-inline">
                        <label for = "woman" class = "form-check-label">여자</label>
                        <input type="radio" name="gender" value="2" class="form-check-input">
                    </div>
                </div>

                <!-- 이메일 -->
                <div class="d-flex mt-5">
                    <label for="userEmail">이메일 주소</label>
                    <div class="input-group">
                        <input name="email" type="text" class="form-control">
                        <input type="button" class="btn btn-outline-primary" value = "이메일 인증">
                    </div>
                </div>
                
                <!-- 주소 -->
                <div class="d-flex flex-column  mt-5">
                    <label for="" class="form-check-label">주소</label>
                    <div class="input-group">
                        <button class="btn btn-outline-primary"><i class="bi bi-search"></i></button>
                        <input class="form-control" type="text">
                    </div>
                    <div>
                        <input class="form-control" type="text" placeholder="주소(우편주소 입력시 자동 입력)" value="" readonly>
                    </div>
                    <div>
                        <input class="form-control" type="text" placeholder="상세주소를 입력하세요." >
                    </div>
                </div>
                
                <!-- 약관 동의  -->
                <div class="">
                    <input type="checkbox" name="" class="form-check-inline">
                    <label for="" class="form-check-label">모든 약관에 동의합니다.</label>
                </div>

                <div>
                    <button id="create" class="btn btn-primary">회원가입하기</button>
                </div>

            </form>
        </div>
    </section>
</body>

	<script type="text/javascript">
		var form = $("form[name='formList']");
		
		$("#create").on("click", function(){
			form.attr("method", "post");
			form.attr("action", "/newChallger").submit();
			
		});
		
	
	
	</script>
</html>