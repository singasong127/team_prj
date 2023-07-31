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
					<c:when test="${empty item.cgSeq }">
						<div class="mainLabelBox">
							<h2 class="tableLabel">코드그룹 추가</h2>
							<div class="addBox" onclick="location.href='/cglist'">
								<h3 class="tableSubLabel">코드그룹 목록</h3>
								<span id="back2list" class="material-symbols-outlined">clear_all</span>
							</div>
						</div>
						<div class="tableBox_form">
							<table>
								<thead>
								<tr>
									<th>그룹이름</th>
									<th></th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<form name="insertForm">

										<td><input name="cgName" class="searchInput_form" placeholder="코드그룹명"></td>

										<td><button class="insertBtn btn">생성</button></td>
									</form>
								</tr>
								</tbody>
							</table>
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
							<h2 class="tableLabel">코드그룹 수정</h2>
							<div class="addBox" onclick="location.href='/cglist'">
								<h3 class="tableSubLabel">코드그룹 목록</h3>
								<span id="back2list" class="material-symbols-outlined">clear_all</span>
							</div>
						</div>
						<div class="tableBox_form">
							<table>
								<thead>
								<tr>
									<th>#</th>
									<th>코드그룹 이름</th>
									<th></th>
									<th></th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<form name="updateForm">
										<td><input readonly class="searchInput_formSeq" name="cgSeq" value="<c:out value="${item.cgSeq}"></c:out>"/></td>
										<td><input name="cgName" class="searchInput_form" value="<c:out value="${item.cgName}"></c:out>"></td>

										<td><button class="updateBtn btn">수정</button></td>
										<td><button class="deleteBtn btn">삭제</button></td>
									</form>
								</tr>
								</tbody>
							</table>
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
<script>
	/*수정 버튼 이벤트*/
	$(".updateBtn").on("click",function(){
		$("form[name=updateForm]").attr("action","/cgupdate").submit();
	});
	/*생성버튼 이벤트*/
	$(".insertBtn").on("click",function(e){
			$("form[name=insertForm]").attr("action","/cginsert").submit();
	});
	/*삭제버튼 이벤트*/
	$(".deleteBtn").on("click",function(){
		$("form[name=updateForm]").attr("action","/cguelete").submit();
	});

</script>
<%--script code--%>
</body>
</html>