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
            <%--FORM CONTENT STARTS FROM HERE!!--%>
				<!-- 마이페이지 -->
            	<!-- 타이틀 -->
            	<div>
            		<h1>마이페이지</h1>
            	</div>
            	<!-- 내용 1 플렉스 들어감 -->
            	<div>
            		<!-- 프로필 사진 구간 -->
            		<div>
            			<!-- 사진 -->
            			<img>
            			<!-- 프로필 변경 버튼 누르면 모달창이 뜹니다. -->
            			<button type="button">프로필 사진 변경</button>
            		</div>
            		<!-- 프로필 내용 구간 -->
            		<div>
            			<p>E-Mail : </p>
            			<p>닉네임 : </p>
            			<p>성별 : </p>
            			<p>출생 년월 : </p>
            		</div>
            		
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
            <%--FORM CONTENT STARTS FROM HERE!!--%>
						<form>
							<button type="button">비밀번호 변경</button>						
							<button type="button">정보변경</button>						
							<button type="button">회원탈퇴</button>						
						</form>
            	</div>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
			</div>
        </div>
    </main>
</div>