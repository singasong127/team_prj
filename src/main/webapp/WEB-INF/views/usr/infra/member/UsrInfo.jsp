<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="kr">
<%@include file="../include/head.jsp"%>
<%@include file="../include/header.jsp"%>
<main>
	<div class="mainBox">
		<div class="mainContainer">
			<%--FORM CONTENT STARTS FROM HERE!!--%>
			<%--FORM CONTENT STARTS FROM HERE!!--%>




					<%--WHEN SEQ IS NOT NULL--%>
					<%--WHEN SEQ IS NOT NULL--%>
					<%--WHEN SEQ IS NOT NULL--%>
					<%--WHEN SEQ IS NOT NULL--%>
					<%--WHEN SEQ IS NOT NULL--%>

					<div class="mainLabelBox">
						<h2 class="tableLabel">멤버 상세</h2>
						<div class="addBox" onclick="location.href='/'">
							<h3 class="tableSubLabel">메인으로</h3>
							<span id="back2list" class="material-symbols-outlined">clear_all</span>
						</div>
					</div>
					<div class="tableBox_form">
						<form class="row g-4" name="updateForm" enctype="multipart/form-data" method="post">
							<input type="hidden" name="seq" value="<c:out value="${member.seq}"/>" />
								<%--USER PROFILE STARTS--%>
								<%--USER PROFILE STARTS--%>
							<div class="row mb-3">
								<div style="position: relative" class="col-sm-12 text-center">
									<c:set var="type" value="1"/>		<!-- #-> -->
									<c:set var="name" value="uploadImgProfile"/>		<!-- #-> -->

									<c:choose>
										<c:when test="${fn:length(listUploaded) eq 0 }">
											<img id="<c:out value="${name}"/>Preview" src="/resources/img/defaultProfile.png" class="rounded-circle mx-auto d-block" width="100" height="100">
										</c:when>
										<c:otherwise>
											<c:set var="GetNy" value="0"/>
											<c:forEach items="${listUploaded}" var="listUploaded" varStatus="statusUploaded">
												<c:if test="${listUploaded.type eq type}">
													<input type="hidden" id="<c:out value="${name}"/>DeleteSeq" name="<c:out value="${name}"/>DeleteSeq" value="<c:out value="${listUploaded.seq}"/>"/>
													<input type="hidden" id="<c:out value="${name}"/>DeletePathFile" name="<c:out value="${name}"/>DeletePathFile" value="<c:out value="${listUploaded.path}"/><c:out value="${listUploaded.uuidName}"/>"/>
													<img style="object-fit: cover" id="<c:out value="${name}"/>Preview" src="<c:out value="${listUploaded.path}"/><c:out value="${listUploaded.uuidName}"/>" class="rounded-circle mx-auto d-block" width="100" height="100">
													<c:set var="GetNy" value="1"/>
												</c:if>
											</c:forEach>
											<c:if test="${GetNy eq 0 }">
												<img id="<c:out value="${name}"/>Preview" src="/resources/img/defaultProfile.png" class="rounded-circle mx-auto d-block" width="100" height="100">
											</c:if>
										</c:otherwise>
									</c:choose>
									<input type="hidden" id="<c:out value="${name}"/>Type" name="<c:out value="${name}"/>Type" value="<c:out value="${type}"/>"/>
									<input type="hidden" id="<c:out value="${name}"/>MaxNumber" name="<c:out value="${name}"/>MaxNumber" value="0"/>
									<label for="<c:out value="${name}"/>" class="form-label input-file-button">
										<b>
											<span style="font-weight: 900; font-size: 20px; cursor: pointer; padding: 5px; border-radius: 50%; color: white; background-color: coral; position: absolute; transform: translateX(-50%); bottom:10px;" class="material-symbols-outlined">settings</span>
										</b>
									</label>
									<input class="form-control form-control-sm" id="<c:out value="${name}"/>" name="<c:out value="${name}"/>" type="file" multiple="multiple" style="display: none;" onChange="upload('<c:out value="${name}"/>', <c:out value="${type}"/>, 1, 1, 0, 0, 3);">
								</div>
							</div>
								<%--USER PROFILE END--%>
								<%--USER PROFILE END--%>
							<div class="row mb-3">
								<div class="col-md-2">
									<label for="memType" class="form-label">회원 유형</label>
									<select class="form-select" aria-label="Default select example" name="" disabled id="memType">
										<option value="">::</option>
										<option value="0" <c:if test="${member.memType == 0}">selected</c:if>  >사용자</option>
										<option value="1" <c:if test="${member.memType == 1}">selected</c:if> >관리자</option>
									</select>
								</div>
								<div class="col-md-2">
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
							<div class="col-2 justify-content-md-center">
								<button  class="updateBtn btn btn-success btn-lg" >수정</button>
							</div>
							<div class="col-2 justify-content-md-center">
								<button class="deleteBtn btn btn-danger btn-lg" >회원탈퇴</button>
							</div>
						</form>
					</div>

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
	$(".deleteBtn").on("click",function(e){
			e.preventDefault();
		if(confirm("개인정보가 삭제됩니다. 정말 탈퇴하시겠습니까?")){
			alert("탈퇴되었습니다!");
			$("form[name=updateForm]").attr("action","/memberUelete").submit();
		}else{
			alert("탁월한 선택이십니다!");
		}
	});






</script>
<%--script code--%>
</body>
</html>