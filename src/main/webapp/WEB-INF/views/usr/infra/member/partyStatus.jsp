<%--<ul>--%>
<%--	<li>파티명 : <c:out value="${team.partyName }" /></li>--%>
<%--	<li>파티장 : <c:out value="${team.partyLeader }" /></li>--%>
<%--	<li>날짜 : <c:out value="${team.playDt }" /></li>--%>
<%--	<li>시작시간 : <c:out value="${team.playTimeStart }" /></li>--%>
<%--	<li>종료시간 : <c:out value="${team.playTimeEnd }" /></li>--%>
<%--	<li>파티인원 : <c:out value="${team.playerNum } / ${team.playerMax }" /></li>--%>
<%--	<li>성별 :--%>
<%--		<c:set var="jax" value=""  />--%>
<%--		<c:out value="${team.partyGen }" />--%>
<%--	</li>--%>
<%--	<li>장비 지참 여부 : <c:out value="${team.toolNy }" /></li>--%>
<%--	<li>설명 : <c:out value="${team.partyDesc }" /></li>--%>
<%--</ul>--%>


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="kr">

<style>
	#reportPage {
		width: 70%;
		height: 70%;
		position: fixed;
		top: 15%;
		left: 15%;
		z-index: 999;
		overflow-y: hidden;
	}
	
	#reportPageWrap {
		width: 100%;
		position: relactive;
		background-color: white;
	}
	
	
	}
</style>

<%@include file="../include/head.jsp"%>
<body>
	<div>
		<%@include file="../include/header.jsp"%>
		<main>
			<div class="mainBox">
				<div class="mainContainer2">
					<div class="chatHalf partyStatus_half">
						<%@include file="../../../chat.jsp"%>

					</div>
					<div class="partHalf partyStatus_half">
						<!-- 파티장 -->
						<div class="userInfo">
							<div class="userInfo_img">
								<img src="${sessionProfilePath}${sessionProfileName}">
							</div>
							<div class="userInfo_info">
								<h6>${sessionId}</h6>
							</div>
							<div class="userInfo_info">
								<input type="hidden" value="${sessionId}">
								<button class="btn btn-primary" id="">추천</button>
								<button class="btn btn-danger" id="report">신고</button>
							</div>
						</div>
						<!-- 파티원 -->
						<!-- <div class="userInfo">
							<div class="userInfo_img">
								<img alt="#" src="#">
							</div>
							<div class="userInfo_info">
								<h6></h6>
							</div>
						</div> -->
					</div>
					
					<%--FORM CONTENT STARTS FROM HERE!!--%>
					<%--FORM CONTENT ENDS FROM HERE!!--%>

					<%--FORM CONTENT ENDS FROM HERE!!--%>
					<%--FORM CONTENT STARTS FROM HERE!!--%>


				</div>
			</div>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
		</main>
		<!-- 추천 -->
		<div id="" class="modal" style="display: none;">
		
		</div>
		<!-- 신고 -->
		<div id="reportPage" class="modal" style="display: none;">
			<form name="reportFormer">
			 	<div class="modal-header" style="background-color: limegreen">
	        		<h2 style="color: #fff; font-weight: bold;">신고</h2>
	        		<input type="hidden" name="type" value="1">
	        		<a class="modalClose"><span class="material-symbols-outlined">close</span></a>
	    		</div>
				<div id="reportPageWrap" class="modal-body">
					<div class="col-6 mt-3 mb-3">
						<!-- 신고자 -->
						<input type="hidden" name="actor" value="${sessionSeq }">
						<!-- 피신고자 -->
						<label for="actee" class="col-2">신고 대상</label>
						<input type="text" id="actee" class="col-4" value="${sessionNickName }" readonly="readonly"/>
						<input type="hidden" name="actee" value="${sessionSeq }">
					</div>
					<div class="col-8 mt-3 mb-3">
						<label for="reason" class="col-2">신고내용</label>
						<select id="reason" name="reason" class="col-6">
							<option value="">:: 신고내용 ::</option>
							<option value="13" >욕설/비방</option>
							<option value="14" >비매너 플레이</option>
							<option value="15" >불건전한 행위/언행</option>
							<option value="16" >기타</option>
						</select>						
					</div>
					<div class="col-auto mt-3 mb-3">
						<label for="reportDesc" class="col-2">신고 사유</label>
						<textarea id="reportDesc" name="reportDesc" rows="10" cols="10"></textarea>
					</div>
					<div class="modalFooter mt-4 mx-auto">
						<button id="youRepot" class="btn btn-danger">신고하기</button>
					</div>
				</div>
			</form>
		</div>
		
	</div>
	<script type="text/javascript">
	
		var report = $('form[name=reportFormer]')
		
		/* 신고 모달창 */
		$("#report").on("click", function(){
			$("#reportPage").show();			
		});
		
		/* 모달창 닫기 */
		$(".modalClose").on("click", function(){
			$(".modal").hide();
		});
		
		/* 신고하기 */
		$("#youRepot").on("click", function(){
			alert("신고가 접수 되었습니다.")
			report.attr("action", "/reportYou").submit();
		});
	
	</script>
</body>
</html>