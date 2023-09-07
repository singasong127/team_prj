<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<%@include file="../include/head.jsp"%>
<body>
	<%@include file="../include/header.jsp"%>
	<div class="mainBox">
		<div class="mainContainer">
			<div class="mainLabelBox">
				<h2 class="tableLabel">${item.type } 내용 </h2>
				<span id="back2list" class="material-symbols-outlined">clear_all</span>
			</div>
			<div class="tableBox_form">
				<form class="row g-4"  method="post" enctype="multipart/form-data">
					<div class="row mb-3">
						<div class="col-md-2">
							<label for="reason" class="form-label">회원 유형</label>
							<select class="form-select" aria-label="Default select example" disabled id="reason">
								<option value="13" <c:if test="${item.reason == 13 }">selected</c:if> >욕설/비방</option>
								<option value="14" <c:if test="${item.reason == 14 }">selected</c:if> >비매너 플레이</option>
								<option value="15" <c:if test="${item.reason == 15 }">selected</c:if> >불건전한 행위/언행</option>
								<option value="16" <c:if test="${item.reason == 16 }">selected</c:if> >기타</option>
								<option value="22" <c:if test="${item.reason == 22 }">selected</c:if> >추천</option>
							</select>
						</div>
					</div>
					<div class="col-md-2">
						<label for="" class="form-label">추천/신고자</label>
						<input type="text" class="form-control" id="actor" name="actor" value='<c:out value="${item.actor }"/>' readonly="readonly">
					</div>		
					<div class="col-md-2">
						<label for="" class="form-label">추천받은 사람/신고받은 사람</label>
						<input type="text" class="form-control" id="actee" name="actee" value="<c:out value="${item.actee }"/>" readonly="readonly">
					</div>
					<div class="row mb-3">
						<div class="col-md-5">
							<label for="reportDesc" class="form-label">사유</label>
							<textarea class="form-control" id="reportDesc" name="reportDesc" rows="3"><c:out value="${item.reportDesc }" /></textarea>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>