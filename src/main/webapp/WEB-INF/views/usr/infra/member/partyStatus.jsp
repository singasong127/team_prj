<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="kr">
<%@include file="../include/head.jsp"%>
<body>
	<div>
		<%@include file="../include/header.jsp"%>
		<main>
			<div class="mainBox">
				<div style="flex-direction: row; align-items:center;" class="mainContainer">
					<%--FORM CONTENT STARTS FROM HERE!!--%>
					<div class="row container-fluid flex-nowrap justify-content-around">
						<%--FORM CONTENT ENDS FROM HERE!!--%>
						<div class="col-4">
							<ul>
								<li>파티명 : <c:out value="${team.partyName }" /></li>
								<li>파티장 : <c:out value="${team.partyLeader }" /></li>
								<li>날짜 : <c:out value="${team.playDt }" /></li>
								<li>시작시간 : <c:out value="${team.playTimeStart }" /></li>
								<li>종료시간 : <c:out value="${team.playTimeEnd }" /></li>
								<li>파티인원 : <c:out value="${team.playerNum } / ${team.playerMax }" /></li>
								<li>성별 :
									<c:set var="jax" value=""  /> 
									<c:out value="${team.partyGen }" />
								</li>
								<li>장비 지참 여부 : <c:out value="${team.toolNy }" /></li>
								<li>설명 : <c:out value="${team.partyDesc }" /></li>
							</ul>
					<%--FORM CONTENT ENDS FROM HERE!!--%>

					<%--FORM CONTENT STARTS FROM HERE!!--%>

					<%-- <article class="contents">
						<!-- 파티 스테이터스 -->
						<div class="chat">
							<div class="pb-2 bg-white">
								<div class="party_name d-flex justify-content-between">
									<h5 class="text-white my-1">참여자 명단</h5>
									<span class="text-white ">@ / 10 명</span>
									<!-- DB 연결하면 c:out으로 넣는걸로. -->
								</div>
								<div class="chat_field overflow-y-auto">
									<div class="col-auto">

										<div class="d-flex justify-content-evenly my-3">
											<!-- 프로필 사진 -->
											<div class="col-3">
												<div class="">
													<img src="resources/images/myFortFolio/person_2.jpg"
														alt="Image" class="img-fluid"
														style="width: 100px; height: 100px;">
												</div>
											</div>
											<!-- 프로필 -->
											<div class="col-6">
												<p>닉네임 :</p>
												<p>이메일 :</p>
												<p>&nbsp;&nbsp; 성별 :</p>
											</div>
										</div>
										<div class="d-flex justify-content-evenly mb-3">
											<!-- 프로필 사진 -->
											<div class="col-3">
												<div class="">
													<img src="resources/images/myFortFolio/person_2.jpg"
														alt="Image" class="img-fluid"
														style="width: 100px; height: 100px;">
												</div>
											</div>
											<!-- 프로필 -->
											<div class="col-6">
												<p>닉네임 :</p>
												<p>이메일 :</p>
												<p>&nbsp;&nbsp; 성별 :</p>
											</div>
										</div>
										<div class="d-flex justify-content-evenly mb-3 ">
											<!-- 프로필 사진 -->
											<div class="col-3">
												<div class="">
													<img src="resources/images/myFortFolio/person_2.jpg"
														alt="Image" class="img-fluid"
														style="width: 100px; height: 100px;">
												</div>
											</div>
											<!-- 프로필 -->
											<div class="col-6">
												<p>닉네임 :</p>
												<p>이메일 :</p>
												<p>&nbsp;&nbsp; 성별 :</p>
											</div>
										</div>
										<div class="d-flex justify-content-evenly mb-3 ">
											<!-- 프로필 사진 -->
											<div class="col-3">
												<div class="">
													<img src="resources/images/myFortFolio/person_2.jpg"
														alt="Image" class="img-fluid"
														style="width: 100px; height: 100px;">
												</div>
											</div>
											<!-- 프로필 -->
											<div class="col-6">
												<p>닉네임 :</p>
												<p>이메일 :</p>
												<p>&nbsp;&nbsp; 성별 :</p>
											</div>
										</div>
										<div class="d-flex justify-content-evenly mb-3 ">
											<!-- 프로필 사진 -->
											<div class="col-3">
												<div class="">
													<img src="resources/images/myFortFolio/person_2.jpg"
														alt="Image" class="img-fluid"
														style="width: 100px; height: 100px;">
												</div>
											</div>
											<!-- 프로필 -->
											<div class="col-6">
												<p>닉네임 :</p>
												<p>이메일 :</p>
												<p>&nbsp;&nbsp; 성별 :</p>
											</div>
										</div>
										<div class="d-flex justify-content-evenly mb-3 ">
											<!-- 프로필 사진 -->
											<div class="col-3">
												<div class="">
													<img src="resources/images/myFortFolio/person_2.jpg"
														alt="Image" class="img-fluid"
														style="width: 100px; height: 100px;">
												</div>
											</div>
											<!-- 프로필 -->
											<div class="col-6">
												<p>닉네임 :</p>
												<p>이메일 :</p>
												<p>&nbsp;&nbsp; 성별 :</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						FORM CONTENT STARTS FROM HERE!!
						<div class="col-6">
							<div class="pb-2 bg-white">
								<div class="d-flex justify-content-between">
									<h5 class="text-white my-1">참여자 명단</h5>
									<span class="text-white ">@ / 10 명</span>
									<!-- DB 연결하면 c:out으로 넣는걸로. -->
								</div>
								<div class="overflow-y-auto">
									<div class="col-auto">
										<div class="d-flex justify-content-evenly my-3">
											<!-- 프로필 사진 -->
											<div class="col-3">
												<div class="">
													<img src="resources/images/myFortFolio/person_2.jpg"
														alt="Image" class="img-fluid"
														style="width: 100px; height: 100px;">
												</div>
											</div>
											<!-- 프로필 -->
											<div class="col-6">
												<p>닉네임 :</p>
												<p>이메일 :</p>
												<p>&nbsp;&nbsp; 성별 :</p>
											</div>
										</div>
										<div class="d-flex justify-content-evenly mb-3">
											<!-- 프로필 사진 -->
											<div class="col-3">
												<div class="">
													<img src="resources/images/myFortFolio/person_2.jpg"
														alt="Image" class="img-fluid"
														style="width: 100px; height: 100px;">
												</div>
											</div>
											<!-- 프로필 -->
											<div class="col-6">
												<p>닉네임 :</p>
												<p>이메일 :</p>
												<p>&nbsp;&nbsp; 성별 :</p>
											</div>
										</div>
										<div class="d-flex justify-content-evenly mb-3 ">
											<!-- 프로필 사진 -->
											<div class="col-3">
												<div class="">
													<img src="resources/images/myFortFolio/person_2.jpg"
														alt="Image" class="img-fluid"
														style="width: 100px; height: 100px;">
												</div>
											</div>
											<!-- 프로필 -->
											<div class="col-6">
												<p>닉네임 :</p>
												<p>이메일 :</p>
												<p>&nbsp;&nbsp; 성별 :</p>
											</div>
										</div>
										<div class="d-flex justify-content-evenly mb-3 ">
											<!-- 프로필 사진 -->
											<div class="col-3">
												<div class="">
													<img src="resources/images/myFortFolio/person_2.jpg"
														alt="Image" class="img-fluid"
														style="width: 100px; height: 100px;">
												</div>
											</div>
											<!-- 프로필 -->
											<div class="col-6">
												<p>닉네임 :</p>
												<p>이메일 :</p>
												<p>&nbsp;&nbsp; 성별 :</p>
											</div>
										</div>
										<div class="d-flex justify-content-evenly mb-3 ">
											<!-- 프로필 사진 -->
											<div class="col-3">
												<div class="">
													<img src="resources/images/myFortFolio/person_2.jpg"
														alt="Image" class="img-fluid"
														style="width: 100px; height: 100px;">
												</div>
											</div>
											<!-- 프로필 -->
											<div class="col-6">
												<p>닉네임 :</p>
												<p>이메일 :</p>
												<p>&nbsp;&nbsp; 성별 :</p>
											</div>
										</div>
										<div class="d-flex justify-content-evenly mb-3 ">
											<!-- 프로필 사진 -->
											<div class="col-3">
												<div class="">
													<img src="resources/images/myFortFolio/person_2.jpg"
														alt="Image" class="img-fluid"
														style="width: 100px; height: 100px;">
												</div>
											</div>
											<!-- 프로필 -->
											<div class="col-6">
												<p>닉네임 :</p>
												<p>이메일 :</p>
												<p>&nbsp;&nbsp; 성별 :</p>
											</div>
										</div>
									</div>
								</div>
							</div>
					</article> --%>
						</div>
					</div>
				</div>
			</div>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
		</main>
	</div>