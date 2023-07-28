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
		        <form autocomplete="off" class="d-flex" onsubmit="searchPlaces(); return false;">
					<input type="text" class="form-control" id="keyword"
						placeholder="검색할 단어를 입력" value="" >
					<!-- <button type="submit" id="btnSearch">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button> -->
				</form>
	       		<div id="list" class="bg_white">
			        <div class="option"></div>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
		    	</div>
	            <div id="map" style="width: 100%; height: 860px;"></div>
            </div>
            <%--FORM CONTENT STARTS FROM HERE!!--%>
            	
			<%--FORM CONTENT ENDS FROM HERE!!--%>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
        </div>
    </main>
</div>

<%@ include file="../../../admin/infra/include/partyBuild.jsp" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54c60ae7f8e07cf5112b5b1d3980bd2d&libraries=services"></script>
<script type="text/javascript" src="/resources/js/kakaomap.js"></script>
<script type="text/javascript">

	$("#srcGo").val() = places.address_name;
	
	var address = $("#srcGo").val();
	
</script>