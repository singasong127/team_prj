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
			<!-- title -->
			<h1>회원 List</h1>
            <%--FORM CONTENT STARTS FROM HERE!!--%>
			<form name = "memberInfo">
				<div class="tableBox">
						<label>seq : </label>
						<input type="text" name="seq" value='<c:out value="${member.seq }"/>' readonly />
						<label>memType : </label>
						<input type="text" name="memType" value='<c:out value="${member.memType }"/>' readonly />
						<label>nickname : </label>
						<input type="text" name="nickname" value='<c:out value="${member.nickname }"/>'/><br>
						<label>email : </label>
						<input type="text" name="email" value='<c:out value="${member.email }"/>' readonly />
						<label>pwd : </label>
						<input type="text" name="pwd" value='<c:out value="${member.pwd }"/>' />
						<label>gender : </label>
						<input type="text" name="gender" value='<c:out value="${member.gender }"/>' readonly />
						<label>dob : </label>
						<input type="text" name="dob" value='<c:out value="${member.dob }"/>' readonly />
						<label>location : </label>
						<input type="text" name="location" value='<c:out value="${member.location }"/>'/>
						<label>memDesc : </label>
						<input type="text" name="memDesc" value='<c:out value="${member.memDesc }"/>'/>
						<label>delNy : </label>
						<input type="text" name="delNy" value='<c:out value="${member.delNy }"/>' readonly />
				</div>
			</form>
				
       			<div class="excuteBox">
	            	<button type="button" id ="upSave">수정 및 저장</button>
	            	<button type="button" id ="back">목록</button>	
	            	<button type="button" id ="noUe">활성화</button>
	            	<button type="button" id ="ue">비활성화</button>
            	</div>
				
			<%--FORM CONTENT ENDS FROM HERE!!--%>
			
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
            </div>
        </div>
    </main>
</div>

<script type="text/javascript">
	var memberForm = $("form[name='memberInfo']");
	
	$("#upSave").on("click", function(){
		memberForm.attr("method", "post");
		memberForm.attr("action", "/memberUpdate").submit();
		
	});
	
	$("#back").on("click", function(){
		window.location.replace("/memberList");
		
	});
	
	$("#ue").on("click", function(){
		memberForm.attr("method", "post");
		memberForm.attr("action", "/memberUelete").submit();
		
	});
	
	$("#noUe").on("click", function(){
		memberForm.attr("method", "post");
		memberForm.attr("action", "/memberNoUelete").submit();
		
	});
	

</script>