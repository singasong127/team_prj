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
            	<div class="text-center mx-auto w-25">
            <%--FORM CONTENT STARTS FROM HERE!!--%>
            		<h3>로그인</h3>
            <%--FORM CONTENT STARTS FROM HERE!!--%>
            		<form>
            			<div class="form-floating mb-3">
    	        			<input type="email" name="" class="form-control" id="floatingInput">
	            			<label for="floatingInput">이메일</label>
            			</div>
            			<div class="form-floating mb-3">
    	        			<input type="password" name="" class="form-control" id="floatingInput">
	            			<label for="floatingInput">비밀번호</label>
            			</div>
            			
            			<div class="mb-3">
            				<button type="button" class="btn btn-success">로그인</button>
            				<button type="button" class="btn btn-secondary">취소</button>
            			</div>
            			
            			<a href="#">비밀번호를 잊어버렸나요?</a><br>
            			<a href="/usr_jonin">계정이 없으시면 회원가입!</a>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
            		</form>
            	</div>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
				</div>
            </div>
        </div>
    </main>
</div>