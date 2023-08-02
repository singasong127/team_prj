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
            <%--FORM CONTENT STARTS FROM HERE!!--%>
            		<h3>로그인</h3>
            		<form>
            			<div class="form-floating mb-3">
    	        			<input type="email" name="email" class="form-control" id="floatingInput" placeholder="email">
	            			<label for="floatingInput">이메일</label>
            			</div>
            			<div class="form-floating mb-3">

    	        			<input type="password" name="pwd" class="form-control" id="floatingPassword" placeholder="password">
	            			<label for="floatingPassword">비밀번호</label>

            			</div>
            			
            			<div class="mb-3">
            				<button type="button" id="login" class="btn btn-success">로그인</button>
            				<button type="button" id="newJoin" class="btn btn-primary">회원가입</button>
            			</div>
            			
			<%--FORM CONTENT ENDS FROM HERE!!--%>
            		</form>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
				</div>
            </div>
        </div>
    </main>
</div>

<script type="text/javascript">
	var login = ${"form[name='login']"};
	
	$("#newJoin").on("click", function(){
		widow.location.replace("/usr_jonin");
	});
	
	
	
	$("#login").on("click", function(){
		
		if(vaild() == false )return false;		
	
		$.ajax({
			async : true
			, cache : false
			, type : "post"
			, url : "/memberJoin"
			, data :{
				"email" : $("#email").val()
				"pwd" : $("#pwd").val()
			}
			, success : function(response){
				if(response.rt == "success"){
					location.herf = "/";
				}else{
					alert("회원정보가 일치하지 않습니다.");
				}
			}
			, error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	});
	
	vaild = function(){
		
		function checkNull(element, value, errotMessage){
			if(){
				alert(errotMessage);
				element.focus();
				return false;
			}
		}
		
		if(checkNull($("#email"), $.trim($("#email").val()), "이메일을 입력해주세요")) return false;
		if(checkNull($("#pwd"), $.trim($("#pwd").val()), "이메일을 입력해주세요")) return false;
		
	}

</script>
</body>
