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
					<%
						String alertMessage = (String) request.getAttribute("alertMessage");
						if (alertMessage != null && !alertMessage.isEmpty()) {
					%>
					<script>
						alert("<%= alertMessage %>");
					</script>
					<%
						}
					%>
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

							<form class="row g-4" method="post" name="insertForm" enctype="multipart/form-data" autocomplete="off">
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
										<input class="form-control form-control-sm" id="<c:out value="${name}"/>" name="<c:out value="${name}"/>" type="file" style="display: none;" onChange="upload('<c:out value="${name}"/>', <c:out value="${type}"/>, 1, 1, 0, 0, 3);">
									</div>
								</div>
									<%--USER PROFILE END--%>
									<%--USER PROFILE END--%>
								<div class="row mb-3">
									<div class="col-md-2">
										<label for="memType" class="form-label">회원 유형</label>
										<select class="form-select" aria-label="Default select example" disabled id="memType">
											<option value="">::</option>
											<option value="0">사용자</option>
											<option value="1" selected>관리자</option>
										</select>
									</div>
									<div class="col-md-2">
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
										<label for="address" class="form-label">주소</label>
										<input type="text" class="form-control" id="adr" name="address">
									</div>
									<%--POSTAL CODE--%>
				                    <div class="my-3 row mb-3 d-flex justify-content-center" id="changeAddress" style="display: none">
				                        <label for="sample6_postcode" class="col-sm-2 col-form-label">주소 변경</label>
				                        <div class="col-sm-5">
			                                <input class="form-control" type="text" name="zipcode" id="sample6_postcode" placeholder="우편번호">
			                                <input class="form-control" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				                            <input class="form-control" type="text" id="sample6_address" placeholder="주소">
				                            <input class="form-control" type="text" id="sample6_detailAddress" placeholder="상세주소">
				                            <input type="hidden" id="addressFull" value="">
				                        </div>
				                    </div>
				                    <%--POSTAL CODE--%>
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
									<div class="col-md-3">
										<label for="address" class="form-label">주소</label>
										<input type="text" class="form-control" id="address" name="address" value="<c:out value="${member.address}"/>" >
										<input type="button" class="form-control" id="btnChgAddress" value="주소 변경">
									</div>
									<%--POSTAL CODE--%>
				                    <div class="my-3 row mb-3" id="changeAddress" style="display: none">
				                        <label for="sample6_postcode" class="col-sm-2 col-form-label">주소 변경</label>
				                        <div class="col-sm-5">
			                                <input class="form-control" type="text" name="zipcode" id="sample6_postcode" placeholder="우편번호">
			                                <input class="form-control" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				                            <input class="form-control" type="text" id="sample6_address" placeholder="주소">
				                            <input class="form-control" type="text" id="sample6_detailAddress" placeholder="상세주소">
				                            <input type="hidden" id="addressFull" value="">
				                        </div>
				                    </div>
				                    <%--POSTAL CODE--%>
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/kakaoPostal.js"></script>
<%--script code--%>
<script type="text/javascript">
	var memberForm = $("form[name='memberInfo']");
	
	$("#btnChgAddress").on("click", function() {
		
		$("#changeAddress").show();
		
	});

	$("#upSave").on("click", function(){
		
		if(!($("#sample6_address").val(null)) || !($("#sample6_address").val("")) ) {
			$("#address").remove();
			$("#addressFull").attr("name", "address");
			$("#addressFull").val($("#sample6_address").val() + " " + $('#sample6_detailAddress').val());
			memberForm.attr("method", "post");
			memberForm.attr("action", "/memberUpdate").submit();
		} else {
			$("#addressFull").remove();
			memberForm.attr("method", "post");
			memberForm.attr("action", "/memberUpdate").submit();
		}
		
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
	$(".deleteBtn").on("click",function(){
		$("form[name=updateForm]").attr("action","/memberUelete").submit();
	});






</script>
<%--script code--%>
</body>
</html>