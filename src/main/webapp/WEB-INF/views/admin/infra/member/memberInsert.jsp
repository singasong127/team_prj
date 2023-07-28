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
			<div class="tableBox">
				<form name="insertList">
					<label>nickname : </label>
					<input type="text" name="nickname" />
					<label>email : </label>
					<input type="text" name="email"  />
					<label>pwd : </label>
					<input type="password" name="pwd" />
					<span>gender : </span>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="gender" value="1" id="flexRadioDefault1">
					  <label class="form-check-label" for="flexRadioDefault1">
					   	남자
					  </label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="gender" value="2" id="flexRadioDefault2" checked>
					  <label class="form-check-label" for="flexRadioDefault2">
					    여자
					  </label>
					</div>
					<label>dob : </label>
					<input type="text" name="dob" />
					<label>location : </label>
					<input type="text" name="location" />
					<label>memDesc : </label>
					<input type="text" name="memDesc" />
				</form>
			</div>
				
			<%--FORM CONTENT ENDS FROM HERE!!--%>
			
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
       			<div class="excuteBox">
	            	<button tpye="button" id="save">저장</button>
	            	
            	</div>
            </div>
        </div>
    </main>
</div>
<script type="text/javascript">
	var insertForm = $("form[name='insertList']");
	
	$("#save").on("click", function(){
		insertForm.attr("method", "post");
		insertForm.attr("action", "/adminMakeMember").submit();
	});
</script>