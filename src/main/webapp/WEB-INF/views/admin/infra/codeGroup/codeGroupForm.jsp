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
	            <!-- 검색 영역 박스 -->
					<form name="form" method="post">
						<div class="col-lg-6">
							<div class="row">
								<c:choose>
									<c:when test="${empty item.cgSeq }">
										<input type="text" class="form-control mb-3 mx-3 w-25"
											name="cgSeq" id="cgSeq"
											value="<c:out value="${item.cgSeq }"/>" placeholder="자동 생성"
											readonly style="background-color: #ccc">
										<input type="text" class="form-control mb-3 w-25"
											name="cgName" id="cgName"
											value="<c:out value="${item.cgName }"/>">
									</c:when>
									<c:otherwise>
										<input type="text" class="form-control mb-3 mx-3 w-25"
											name="cgSeq" id="cgSeq"
											value="<c:out value="${item.cgSeq }"/>" readonly>
										<input type="text" class="form-control mb-3 w-25"
											name="cgName" id="cgName"
											value="<c:out value="${item.cgName }"/>">
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</form>
					<%--FORM CONTENT STARTS FROM HERE!!--%>
            	<div class="excuteBox">
							<c:choose>
								<c:when test="${empty item.cgSeq }">
									<button type="button" class="detailBtn"
										id="btnIns">등록</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="detailBtn"
										id="btnDel">삭제</button>
									<button type="button" class="detailBtn"
										id="btnUel">Uelete</button>
									<button type="button" class="detailBtn" id="btnUpt">저장</button>
								</c:otherwise>
							</c:choose>
	            	
            	</div>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
            </div>
        </div>
    </main>
</div>

<script type="text/javascript">

	$("#btnIns").on("click", function() {
		$("form[name=form]").attr("action", "/cginsert").submit();
	});
	
	$("#btnDel").on("click", function() {
		$("form[name=form]").attr("action", "/cgdelete").submit();
	});
	
	$("#btnUel").on("click", function() {
		$("form[name=form]").attr("action", "/cguelete").submit();
	});
	
	$("#btnUpt").on("click", function() {
		$("form[name=form]").attr("action", "/cgupdate").submit();
	});

</script>
