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
			<div class="tableBox">
				<table>
					<thead>
						<tr>
							<th>seq</th>
							<th>memType</th>
							<th>nickname</th>
							<th>email</th>
							<th>pwd</th>
							<th>gender</th>
							<th>dob</th>
							<th>location</th>
							<th>memDesc</th>
							<th>delNy</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(list) eq 0 }">
								<tr>
									<td class="text-center" colspan="9">가입한 회원이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="list" varStatus="status">
									<tr>
										<td><a href="/memberOne?seq=<c:out value="${list.seq }"/>"><c:out value="${list.seq }"></c:out></a></td>
										<td><c:out value="${list.memType }"></c:out></td>
										<td><a href="/memberOne?seq=<c:out value="${list.seq }"/>"><c:out value="${list.nickname }"></c:out></a></td>
										<td><c:out value="${list.email }"></c:out></td>
										<td><c:out value="${list.pwd }"></c:out></td>
										<td><c:out value="${list.gender }"></c:out></td>
										<td><c:out value="${list.dob }"></c:out></td>
										<td><c:out value="${list.location }"></c:out></td>
										<td><c:out value="${list.memDesc }"></c:out></td>
										<td><c:out value="${list.delNy }"></c:out></td>
									</tr>							
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
				
			<%--FORM CONTENT ENDS FROM HERE!!--%>
				<div class="container-fluid px-0 mt-2">
				    <div class="row">
				        <div class="col">
				            <!-- <ul class="pagination pagination-sm justify-content-center mb-0"> -->
				            <ul class="pagination justify-content-center mb-0">
				                <!-- <li class="page-item"><a class="page-link" href="#"><i class="fa-solid fa-angles-left"></i></a></li> -->
								<c:if test="${vo.startPage gt vo.pageNumToShow}">
				                	<li class="page-item"><a class="page-link" href="javascript:goList(${vo.startPage - 1})"><i class="fa-solid fa-angle-left"></i></a></li>
								</c:if>
								<c:forEach begin="${vo.startPage}" end="${vo.endPage}" varStatus="i">
									<c:choose>
										<c:when test="${i.index eq vo.thisPage}">
				                			<li class="page-item active"><a class="page-link" href="javascript:goList(${i.index})">${i.index}</a></li>
										</c:when>
											<c:otherwise>             
				                				<li class="page-item"><a class="page-link" href="javascript:goList(${i.index})">${i.index}</a></li>
											</c:otherwise>
									</c:choose>
								</c:forEach>                
								<c:if test="${vo.endPage ne vo.totalPages}">                
				                <li class="page-item"><a class="page-link" href="javascript:goList(${vo.endPage + 1})"><i class="fa-solid fa-angle-right"></i></a></li>
								</c:if>
				                <!-- <li class="page-item"><a class="page-link" href="#"><i class="fa-solid fa-angles-right"></i></a></li> -->
				            </ul>
				        </div>
				    </div>
				</div>
			
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
       		<div class="excuteBox">
	            	<button class="detailBtn" onclick="location.href='/memberInesrt'">맴버생성</button>
	            	<button class="detailBtn"><i class="bi bi-search"></i></button>
            	</div>
            </div>
        </div>
    </main>
</div>