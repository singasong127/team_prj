<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="en">
<%@include file="../include/head.jsp"%>
<body>
<div>
	<%@include file="../include/header.jsp"%>
	<main>
		<div class="mainBox">
			<div class="mainContainer">
				<%--FORM CONTENT STARTS FROM HERE!!--%>
				<%--FORM CONTENT STARTS FROM HERE!!--%>

				<%--WHEN SEQ IS NULL--%>
				<%--WHEN SEQ IS NULL--%>
				<%--WHEN SEQ IS NULL--%>
				<%--WHEN SEQ IS NULL--%>
				<c:choose>
					<c:when test="${empty member.seq }">
						<div class="mainLabelBox">
							<h2 class="tableLabel">멤버 추가(관리자)</h2>
							<div class="addBox" onclick="location.href='/memberList'">
								<h3 class="tableSubLabel">멤버 목록</h3>
								<span id="back2list" class="material-symbols-outlined">clear_all</span>
							</div>
						</div>
						<div class="tableBox_form">

							<form class="row g-4" name="insertForm" enctype="multipart/form-data">

								<div class="row mb-3">
									<div class="col-md-2">
										<label for="memType" class="form-label">회원 유형</label>
										<select class="form-select" aria-label="Default select example" disabled id="memType">
											<option value="">::</option>
											<option value="0">사용자</option>
											<option value="1" selected>관리자</option>
										</select>
									</div>
									<div class="col-md-1">
										<label for="gender" class="form-label">성별</label>
										<select class="form-select" aria-label="Default select example" name="gender" id="gender">
											<option value="">::</option>
											<option value="0">남</option>
											<option value="1">여</option>
										</select>
									</div>
									<div class="col-md-2">
										<label for="nickname" class="form-label">닉네임</label>
										<input type="text" class="form-control" id="nickname" name="nickname">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-md-4">
										<label for="email" class="form-label">이메일</label>
										<input type="text" class="form-control" id="email" name="email">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-md-3">
										<label for="pwd" class="form-label">비밀번호</label>
										<input type="text" class="form-control" id="pwd" name="pwd">
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-md-2">
										<label for="dob" class="form-label">생년월일</label>
										<input type="text" class="form-control" id="dob" name="dob" placeholder="yyyy-mm-dd">
									</div>
									<div class="col-md-2">
										<label for="location" class="form-label">거주지</label>
										<input type="text" class="form-control" id="location" name="location">
									</div>
								</div>

								<div class="row mb-3">
									<div class="col-md-5">
										<label for="memDesc" class="form-label">간단한 자기소개</label>
										<textarea class="form-control" id="memDesc" name="memDesc" rows="3"></textarea>
									</div>
								</div>

									<%--SUBMIT BUTTON--%>
									<%--SUBMIT BUTTON--%>
								<div class="col-12 justify-content-md-center">
									<button class="insertBtn btn btn-success btn-lg" >생성</button>
								</div>
							</form>
						</div>
						<%--WHEN SEQ IS NULL--%>
						<%--WHEN SEQ IS NULL--%>
						<%--WHEN SEQ IS NULL--%>
						<%--WHEN SEQ IS NULL--%>



						<%--WHEN SEQ IS NOT NULL--%>
						<%--WHEN SEQ IS NOT NULL--%>
						<%--WHEN SEQ IS NOT NULL--%>
						<%--WHEN SEQ IS NOT NULL--%>
						<%--WHEN SEQ IS NOT NULL--%>
					</c:when>
					<c:otherwise>
						<div class="mainLabelBox">
							<h2 class="tableLabel">멤버 상세</h2>
							<div class="addBox" onclick="location.href='/memberList'">
								<h3 class="tableSubLabel">멤버 목록</h3>
								<span id="back2list" class="material-symbols-outlined">clear_all</span>
							</div>
						</div>
						<div class="tableBox_form">
							<form class="row g-4" name="updateForm" enctype="multipart/form-data">
								<input type="hidden" name="seq" value="<c:out value="${member.seq}"/>" />
								<div class="row mb-3">
									<div class="col-md-2">
										<label for="memType" class="form-label">회원 유형</label>
										<select class="form-select" aria-label="Default select example" name="" disabled id="memType">
											<option value="">::</option>
											<option value="0" <c:if test="${member.memType == 0}">selected</c:if>  >사용자</option>
											<option value="1" <c:if test="${member.memType == 1}">selected</c:if> >관리자</option>
										</select>
									</div>
									<div class="col-md-1">
										<label for="gender" class="form-label">성별</label>
										<select class="form-select" aria-label="Default select example" name="" disabled id="gender">
											<option value="">::</option>
											<option value="0" <c:if test="${member.gender == 0}">selected</c:if>  >남</option>
											<option value="1" <c:if test="${member.gender == 1}">selected</c:if> >여</option>
										</select>
									</div>
									<div class="col-md-2">
										<label for="nickname" class="form-label">닉네임</label>
										<input type="text" class="form-control" id="nickname" name="nickname" value="<c:out value="${member.nickname}"/>" >
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-md-4">
										<label for="email" class="form-label">이메일</label>
										<input type="text" class="form-control" id="email" name="" disabled value="<c:out value="${member.email}"/>" >
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-md-3">
										<label for="pwd" class="form-label">비밀번호</label>
										<input type="text" class="form-control" id="pwd" name="pwd" value="<c:out value="${member.pwd}"/>" >
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-md-2">
										<label for="dob" class="form-label">생년월일</label>
										<input type="text" class="form-control" id="dob" name="" disabled value="<c:out value="${member.dob}"/>">
									</div>
									<div class="col-md-2">
										<label for="location" class="form-label">거주지</label>
										<input type="text" class="form-control" id="location" name="location" value="<c:out value="${member.location}"/>" >
									</div>
								</div>

								<div class="row mb-3">
									<div class="col-md-5">
										<label for="memDesc" class="form-label">간단한 자기소개</label>
										<textarea class="form-control" id="memDesc" name="memDesc" rows="3"><c:out value="${member.memDesc}"/></textarea>
									</div>
								</div>

									<%--SUBMIT BUTTON--%>
									<%--SUBMIT BUTTON--%>
								<div class="col-1 justify-content-md-center">
									<button class="updateBtn btn btn-success btn-lg" >수정</button>
								</div>
								<div class="col-1 justify-content-md-center">
									<button class="deleteBtn btn btn-danger btn-lg" >삭제</button>
								</div>
							</form>
						</div>
					</c:otherwise>
				</c:choose>
				<%--WHEN SEQ IS NOT NULL--%>
				<%--WHEN SEQ IS NOT NULL--%>
				<%--WHEN SEQ IS NOT NULL--%>
				<%--WHEN SEQ IS NOT NULL--%>
				<%--WHEN SEQ IS NOT NULL--%>

				<%--FORM CONTENT ENDS FROM HERE!!--%>
				<%--FORM CONTENT ENDS FROM HERE!!--%>
			</div>
		</div>
	</main>
</div>
<%--script code--%>
<script type="text/javascript">



	/*validation js*/


	/*수정 버튼 이벤트*/
	$(".updateBtn").on("click",function(e){
		$("form[name=updateForm]").attr("action", "/memberUpdate").submit();
	});
	/*생성버튼 이벤트*/
	$(".insertBtn").on("click",function(e){
		$("form[name=insertForm]").attr("action", "/adminMakeMember").submit();

	});
	/*삭제버튼 이벤트*/
	$(".deleteBtn").on("click",function(){
		$("form[name=updateForm]").attr("action","/memberUelete").submit();
	});






</script>
<%--script code--%>
</body>
</html>