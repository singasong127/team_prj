<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="kr">
<%@include file="../include/head.jsp"%>
<body>
<div>
    <%@include file="../include/header.jsp"%>
    <main>
        <div class="mainBox">
            <div class="mainContainer">
            <!-- 회원가입 -->
            <%--FORM CONTENT STARTS FROM HERE!!--%>
				<div class="">
					<!-- title (가운데 정렬) -->
					<div>
						<h1 class="">회원가입</h1>
					</div>
					<!-- title 끝 -->
            <%--FORM CONTENT STARTS FROM HERE!!--%>
					<!-- 회원가입 폼 -->
					<form>
						<!-- email -->
						<div class="form-floating">
							<input type="text" id="email" name="email" placeholder="이메일을 입력하세요"/>
							<label for="email">email : </label>
						</div>
						<!-- email 끝 -->
						
						<!-- 닉네임 -->
						<div>
							<div class="form-floating">
								<input type="text" id="nickname" placeholder="닉네임을 입력하세요">
								<label for="nickname">닉네임 : </label>
							</div>
								<button type="button">중복검사</button>
						</div>
						<!-- 닉네임 끝 -->
						
						<!-- 비밀번호 & 비밀번호 확인 -->
						<div class="form-floating">
							<input type="password" id="pwd" name="pwd" placeholder="비밀번호">
							<label for="pwd">비밀번호 : </label>
						</div>
						<div class="form-floating">
							<input type="password" id="" placeholder="비밀번호를 다시 입력하세요">
							<label for="" >비밀번호 확인 : </label>
						</div>
						<!-- 비밀번호 & 비밀번호 확인 끝 -->
						
						<!-- 성별 (성별 공통코드 적용해서 int 값으로 지정) -->
						<div>
							<input type="radio" name="gender" id="1" value="1"/>
							<label>남성</label>
							<input type="radio" name="gender" id="2" value="2"/>
							<label>여성</label>
						</div>
						<!-- 성별 끝 -->
						
						<!-- 출생년월 -->
						<div>
							<span>출생 년월 : </span>
							<select>
								<option value="" selected>년도</option>
							</select>
							<select>
								<option value="" selected>월</option>
							</select>
						</div>
						<!-- 출생년월 끝 -->
						
						<!-- 선호하는 운동 -->
						<div>
							<!-- title -->
							<div>
								<h3>선호하는 운동</h3>
							</div>
							<div>
								<button type="button"></button>
								<button type="button"></button>
								<button type="button"></button>
								<button type="button"></button>
							</div>
							<div>
								<button type="button"></button>
								<button type="button"></button>
								<button type="button"></button>
								<button type="button"></button>
							</div>
							<div>
								<button type="button"></button>
								<button type="button"></button>
								<button type="button"></button>
								<button type="button"></button>
							</div>
							<div>
								<button type="button"></button>
								<button type="button"></button>
								<button type="button"></button>
								<button type="button"></button>
							</div>
						</div>
						
						<!-- 회원가입 버튼 -->
						<button type="button">회원가입</button>
					</form>
			     	<!-- 회원가입 폼 끝 -->
			<%--FORM CONTENT ENDS FROM HERE!!--%>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
				</div>
            </div>
        </div>
    </main>
</div>

<script type="text/javascript">
	

</script>