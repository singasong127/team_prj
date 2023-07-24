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
            <h1>파티 생성</h1>
            
            <!-- 파티 생성 데이터 담을 폼 -->
            <div class="tableBox">
	            
	            <form action="">
	            	<!-- 파티 생성 박스 -->
					<div class="d-flex">
						<!-- 종목과 파티제목 -->
						<div class="insert_box">
							<select>
								<option value="" selected>-- 종목 --</option>
							</select>
							<input type="text" placeholder="파티 제목">
						</div>
						
						<!-- 인원수 날짜 연령대 -->
						<div class="insert_box">
							<select>
								<option value="" selected>-- 인원수 --</option>
							</select>
							<select>
								<option value="" selected>-- 날짜 --</option>
							</select>
							<select>
								<option value="" selected>-- 연령대 --</option>
							</select>
						</div>
						
						<!-- 시간 -->
						<div class="insert_box">
							<select>
								<option value="" selected>00:00</option>
							</select>
							<span>&nbsp;~&nbsp;</span>
							<select>
								<option value="" selected>24:00</option>
							</select>
						</div>
						
						<!-- 시간 -->
						<div class="redio_box">
							<span>성별</span>
							<div class="radio_box_radio">
								<input type="radio" value="1">
								<label>남성</label>
							</div>
							<div class="radio_box_radio">
								<input type="radio" value="2">
								<label>여성</label>
							</div>
							<div class="radio_box_radio">
								<input type="radio" value="3">
								<label>무관</label>
							</div>
						</div>
						
						<!-- 지역 -->
						<div class="insert_box">
							<span>지역</span>
							<div class="input-group">
								<input type="text" disabled="disabled"/>
								<button>
									<i class="bi bi-search"></i>
								</button>
							</div>
						</div>
						
						<!-- 장비 지참 필수 여부 -->
						<div class="redio_box">
							<span>장비 지참</span>
							<div class="radio_box_radio">
								<input type="radio" value="1">
								<label>Y</label>
							</div>
							<div class="radio_box_radio">
								<input type="radio" value="2">
								<label>N</label>
							</div>
						</div>
						
						<!-- 파티 소개 -->
						<div>
							<span>파티 소개</span>
							<div class="textarea_box">
								<textarea rows="3" cols="50"></textarea>
							</div>
						</div>
					</div>           
	            </form>
				<%--FORM CONTENT ENDS FROM HERE!!--%>
	            <%--FORM CONTENT STARTS FROM HERE!!--%>
	       		<%--FORM CONTENT ENDS FROM HERE!!--%>
	            </div>
            </div>
        </div>
    </main>
</div>