<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="kr">
<title>코드 그룹 리스트</title>
<%@include file="../include/head.jsp"%>
<body>
<div>
	<%@include file="../include/header.jsp"%>
	<main>
		<div class="mainBox">
			<div class="mainContainer">
				<%--FORM CONTENT STARTS FROM HERE!!--%>
				<%--FORM CONTENT STARTS FROM HERE!!--%>
				<div class="mainLabelBox">
					<h2 class="tableLabel">코드그룹 관리</h2>
					<div class="addBox" onclick="location.href='/codeGroupForm'">
						<h3 class="tableSubLabel">코드그룹 추가</h3>
						<span class="material-symbols-outlined">add_box</span></a>
					</div>
				</div>
				<form name="search" method="post">
					<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
					<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
					<div class="searchBox">

						<select name="optDelNy">
							<option value="">삭제여부</option>
							<option value="1">삭제</option>
							<option value="0">미삭제</option>
						</select>
						<div class="inputBox">
							<input id="srcGo" name="cgName" class="short searchInput" type="text" value="<c:out value="${vo.cgName}"/>">
							<span id="magGlass"class="material-symbols-outlined">search</span>
						</div>
					</div>
				</form>
				<div class="tableBox">
					<table>
						<thead>
						<tr>
							<th>#</th>
							<th>그룹이름</th>
							<th></th>
							<th>삭제여부</th>
						</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${fn:length(list) eq 0}">
								<tr>
									<td><h4 id="nodata">There is no data!</h4></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="list" varStatus="status">
									<tr>
										<td><c:out value="${list.cgSeq}"></c:out></td>
										<td><c:out value="${list.cgName}"></c:out></td>
										<td><button class="detailBtn" onclick="location.href='/cgform?cgSeq=<c:out value = '${list.cgSeq}'/>'">수정</button></td>
										<td>
											<c:choose>
												<c:when test="${list.delNy eq '1'}">
													Y
												</c:when>
												<c:otherwise>
													N
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div>
				<%--pagination include--%>
				<%--pagination include--%>
				<c:choose>
					<c:when test="${vo.totalPages eq 1}">

					</c:when>
					<c:otherwise>

						<%@include file="../include/pagination.jsp"%>

					</c:otherwise>
				</c:choose>
				<%--pagination include--%>
				<%--pagination include--%>


				<%--FORM CONTENT ENDS FROM HERE!!--%>
				<%--FORM CONTENT ENDS FROM HERE!!--%>
			</div>
		</div>
	</main>
</div>

</body>
<script type="text/javascript">
	<%--pagination js function--%>
	<%--pagination js function--%>

	goList = function(thisPage) {
		if(thisPage == 0) {

			$("input:hidden[name=thisPage]").val(1);
			$("form[name=search]").attr("action", "/cglist").submit();

		} else if(thisPage > ${vo.totalPages}) {

			$("input:hidden[name=thisPage]").val(thisPage - 1);
			$("form[name=search]").attr("action", "/cglist").submit();
		} else {

			$("input:hidden[name=thisPage]").val(thisPage);
			$("form[name=search]").attr("action", "/cglist").submit();

		}
	}
	<%--pagination js function--%>
	<%--pagination js function--%>


</script>
