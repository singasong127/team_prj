<%--<ul>--%>
<%--	<li>파티명 : <c:out value="${team.partyName }" /></li>--%>
<%--	<li>파티장 : <c:out value="${team.partyLeader }" /></li>--%>
<%--	<li>날짜 : <c:out value="${team.playDt }" /></li>--%>
<%--	<li>시작시간 : <c:out value="${team.playTimeStart }" /></li>--%>
<%--	<li>종료시간 : <c:out value="${team.playTimeEnd }" /></li>--%>
<%--	<li>파티인원 : <c:out value="${team.playerNum } / ${team.playerMax }" /></li>--%>
<%--	<li>성별 :--%>
<%--		<c:set var="jax" value=""  />--%>
<%--		<c:out value="${team.partyGen }" />--%>
<%--	</li>--%>
<%--	<li>장비 지참 여부 : <c:out value="${team.toolNy }" /></li>--%>
<%--	<li>설명 : <c:out value="${team.partyDesc }" /></li>--%>
<%--</ul>--%>


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="kr">
<%@include file="../include/head.jsp"%>
<body>
	<div>
		<%@include file="../include/header.jsp"%>
		<main>
			<div class="mainBox">
				<div class="mainContainer2">
					<div class="chatHalf partyStatus_half">
						<%@include file="../../../chat.jsp"%>

					</div>
					<div class="partHalf partyStatus_half">
						<!-- 파티장 -->
						<div class="userInfo">
							<div class="userInfo_img">
								<img src="${sessionProfilePath}${sessionProfileName}">
							</div>
							<div class="userInfo_info">
								<h6>${sessionId}</h6>
							</div>
						</div>
						<!-- 파티원 -->
						
					</div>
					
					<%--FORM CONTENT STARTS FROM HERE!!--%>
					<%--FORM CONTENT ENDS FROM HERE!!--%>

					<%--FORM CONTENT ENDS FROM HERE!!--%>
					<%--FORM CONTENT STARTS FROM HERE!!--%>


				</div>
			</div>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
		</main>
	</div>
</body>
</html>