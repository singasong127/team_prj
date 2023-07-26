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
			<div class="table">
				<table>
					<thead>
						<tr>
							<th>seq</th>
							<th>memType</th>
							<th>nickname</th>
							<th>eamil</th>
							<th>pwd</th>
							<th>gender</th>
							<th>dob</th>
							<th>location</th>
							<th>memDesc</th>
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
										<td><a href="#"><c:out value="${list.seq }"></c:out></a></td>
										<td><c:out value="${list.seq }"></c:out></td>
										<td><c:out value="${list.memType }"></c:out></td>
										<td><c:out value="${list.eamil }"></c:out></td>
										<td><c:out value="${list.pwd }"></c:out></td>
										<td><c:out value="${list.gender }"></c:out></td>
										<td><c:out value="${list.dob }"></c:out></td>
										<td><c:out value="${list.location }"></c:out></td>
										<td><c:out value="${list.memDesc }"></c:out></td>
									</tr>							
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
						
			<%--FORM CONTENT ENDS FROM HERE!!--%>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
            </div>
        </div>
    </main>
</div>