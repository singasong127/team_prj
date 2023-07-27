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
						<input type="text" value='<c:out value="${member.seq }"/>' readonly /><br>
						<label>memType : </label>
						<input type="text" value='<c:out value="${member.memType }"/>' readonly /><br>
						<label>nickname : </label>
						<input type="text" value='<c:out value="${member.nickname }"/>'/><br>
						<label>email : </label>
						<input type="text" value='<c:out value="${member.email }"/>' readonly /><br>
						<label>gender : </label>
						<input type="text" value='<c:out value="${member.gender }"/>' readonly /><br>
						<label>dob : </label>
						<input type="text" value='<c:out value="${member.dob }"/>' readonly /><br>
						<label>location : </label>
						<input type="text" value='<c:out value="${member.location }"/>'/><br>
						<label>memDesc : </label>
						<input type="text" value='<c:out value="${member.memDesc }"/>'/><br>
						<label>delNy : </label>
						<input type="text" value='<c:out value="${member.delNy }"/>' readonly /><br>
				</div>
				
       			<div class="excuteBox">
	            	<button>수정 및 저장</button>
	            	<button>목록</button>	
	            	<button>삭제</button>
            	</div>
			</form>
				
			<%--FORM CONTENT ENDS FROM HERE!!--%>
			
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
            </div>
        </div>
    </main>
</div>

<script type="text/javascript">
	

</script>