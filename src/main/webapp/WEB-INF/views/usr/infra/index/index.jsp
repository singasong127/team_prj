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
	            <div class="searchBox">
	            
	            <!-- 종목(나중에 분류 재지정하고 재설정) -->
				   <select>
				   	<option value="" selected>-- 종목 --</option>
				   </select>
				   
				   <!-- 날짜 선택 -->
				   <select>
				   	<option value="" selected>-- 날짜 --</option>
				   </select>
				   
				   <!-- 성별 선택창 -->
				   <select>
				   	<option value="" selected>-- 성별 --</option>
				   </select>
				   
				   <!-- 지역(예시로 전국 8도로 세팅 나중에 변경) -->
				   <select>
				   	<option value="" selected>-- 지역 --</option>
				   </select>
				   
				   <select>
				   	<option value="" selected>-- 연령대 --</option>
				   </select>
				   
				   <button class="detailBtn">
				   	<i class="bi bi-arrow-clockwise"></i>
				   </button>
				</div>
	            <div class="tableBox">
	            	<table class="">
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
	            			</tr>
	            		</thead>
	            		<%-- <tbody>
	            			<c:when test="#">
	            				<tr>
	            					<td class="text-center" colspan="9">아무것도 없어요 있었는데? 아니 없다고요</td>
	            				</tr>
	            			</c:when>
	            			<c:otherwise> --%>
	            				<tr>
	            					<td>1</td>
	            					<td>2</td>
	            					<td>3</td>
	            					<td>4</td>
	            					<td>5</td>
	            					<td>6</td>
	            					<td>7</td>
	            					<td>8</td>
	            					<td>9</td>
	            				</tr>
	            			<%-- </c:otherwise> --%>
	            		</tbody>
	            	</table>
           		</div>
            <%--FORM CONTENT STARTS FROM HERE!!--%>
            	<div class="excuteBox">
	            	<button class="detailBtn" id="btnCre">파티생성</button>
	            	<button class="detailBtn" onclick="location.href='/PartyTest'">테스트</button>
	            	<button class="detailBtn"><i class="bi bi-search"></i></button>
            	</div>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
            </div>
        </div>
    </main>
</div>

<%@ include file="../../../admin/infra/include/partyBuild.jsp" %>

<script type="text/javascript">

	$("#btnCre").on("click", function() {
		
		$("#modalCre").css("display", "block");
		
	});
	
</script>