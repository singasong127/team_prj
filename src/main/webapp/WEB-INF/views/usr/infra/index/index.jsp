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
	            <form name="formSh" method="post" class="d-flex" autocomplete="off">
	            <!-- 종목(나중에 분류 재지정하고 재설정) -->
			   		<select name="partySport" id="partySport" class="me-2">
			   			<option value="" selected>-- 종목 --</option>
				   		<c:forEach items="${code}" var="code" >
				   			<option value="<c:out value='${code.cdSeq}'/>"><c:out value="${code.cdName}"></c:out></option>
				   		</c:forEach>
				   	</select>
				   <input type="text" class="form-control me-2" id="partyName" name="partyName" placeholder="-- 파티 제목 --">
				   <!-- 날짜 선택 -->
				   <input type="text" class="form-control me-2" id="playDt" name="playDt" placeholder="-- 날짜 --">
				   
				   <!-- 성별 선택창 -->
				   <select name="partyGen" id="partyGen" class="me-2">
				   	<option value="" selected>-- 성별 --</option>
				   	<option value="0">남성</option>
				   	<option value="1">여성</option>
				   	<option value="2">무관</option>
				   </select>
				   
				   <select name="partyAge" id="partyAge" class="me-2">
			   		<option value="" selected>-- 연령대 --</option>
			   			<option value="0">연령 무관</option>
				   		<option value="10">10대</option>
				   		<option value="20">20대</option>
				   		<option value="30">30대</option>
				   		<option value="40">40대</option>
				   		<option value="50">50대</option>
				   		<option value="60">60대</option>
				   </select>
				   
				   <input type="text" class="form-control me-2" name="partyLocation" id="partyLocation" placeholder="-- 지역 --">
				   					   
				   
				   <button class="detailBtn">
				   	<i class="bi bi-arrow-clockwise"></i>
				   </button>
	            </form>
				</div>
	            <div class="tableBox">
	            	<table>
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
											<tr onclick="location.href='/ptform?seq=<c:out value="${list.seq}"/>'">
												<td>
													<c:out value="${list.seq}"></c:out>
												</td>
												<td>
													<c:out value="${list.partySport}"></c:out>
												</td>
												<td>
													<c:out value="${list.partyName}"></c:out>
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
													<c:out value="${list.partyLocation}"></c:out>
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
	            	<button class="detailBtn" id="btnCre" onclick="location.href='/newChallger'">파티생성</button>
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
		$("form[name=formSh]").attr("action", "/").submit();
	});	
	

	
	$('#playDt')
	.datepicker({
	    format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	    startDate: '0d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
	    endDate: '+14d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
	    autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	    calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
	    clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
	    disableTouchKeyboard: false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
	    immediateUpdates: false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
	    multidate: false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
	    multidateSeparator: ',', //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
	    templates: {
	        leftArrow: '&laquo;',
	        rightArrow: '&raquo;',
	    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
	    showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
	    // title: '테스트', //캘린더 상단/**/에 보여주는 타이틀
	    todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
	    toggleActive: true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
	    weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
	    language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	})
	.on('changeDate', function (e) {
	    /* 이벤트의 종류 */
	    //show : datePicker가 보이는 순간 호출
	    //hide : datePicker가 숨겨지는 순간 호출
	    //clearDate: clear 버튼 누르면 호출
	    //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
	    //changeMonth : 월이 변경되면 호출
	    //changeYear : 년이 변경되는 호출
	    //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간

	    console.log(e);
	    // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
	});
	
</script>