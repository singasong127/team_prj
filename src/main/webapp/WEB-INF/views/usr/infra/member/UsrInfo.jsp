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
            	<!-- 유저 정보 컨테이너 -->
            	<div class="">
            		<!-- 타이틀 -->
            		<div>유저 정보</div>
            		<!-- 본문 -->
            		<div class="d-flex">
            			<!-- 프로필 사진 -->
            			<div>
            				<img src="" alt="프로필 사진">
            			</div>
            			<!-- 프로필 사진 끝 -->
            			
            			<!-- 프로필 내용 (내용은 DB로 끌어오는거라 제목만 적었습니다.) -->
            			<div>
            				<span>
	            				닉네임 : 
            				</span>
            				<span>
	            				e-mail : 
            				</span>
            				<span>
	            				연령대 :
            				</span>
            				<span>
	            				성별 : 
            				</span>
            				<span>
	            				활동지 : 
            				</span>
            				<span>
	            				선호하는 운동 : 
            				</span>
            			</div>
            			<!-- 프로필 내용 끝 -->
            			
            			<!-- 매너온도  -->
            			<div>
            				<!-- 매너온도 제목 -->
            				<div>매너온도</div>
            				<!-- 매너온도 본문(예시로 짠거라서 나중에 DB 연결하면 수정 할 계획) -->
            				<div>
            					<!-- bootstrap progress bar -->
            					<div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
								  <div class="progress-bar" style="width: 36.5%"></div>
								</div>
								<div>
									<p>(DB연결되면 가져오는걸로 수정함)님의 매너 온도는</p>
									<p>(DB연결되면 가져오는걸로 수정함)℃ 입니다.</p>
								</div>
            				</div>
            			</div>
         				<!-- 매너온도 끝 -->
         				<!-- 자기 소개문 -->
         				<div>
         					
         				</div>
         				<!-- 자기 소개문 끝 -->
            		</div>
            	</div>
            <%--FORM CONTENT STARTS FROM HERE!!--%>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
            </div>
        </div>
    </main>
</div>