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
					<a style="width: 100px; height: 30px;" href="#" id="chat">채팅</a>

	            </div>
	            <!-- select 박스 -->
	            <div class="searchBox">
	            <form name="formSh" method="post">

	            <!-- 종목(나중에 분류 재지정하고 재설정) -->
				   <select>
				   	<option value="" selected>-- 종목 --</option>
				   </select>
				   
				   <!-- 날짜 선택 -->
				   <input type="text" class="form-control" id="date" name="date" value="" placeholder="-- 날짜 --">
				   
				   <!-- 성별 선택창 -->
				   <select name="partyGen" id="partyGen">
				   	<option value=" " selected>-- 성별 --</option>
				   	<option value="0">남성</option>
				   	<option value="1">여성</option>
				   	<option value="2">무관</option>
				   </select>
				   
				   <!-- 지역(예시로 전국 8도로 세팅 나중에 변경) -->
				   <select>
				   	<option value="" selected>-- 지역 --</option>
				   	
				   </select>
				   
				   <select>
				   	<option value="" selected>-- 연령대 --</option>
				   </select>
				   
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
													<c:out value="${list.playerMax}"></c:out>
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

<%@ include file="../../../admin/infra/include/partyBuild.jsp" %>

<script type="text/javascript">
	$("#btnSh").on("click", function() {
		$("form[name=formSh]").attr("action", "/")
	});	
	

	//채팅창 오픈
	//채팅창 오픈
	$("#chat").on('click',function(e){
		e.preventDefault();
		window.open("/chat","chat","width=500, height=800, top=200, left=200");
	// 경로, 파일, 너비, 높이, 위치 지정
	})
	//채팅창 오픈
	//채팅창 오픈

	$("#btnCre").on("click", function() {
		
		window.location.replace("newChallger");
		
	});
	
	$(function() {
		$("#date").datepicker({
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
		 $('#date').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후
	});
	
</script>