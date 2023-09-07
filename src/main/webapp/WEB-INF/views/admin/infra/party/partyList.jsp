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
	            <!-- 날짜 박스 -->
	            <div>
	            	일기예보 박스 넣는곳
	            </div>
	            <!-- select 박스 -->
	            <!-- <div class="searchBox">
	            
	            종목(나중에 분류 재지정하고 재설정)
				   <select>
				   	<option value="" selected>-- 종목 --</option>
				   </select>
				   
				   날짜 선택
				   <select>
				   	<option value="" selected>-- 날짜 --</option>
				   </select>
				   
				   성별 선택창
				   <select>
				   	<option value="" selected>-- 성별 --</option>
				   </select>
				   
				   지역(예시로 전국 8도로 세팅 나중에 변경)
				   <select>
				   	<option value="" selected>-- 지역 --</option>
				   </select>
				   
				   <select>
				   	<option value="" selected>-- 연령대 --</option>
				   </select>
				   
				   <button class="detailBtn">
				   	<i class="bi bi-arrow-clockwise"></i>
				   </button>
				</div> -->
	            <div class="tableBox">
	            	<table>
	            		<thead>
	            			<tr>
		            			<th>No.</th>
	    	        			<th>종목</th>
	    	        			<th>파티 제목</th>
	    	        			<th>인원수</th>
	    	        			<th>날짜</th>
	    	        			<th>시간</th>
	    	        			<th>성별</th>
	    	        			<th>지역</th>
	    	        			<th>장비지참</th>
	    	        			<th>삭제여부</th>
	            			</tr>
	            		</thead>
	            		<tbody>
            				<c:choose>
								<c:when test="${fn:length(list) eq 0}">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td class="text-center" colspan="9">데이터가 없습니다!</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:when>
							<c:otherwise>
								<%-- ${list} 자바에서 넘겨준 객체 이름 --%>
								<!-- var="list" jstl 블럭에서 사용할 변수 이름 -->
								<c:forEach items="${list}" var="list" varStatus="status">
									<tr>
										<td>
											<a href="/ptform?seq=<c:out value="${list.seq}"></c:out>">
												<c:out value="${list.seq}"></c:out>
											</a>
										</td>
										<td>
											<a href="/ptform?seq=<c:out value="${list.seq}"></c:out>">
												<c:out value="${list.partySport}"></c:out>
											</a>
										</td>
										<td>
											<a href="/ptform?seq=<c:out value="${list.partyName}"></c:out>">
												<c:out value="${list.partyName}"></c:out>
											</a>
										</td>
										<td>
											<a href="/ptform?seq=<c:out value="${list.playerMax}"></c:out>">
												<c:out value="${list.playerMax}"></c:out>
											</a>
										</td>
										<td>
											<a href="/ptform?seq=<c:out value="${list.playDt}"></c:out>">
												<c:out value="${list.playDt}"></c:out>
											</a>
										</td>
										<td>
											<a href="/ptform?seq=<c:out value="${list.playTimeStart}"></c:out>">
												<c:out value="${list.playTimeStart}"></c:out>
											</a>
										</td>
										<td>
											<c:choose>
												<c:when test="${list.partyGen eq '0'}">남</c:when>
												<c:when test="${list.partyGen eq '1'}">여</c:when>
												<c:otherwise>무관</c:otherwise>
											</c:choose>
										</td>
										<td>
											<a href="/ptform?seq=<c:out value="${list.partyLocation}"></c:out>">
												<c:out value="${list.partyLocation}"></c:out>
											</a>
										</td>
										<td>
											<c:choose>
												<c:when test="${list.toolNy eq '1'}">Y</c:when>
												<c:otherwise>N</c:otherwise>
											</c:choose>
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
            			<%-- </c:otherwise> --%>
	            		</tbody>
	            	</table>
           		</div>
            <%--FORM CONTENT STARTS FROM HERE!!--%>
            	<div class="excuteBox">
	            	<!-- <button class="detailBtn" id="btnCre">파티생성</button> -->
	            	<button class="detailBtn"><i class="bi bi-search"></i></button>
            	</div>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
            </div>
        </div>
    </main>
</div>

<%-- <%@ include file="../../../admin/infra/include/partyBuild.jsp" %> --%>

<script type="text/javascript">

	
	
</script>