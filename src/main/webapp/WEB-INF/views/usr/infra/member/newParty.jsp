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
            <h1 class="mx-auto">파티 생성</h1>
            
            <!-- 파티 생성 데이터 담을 폼 -->
            <div class="formBox mx-auto">
	            <form name="partyTime">
<<<<<<< HEAD
	            	<input type="hidden" value='<c:out value="${sessionSeq}"/>' id="partyLeader" name="partyLeader">
=======
	            	<input type="hidden" value="<c:out value='${sessionSeq }' />" name="partyLeader">
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
	            	<!-- 파티 생성 박스 -->
					<div class="d-flex flex-column p-4">
						<!-- 종목과 파티제목 -->
						<div class="labelBox ">
							<label for="" class="col-sm-2">파티 제목</label>
							<input type="text" name="partyName" class="form-control" placeholder="파티 제목">
						</div>
						
						<!-- 인원수 날짜 연령대 -->
						<div class="labelBox justify-content-around">
							<select name="partySport" id="partySport" class="me-2">
				   				<option value="" selected>-- 종목 --</option>
						   		<c:forEach items="${code}" var="code" >
						   			<option value="<c:out value='${code.cdSeq}'/>"><c:out value="${code.cdName}"/></option>
						   		</c:forEach>
				   			</select>
							
							<select name="playerMax" id="playerMax">
								<option selected >::인원</option>
								<option value="1">1명</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<option value="5">5명</option>
								<option value="6">6명</option>
								<option value="7">7명</option>
								<option value="8">8명</option>
								<option value="9">9명</option>
								<option value="10">10명</option>
							</select>
							<select name="partyAge">
								<option selected>::연령대</option>
								<option value="10">10~19세</option>
								<option value="20">20~29세</option>
								<option value="30">30~39세</option>
								<option value="40">40~49세</option>
								<option value="50">50~59세</option>
								<option value="60">60~69세</option>
								<option value="70">70~79세</option>
								<option value="80">80~89세</option>
							</select>
						</div>
						<!-- 날짜 -->
						<div class="labelBox">
								<label for="playDt" class="col-sm-2 col-form-label">날짜</label>
                           		<input type="text" class="form-control" name="playDt" id="playDt">
						</div>
						
						<!-- 시간 -->
						<div class="labelBox">
							<label class="col-sm-2">시간</label>
							<input type="text" class="form-control" name="playTimeStart" id="playTimeStart">
							<span class="mx-2">&nbsp;~&nbsp;</span>
							<input type="text" class="form-control" name="playTimeEnd" id="playTimeEnd">
							
						</div>
						
						<!-- 성별 -->
							<div class="labelBox" id="partyGen">
								<span>성별</span>
								<div class="form-check form-check-inline">
									<input type="radio" name="gender" value="0">
									<label>남성</label>
								</div>
								<div class="form-check form-check-inline">
									<input type="radio"  name="gender" value="1">
									<label>여성</label>
								</div>
								<div class="form-check form-check-inline">
									<input type="radio" name="partyGen" value="2"/>
									<label>무관</label>
								</div>
							</div>
						
						<!-- 지역 -->
						<div class="labelBox">
							<div class="inputBox" style="width: 60%">
							 	<label for="srcGo">지역</label>
								<div class="input-group">
									<input id="srcGo" name="partyLocation" class="searchInput" type="text" value="">
	                   			 	<span id="shMap" class="shortSpan material-symbols-outlined" onclick="location.href='/findmap'">search</span>
								</div>
							</div>
						</div>
						
						<!-- 장비 지참 필수 여부 -->
						<div class="labelBox ">
							<label>장비</label>
							<div class="form-check form-check-inline">
								  <input type="radio" name="toolNy" value="1"/>
								<label for="toolNy">Y</label>
							</div>
							<div class="form-check form-check-inline">
								<input type="radio" name="toolNy" value="0"/>
								<label for="toolNy">N</label>
							</div>
						</div>
						
						<!-- 파티 소개 -->
						<div class="textArea justify-content-evenly">
							<label for="partyDesc">파티소개</label>
<<<<<<< HEAD
                   			<textarea id="partyDesc" name="partyDesc" row="3" col="30"></textarea>
=======
                   			<textarea name="partyDesc" rows="3" cols="30"></textarea>
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
						</div>
					</div>           
	            </form>
				<%--FORM CONTENT ENDS FROM HERE!!--%>
	            <%--FORM CONTENT STARTS FROM HERE!!--%>
	       		<%--FORM CONTENT ENDS FROM HERE!!--%>
	            </div>
	            <div class="modalFooter mt-4 mx-auto">
	        		<button class="modalOk">생성</button>
	    		</div>
            </div>
        </div>
    </main>
</div>

<script type="text/javascript">
$('#playDt')
.datepicker({
    format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
    startDate: '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
    endDate: '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
    autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
    calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
    clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
    datesDisabled: ['2019-06-24', '2019-06-26'], //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
    daysOfWeekDisabled: [0, 6], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
    daysOfWeekHighlighted: [3], //강조 되어야 하는 요일 설정
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

$('#playTimeStart').timepicker({
<<<<<<< HEAD
	  timeFormat: 'p hh:mm',
=======
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
	    interval: 30,
<<<<<<< HEAD
=======
	  	timeFormat: 'p hh:mm',
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
	    interval: 60,
	    minTime: '0',
	    maxTime: '11:00pm',
	    defaultTime: '11',
	    startTime: '10:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
});

$('#playTimeEnd').timepicker({
<<<<<<< HEAD
	  timeFormat: 'p hh:mm',
=======
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
	    interval: 30,
<<<<<<< HEAD
=======
	  	timeFormat: 'p hh:mm',
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
	    interval: 60,
	    minTime: '0',
	    maxTime: '11:00pm',
	    defaultTime: '11',
	    startTime: '10:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
});

$(".modalOk").on("click", function(){
	/* alert("이거 나오면 잘되는거임?"); */
	
	var partyTime = $('form[name=partyTime]');
	
	partyTime.attr("action", "/ptinsert").submit();
	
});
	
</script>