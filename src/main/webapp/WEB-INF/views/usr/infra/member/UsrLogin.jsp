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
    	        			<input type="email" name="email" id="email" class="form-control" placeholder="email">
	            			<label for="email">이메일</label>
            			</div>
            			<div class="form-floating mb-3">

    	        			<input type="password" name="pwd" id="pwd" class="form-control"  placeholder="password">
	            			<label for="pwd">비밀번호</label>

            			</div>
            			
            			<div class="mb-3">
            				<button type="button" id="login" class="btn btn-success">로그인</button>
            				<button type="button" id="newJoin" class="btn btn-primary">회원가입</button>
            			</div>
            			
            			<div class="mb-5">
            				<p class="text-center">소셜 로그인</p>
            			</div>
            			
			<%--FORM CONTENT ENDS FROM HERE!!--%>
            		</form>
       		<%--FORM CONTENT ENDS FROM HERE!!--%>
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=adca34fb40e1d2e79631a91ac4c1b21f&redirect_uri=http://localhost/login/kakao&response_type=code">
					<img src="/resources/img/kakao_login_medium_narrow.png">
				</a>
				</div>
            </div>
        </div>
    </main>
</div>


<script type="text/javascript">
	/* Kakao.init('baaca73bb6f8db74471d98b723933ed6'); */
	
/* 	$("#kalogin").on("click", function(){
		 alert("작동"); 
		 Kakao.Auth.authorize({
		      redirectUri: 'http://localhost'
		      , scope : 'profile_nickname, account_email, gender'
		    }); 
	});
	 */
	$("#newJoin").on("click", function(){
		window.location.replace("/usrJoin");
	});
	
	$("#login").on("click", function(){
		
		if(vaild() == false )return false;		
	
		$.ajax({
			async : true
			, cache : false
			, type : "post"
			, url : "/usrLogin"
			, data :{
				"email" : $("#email").val(),
				"pwd" : $("#pwd").val()
			}
			, success : function(response){
				if(response.rt == "success"){
					location.href = "/";
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
		
		function checkNull(element, value, errorMessage){
			if(value === "" || value === null || value === undefined){
				alert(errorMessage);
				element.focus();
				return false;
			}
		}
		
		/* if(checkNull($("#email"), $.trim($("#email").val()), "이메일을 입력해주세요")) return false; */
		/* if(checkNull($("#pwd"), $.trim($("#pwd").val()), "비밀번호를 입력해주세요")) return false; */
		
	}
</script>
</body>
