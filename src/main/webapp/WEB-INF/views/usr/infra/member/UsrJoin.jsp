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
            <div class="mainContainerLogin">
				<div class="mainLabelBoxLogin">
					<img src="/resources/img/logo.png">
				</div>
				<%--FORM CONTENT STARTS FROM HERE!!--%>
				<%--FORM CONTENT STARTS FROM HERE!!--%>
                <form class="row g-3">
                    <%--아이디--%>
                    <div class="my-3 row mb-3 d-flex justify-content-center">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">이메일</label>
                        <div class="col-sm-5">
                            <input type="email" class="form-control" id="inputEmail3">
                            <span class="id_ok" >사용가능한 아이디입니다</span>
                            <span class="id_already">중복된 아이디입니다</span>
                        </div>
                    </div>
                    <%--아이디--%>

                    <%--비밀번호--%>
                    <div class="my-3 row mb-3 d-flex justify-content-center">
                        <label for="inputPassword3" class="col-sm-2 col-form-label">비밀번호</label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" id="inputPassword3">
                        </div>
                    </div>
                    <div class="my-3 row mb-3 d-flex justify-content-center">
                        <label for="inputPassword4" class="col-sm-2 col-form-label">비밀번호 재입력</label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" id="inputPassword4">
                        </div>
                    </div>
                    <%--비밀번호--%>

                    <%--Gender--%>
                    <div class="my-3 row mb-3 d-flex justify-content-center">
                        <label for="autoSizingSelect" class="col-md-1 col-form-label">성별</label>
                        <div class="col-md-2">
                            <select class="form-select" id="autoSizingSelect">
                                <option selected>::</option>
                                <option value="0">남</option>
                                <option value="1">여</option>
                            </select>
                        </div>
                        <label for="location" class="col-md-1 col-form-label">거주지</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="location">
                        </div>
                    </div>
                    <%--Gender--%>
                    <%--DOB--%>
                    <div class="my-3 row mb-3 d-flex justify-content-center">
                        <label for="datePicker" class="col-sm-2 col-form-label">생년월일</label>
                        <div class="col-md-2">
                            <input type="text" class="form-control" id="datePicker">
                        </div>
                    </div>
                    <%--DOB--%>
                    <%--LOCATION--%>
                    <%--LOCATION--%>
                    <%--DESCRIPTION--%>
                    <%--DESCRIPTION--%>

                </form>
				<%--FORM CONTENT ENDS FROM HERE!!--%>
				<%--FORM CONTENT ENDS FROM HERE!!--%>
            </div>
        </div>
    </main>
</div>
</body>
<script>
    $('#datePicker')
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
</script>