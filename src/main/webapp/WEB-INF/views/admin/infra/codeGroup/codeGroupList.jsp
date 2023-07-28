<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<<<<<<< HEAD
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
	            <!-- 검색 영역 박스 -->
	            <div class="searchBox">
		            <form name="formSh" method="post">
		            	<input type="text" class="form-control" placeholder="코드 그룹 이름" value="${vo.cgName }" name="cgName" id="cgName">
						<button class="detailBtn" id="btnSh">
					   		<i class="bi bi-arrow-clockwise"></i>검색
					   </button>
					</form>
				</div>
	            <div class="tableBox">
	            	<table class="table primary-table-bordered display"
									style="min-width: 845px">
						<thead class="mb-2 thead-primary">
							<tr>
								<th>#</th>
								<th>CODEGROUPNAME</th>
								<th></th>
								<th>삭제 여부</th>
							</tr>
						</thead>
						<tbody class="mb-3">
							<c:choose>
								<c:when test="${fn:length(list) eq 0}">
									<tr>
										<td class="text-center" colspan="9">데이터가 없습니다!</td>
									</tr>
								</c:when>
								<c:otherwise>
									<%-- ${list} 자바에서 넘겨준 객체 이름 --%>
									<!-- var="list" jstl 블럭에서 사용할 변수 이름 -->
									<c:forEach items="${list}" var="list" varStatus="status">
										<tr>
											<td><a
												href="/cgform?cgSeq=<c:out value="${list.cgSeq}"></c:out>">
													<c:out value="${list.cgSeq}"></c:out>
											</a></td>
											<td>
												<a href="/cgform?cgSeq=<c:out value="${list.cgSeq}"></c:out>">
													<c:out value="${list.cgName}"></c:out>
												</a>
											</td>
											<td>
												<a href="/cgform?cgSeq=<c:out value="${list.cgSeq}"></c:out>" class="detailBtn">
													수정
												</a>
											</td>
											<td>
												<c:choose>
													<c:when test="${list.delNy eq '1'}">Y</c:when>
													<c:otherwise>N</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
						<tfoot>
							
						</tfoot>
					</table>
           		</div>
            <%--FORM CONTENT STARTS FROM HERE!!--%>
            	<div class="excuteBox">
	            	<button class="detailBtn" id="btnUpt" onclick="location.href='/cgform'">수정</button>
	            	<button class="detailBtn" id="btnIns" onclick="location.href='/cgform'">추가</button>
	            	<button class="detailBtn" id="btnDel"><i class="bi bi-search"></i>삭제</button>
            	</div>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
            </div>
        </div>
    </main>
</div>

<script type="text/javascript">

	$("#btnSh").on("click", function() {
		
		$("form[name=formSh]").attr("action", '/cglist').submit();
		
	});

</script>
=======

<table class="table primary-table-bordered display"
	style="min-width: 845px">
	<thead class="mb-2 thead-primary">
		<tr>
			<th>#</th>
			<th>CODEGROUPNAME</th>
		</tr>
	</thead>
	<tbody class="mb-3">
		<c:choose>
			<c:when test="${fn:length(list) eq 0}">
				<tr>
					<td class="text-center" colspan="9">데이터가 없습니다!</td>
				</tr>
			</c:when>
			<c:otherwise>
				<%-- ${list} 자바에서 넘겨준 객체 이름 --%>
				<!-- var="list" jstl 블럭에서 사용할 변수 이름 -->
				<c:forEach items="${list}" var="list" varStatus="status">
					<tr>
						<td><a
							href="/cgform?cgSeq=<c:out value="${list.cgSeq}"></c:out>"> <c:out
									value="${list.cgSeq}"></c:out>
						</a></td>
						<td><a
							href="/cgform?cgSeq=<c:out value="${list.cgSeq}"></c:out>"> <c:out
									value="${list.cgName}"></c:out>
						</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
	<tfoot>

	</tfoot>
</table>
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
