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
					<form name="formParty" method="post">
					<div class="partHalf partyStatus_half">
						<div class="userInfo">
							<div class="userInfo_img">
								<img src="${sessionProfilePath}${sessionProfileName}">
							</div>
							<div class="userInfo_info">
								<h6>${sessionId}</h6>
							</div>
						</div>
					</div>
					<div class="partHalf partyStatus_half">
						<div>
							<label for="partySport">종목 : </label>
							<c:forEach items="${code}" var="code">
								<span>
									<c:if test="${code.cdSeq == item.partySport}">
										<c:out value="${code.cdName }"></c:out>
									</c:if>
								</span>
							</c:forEach>
							<label for="partyName">파티 제목 : </label>
							<input type="hidden" name="mpName" value="${item.seq }">
							<span><c:out value="${item.partyName }"></c:out></span><br>
							<label for="partyLeader">파티 리더 : </label>
							<c:forEach items="${member}" var="member">
								<span>
									<c:if test="${member.seq == item.partyLeader}">
										<c:out value="${member.nickname }"></c:out>
									</c:if>
								</span>
								<input type="hidden" name="leaderName" value="${item.partyLeader }">
							</c:forEach>
							<%-- <label>인원수 : </label>
							<span><c:out value="${item.playerNum }"></c:out> / <c:out value="${item.playerMax }"></c:out></span>
							<label for="playDt">날짜 : </label>
							<span><c:out value="${item.playDt }"></c:out></span><br>
							<label>시간 : </label>
							<span><c:out value="${item.playTimeStart }"></c:out> ~ <c:out value="${item.playTimeEnd }"></c:out></span>
							<label for="partyGen">성별 : </label>
							<span>	
								<c:choose>
									<c:when test="<c:out value='${item.partyGen} == 0'/>">남성</c:when>
									<c:when test="<c:out value='${item.partyGen} == 1'/>">여성</c:when>
								</c:choose>
								<c:otherwise>
									무관
								</c:otherwise>
							</span>
							<label for="playLocation">지역 : </label>
							<span><c:out value="${item.playLocation }"></c:out></span> --%>
						</div>					
					</div>
					<%--FORM CONTENT STARTS FROM HERE!!--%>
					<%--FORM CONTENT ENDS FROM HERE!!--%>

					<%--FORM CONTENT ENDS FROM HERE!!--%>
					<%--FORM CONTENT STARTS FROM HERE!!--%>
					<input type="button" onclick="joinParty()" value="참가 신청">
					</form>
				</div>
			</div>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
		</main>
	</div>
	<script type="text/javascript">
		
		function joinParty() {
				alert("파티 참가 신청이 완료 되었습니다!");
				$("form[name=formParty]").attr("action", "/joinParty").submit();
		}		
	
	</script>
</body>
</html>
