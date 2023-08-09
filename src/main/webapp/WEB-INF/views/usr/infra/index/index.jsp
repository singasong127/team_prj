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
	            <div>

	            </div>
	            <!-- select 박스 -->
	            <div class="searchBox">
	            <form name="formSh" method="post" class="d-flex">

	            <!-- 종목(나중에 분류 재지정하고 재설정) -->
				   <select name="partySport" id="partySport" class="me-2">
				   	<option value="" selected>-- 종목 --</option>
				   </select>
				   <input type="text" class="form-control me-2" id="partyName" name="partyName" placeholder="-- 파티 제목 --">
				   <!-- 날짜 선택 -->
				   <input type="text" class="form-control me-2" id="playDt" name="playDt" value="" placeholder="-- 날짜 --">
				   
				   <!-- 성별 선택창 -->
				   <select name="partyGen" id="partyGen" class="me-2">
				   	<option value=" " selected>-- 성별 --</option>
				   	<option value="<c:out value="${vo.partyGen }"/>0">남성</option>
				   	<option value="<c:out value="${vo.partyGen }"/>1">여성</option>
				   	<option value="<c:out value="${vo.partyGen }"/>2">무관</option>
				   </select>
				   
				   <select name="partyAge" id="partyAge" class="me-2">
			   		<option value="" selected>-- 연령대 --</option>
			   			<option value="<c:out value="${vo.partyAge }"/>0">연령 무관</option>
				   		<option value="<c:out value="${vo.partyAge }"/>10">10대</option>
				   		<option value="<c:out value="${vo.partyAge }"/>20">20대</option>
				   		<option value="<c:out value="${vo.partyAge }"/>30">30대</option>
				   		<option value="<c:out value="${vo.partyAge }"/>40">40대</option>
				   		<option value="<c:out value="${vo.partyAge }"/>50">50대</option>
				   		<option value="<c:out value="${vo.partyAge }"/>60">60대</option>
				   </select>
				   
				   <input type="text" class="form-control me-2" name="partyLocation" id="partyLocation" placeholder="-- 지역 --">
				   					   
				   
				   <button class="detailBtn">
				   	<i class="bi bi-arrow-clockwise"></i>
				   </button>
	            </form>
				</div>
	            <div class="tableBox">
	            	<table class="">
	            		<thead>
	            			<tr>
		            			<th>No.</th>
	    	        			<th>종목</th>
	    	        			<th>파티 제목</th>
	    	        			<th>인원수</th>
	    	        			<th>날짜</th>
	    	        			<th>시간</th>
	    	        			<th>성별</th>
	    	        			<th>연령대</th>
	    	        			<th>지역</th>
	    	        			<th>장비지참</th>
	            			</tr>
	            		</thead>
	            		<tbody>
           					<c:choose>
								<c:when test="${fn:length(list) eq 0}">
									<tr>
										<td class="text-center" colspan="9">데이터가 없습니다!</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var="list" varStatus="status">
											<tr>
												<td>
													<a href="/ptform?seq=<c:out value="${list.seq}"></c:out>">
														<c:out value="${list.seq}"></c:out>
													</a>
												</td>
												<td>
													
												</td>
												<td>
													<a href="/ptform?seq=<c:out value="${list.partyName}"></c:out>">
														<c:out value="${list.partyName}"></c:out>
													</a>
												</td>
												<td>
													<c:out value="${list.playerNum}"></c:out> / <c:out value="${list.playerMax}"></c:out>
												</td>
												<td>
													<c:out value="${list.playDt}"></c:out>
												</td>
												<td>
													<c:out value="${list.playTimeStart}"></c:out>
												</td>
												<td>
													<c:choose>
														<c:when test="${list.partyGen eq '0'}">남성</c:when>
														<c:when test="${list.partyGen eq '1'}">여성</c:when>
														<c:otherwise>무관</c:otherwise>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${list.partyAge eq '10'}">10대</c:when>
														<c:when test="${list.partyAge eq '20'}">20대</c:when>
														<c:when test="${list.partyAge eq '30'}">30대</c:when>
														<c:when test="${list.partyAge eq '40'}">40대</c:when>
														<c:when test="${list.partyAge eq '50'}">50대</c:when>
														<c:when test="${list.partyAge eq '60'}">60대</c:when>
														<c:otherwise>연령 무관</c:otherwise>
													</c:choose>
												</td>
												<td>
													<a href="/ptform?seq=<c:out value="${list.partyLocation}"></c:out>">
														<c:out value="${list.partyLocation}"></c:out>
													</a>
												</td>
												<td>
													<c:choose>
														<c:when test="${list.toolNy eq '1'}">Y</c:when>
														<c:otherwise>N</c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
	            		</tbody>
	            	</table>
           		</div>
            <%--FORM CONTENT STARTS FROM HERE!!--%>
            	<div class="excuteBox">
	            	<button class="detailBtn" id="btnCre" onclick="location.href='/ptinsert'">파티생성</button>
	            	<button class="detailBtn" onclick="location.href='/PartyTest'">테스트</button>
	            	<button class="detailBtn" id="btnSh"><i class="bi bi-search"></i></button>
            	</div>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
				</div>
			</div>
		</main>
	</div>
</body>
<%@ include file="../../../admin/infra/include/partyBuild.jsp" %>

<script type="text/javascript">
	$("#btnSh").on("click", function() {
		$("form[name=formSh]").attr("action", "/?").submit();
	});	
	



	$("#btnCre").on("click", function() {
		
		window.location.replace("newChallger");
		
	});
	
	$(function() {
		$("#playDt").datepicker({
			dateFormat: 'yy-mm-dd'
			,showOtherMonths: true
			,showMonthAfterYear: true
			,changeYear: true //option값 년 선택 가능
			,changeMonth: true //option값  월 선택 가능                
			,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
			,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
			,buttonText: "선택" //버튼 호버 텍스트              
			,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
			,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
			,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
			,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
			,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
			,yearRange: '2020:2023'
		});
		 $('#playDt').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후
	});
	
</script>