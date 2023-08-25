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
                <form name="insert" class="row g-3" method="post">
                    <%--아이디--%>
                    <div class="my-3 row mb-3 d-flex justify-content-center">
                        <label for="emailunique" class="col-sm-2 col-form-label">이메일</label>
                        <div class="col-sm-5">
                            <input oninput="checkId()" name="email" type="text" class="form-control" id="emailunique">
                            <span class="id_ok">사용가능한 아이디입니다</span>
                            <span class="id_already">중복된 아이디입니다</span>
                        </div>
                    </div>
                    <%--아이디--%>
                    
                    <%--닉네임--%>
                    <div class="my-3 row mb-3 d-flex justify-content-center">
                        <label for="nickunique" class="col-sm-2 col-form-label">닉네임</label>
                        <div class="col-sm-5">
                            <input name="nickname" type="text" class="form-control" id="nickunique">
                            <span class="id_ok" >사용가능한 닉네임입니다.</span>
                            <span class="id_already">중복된 닉네임입니다.</span>
                        </div>
                    </div>
                    <%--닉네임--%>

                    <%--비밀번호--%>
                    <div class="my-3 row mb-3 d-flex justify-content-center">
                        <label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
                        <div class="col-sm-5">
                            <input type="password" name="pwd" class="form-control" id="inputPassword">
                        </div>
                    </div>
                    <div class="my-3 row mb-3 d-flex justify-content-center">
                        <label for="inputPassword2" class="col-sm-2 col-form-label">비밀번호 재입력</label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" id="inputPassword2">
                        </div>
                    </div>
                    <%--비밀번호--%>

                    <%--POSTAL CODE--%>
                    <div class="my-3 row mb-3 d-flex justify-content-center">
                        <label for="sample6_postcode" class="col-sm-2 col-form-label">주소</label>
                        <div class="col-sm-5">
                                <input class="form-control" type="text" name="zipcode" id="sample6_postcode" placeholder="우편번호">
                                <input class="form-control" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                            <input class="form-control" type="text" id="sample6_address" placeholder="주소"><br>
                            <input class="form-control" type="text" id="sample6_detailAddress" placeholder="상세주소">
                            <input type="hidden" name="address" value="">
                        </div>
                    </div>
                    <%--POSTAL CODE--%>
                    <%--Gender--%>
                    <div class="my-3 row mb-3 d-flex justify-content-center">
                        <label for="autoSizingSelect" class="col-md-1 col-form-label">성별</label>
                        <div class="col-md-2">
                            <select class="form-select" name="gender" id="autoSizingSelect">
                                <option selected>::</option>
                                <option value="0">남</option>
                                <option value="1">여</option>
                            </select>
                        </div>
                        <%--Gender--%>

                    </div>

                    <%--DOB--%>
                    <div class="my-3 row mb-3 d-flex justify-content-center">
                        <label for="datePicker" class="me-3 col-sm-1 col-form-label">생년월일</label>
                        <div class="col-md-4">
                            <input type="text" name="dob" class="form-control" id="datePicker">
                        </div>
                    </div>
                    <%--DOB--%>

                    <%--DESCRIPTION--%>
                        <div class="my-3 row mb-3 d-flex justify-content-center">
                            <label for="memDesc" class="col-sm-2 col-form-label">간단한 자기소개</label>
                            <div class="col-md-5">
                                <textarea class="form-control" name="memDesc" id="memDesc" rows="3"></textarea>
                            </div>
                        </div>
                    <%--DESCRIPTION--%>
                        <div class="my-3 row mb-3 d-flex justify-content-center">
                            <div class="col-md-5 d-flex justify-content-center">
                                <button id="joinBtn" class="insertBtn btn btn-success btn-lg" >생성</button>
                            </div>
                        </div>

                </form>
				<%--FORM CONTENT ENDS FROM HERE!!--%>
				<%--FORM CONTENT ENDS FROM HERE!!--%>
            </div>
        </div>
    </main>
</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="/resources/js/datePicker.js"></script>
<script>
	
    var join = $("form[name='insert']");
    
    $("#joinBtn").on("click", function(e) {
		

        if($("#inputPassword").val() != $("#inputPassword2").val()) {
            e.preventDefault();
            $("#inputPassword2").css({
                color: "red",
            });
            $("#inputPassword2").css({
                color: "red",
                animation: "horizontal-shaking .2s 2 ease"
            });
            $("#inputPassword2").focus();

            // PASSWORD AND RE-PASSWORD VALIDATION
            // PASSWORD AND RE-PASSWORD VALIDATION
        }else{
			$("input[name=address]").val($("#sample6_address").val() + " " + $('#sample6_detailAddress').val());
        	join.attr("action", "/memberJoin").submit();
        } //else tag
        // PASSWORD AND RE-PASSWORD VALIDATION
        // PASSWORD AND RE-PASSWORD VALIDATION
       	

    }); //click button tag
</script>
