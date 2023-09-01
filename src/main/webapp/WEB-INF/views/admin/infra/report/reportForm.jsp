<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<%@include file="../include/head.jsp"%>
<body>
	<%@include file="../include/header.jsp"%>
	<div class="mainBox">
		<div class="mainContainer">
			<div class="mainLabelBox">
          		<h2 class="tableLabel"><c:out value="${item.actor }"/>의 상세내용</h2>
           	</div>
           	<div class="tableBox_form">
           		<div class="row g-4">
           			<div class="row mb-3">
           				<div style="position: relative" class="col-sm-12 text-center">
           					<div class="row mb-3">
           						<div class="col-md-2">
									<input type="text" class="" value="<c:out value="${item.actor }"/>" readonly="readonly">	
									<input type="text" class="" value="<c:out value="${item.actee }"/>" readonly="readonly">	
           						</div>
           					</div>
           					<div class="row mb-3">
								<div class="col-md-5">
									<label for="desc" class="form-label">신고내용</label>
									<textarea class="form-control" id="reportDesc" name="reportDesc" cols="5" rows="5" readonly="readonly">
										<c:out value="${item.reportDesc }"/>
									</textarea>
								</div>
							</div>
           				</div>
           			</div>
           		</div>
           	</div>
		</div>
	</div>
</body>
</html>