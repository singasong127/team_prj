<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
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
				<div class="mainLabelBox">
					<h2 class="tableLabel">멤버 관리</h2>
					<div class="addBox" onclick="location.href='/memberOne'">
						<h3 class="tableSubLabel">멤버 추가 (관리자)</h3>
						<span class="material-symbols-outlined">add_box</span></a>
					</div>
				</div>
				<form name="search">
					<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
					<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
					<div class="searchBox">
						<select name="optDelNy">
							<option value="">사용여부</option>
							<option value="1">사용</option>
							<option value="0">미시용</option>
						</select>
						<div class="inputBox">
							<input id="srcGo" name="nickname" class="short searchInput" type="text" value="<c:out value="${vo.nickname}"/>">
							<span id="magGlass"class="material-symbols-outlined">search</span>
						</div>
					</div>
				</form>
				<div class="tableBox">
					<table>
						<thead>
						<tr>
							<th>#</th>
							<th>회원 유형</th>
							<th>닉네임</th>
							<th>이메일</th>
							<th>비밀번호</th>
							<th>성별</th>
							<th>거주지</th>
							<th></th>
							<th>삭제 여부</th>
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

										<td><c:out value="${list.seq }"></c:out></td>
										<td>
											<c:choose>
												<c:when test="${list.memType == 0}">사용자</c:when>
												<c:when test="${list.memType == 1}">관리자</c:when>
											</c:choose>
										</td>
										<td><c:out value="${list.nickname }"></c:out></td>
										<td><c:out value="${list.email }"></c:out></td>
										<td><c:out value="${list.pwd }"></c:out></td>
										<td><c:out value="${list.gender }"></c:out></td>
										<td><c:out value="${list.location }"></c:out></td>
										<td><c:out value="${list.memDesc }"></c:out></td>
										<td><c:out value="${list.delNy }"></c:out></td>
										<td><c:out value="${list.signUpDt }"></c:out></td>
										<td><c:out value="${list.uptProfileDt }"></c:out></td>
									</tr>							
										<td>
											<button class="detailBtn" onclick="location.href='/memberOne?seq=<c:out value = '${list.seq}'/>'">
												상세
											</button>
										</td>
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
			$("form[name=search]").attr("action", "/memberList").submit();

		} else if(thisPage > ${vo.totalPages}){

			$("input:hidden[name=thisPage]").val(thisPage - 1);
			$("form[name=search]").attr("action", "/memberList").submit();
		}else{

			$("input:hidden[name=thisPage]").val(thisPage);
			$("form[name=search]").attr("action", "/memberList").submit();

		}
	}
	<%--pagination js function--%>
	<%--pagination js function--%>
</script>
</html>