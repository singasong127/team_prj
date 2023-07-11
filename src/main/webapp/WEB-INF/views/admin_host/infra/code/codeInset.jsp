<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html lang="kr">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>테이블</title>

    <!-- Custom fonts for this template -->
    <link href="resources/vender/project_nsa/admin_host/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/project_nsa/admin_host/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="resources/vender/project_nsa/admin_host/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    <!-- custom font awesome -->
   	<script src="https://kit.fontawesome.com/e402926c7b.js" crossorigin="anonymous"></script>

</head>

<body id="page-top">
	
	 <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@include file="../../include/sidebar.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@include file="../../include/header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">CordList</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div>
                    <!-- Content Row -->
                    <div class="row">
						<form name="formTarget" method="post"
                        	class="d-none d-sm-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        	
                        	<div class="col-auto mb-3">
                        		<!-- 코드 일련 번호 -->
                        		<div class="input-group">
                        			<span class="input-group-text">코드 일련번호</span>
	                            	<input type="text" name="code_id" id="code_id" class="form-control bg-white border-0 small" 
    	                           	 aria-label="Search" aria-describedby="basic-addon2" placeholder="코드 일련번호를 정하세요">
                        		</div>
                               	 
                               	 <!-- 코드명 -->
                               	 <div class="input-group mt-3">
    								<span class="input-group-text">코드 명</span>                           	 
	                            	<input type="text" name="code_value" id="code_value" class="form-control bg-white border-0 small" 
   	                            	 aria-label="Search" aria-describedby="basic-addon2" placeholder="코드이름을 적으세요">
                               	 </div>
                            	
                            	<!-- 코드에 대한 상세 설명 -->
                            	<div class="input-group mt-3">
	                            	<span class="input-group-text">코드 설명</span>
	                            	<textarea name="code_description" id="code_description" lass="form-control bg-white border-0 small" placeholder="자신의 의견을 간단히 적어주세요.">	                               	 </textarea>
                            	</div>
                            	
                            	<!-- 코드 정렬 순서 -->
                            	<div class="input-group mt-3">
                            		<span class="input-group-text">정렬순서</span>
	                            	<input type="text" name="sort" id="sort" class="form-control bg-white border-0 small" 
    	                           	 aria-label="Search" aria-describedby="basic-addon2" placeholder="정렬순서를 정해주세요">
                            	</div>
                            	
                            	<!-- 소속 코드그룹 -->
                            	<div class="input-group mt-3">
                            		<span class="input-group-text">코드그룹 번호</span>
	                            	<input type="text" name="codeGroup_seq" id="codeGroup_seq" class="form-control bg-white border-0 small" 
	                               	 aria-label="Search" aria-describedby="basic-addon2" placeholder="코드를 넣어야 할 코드그룹 번호를 작성하세요">
                            	</div>
                       		 </div>
							 <div class="col-auto mb-4">
							 	<button type="button" id="create">저장</button>
							 </div>                     		 
                    	</form>
                    </div>
            <!-- End of Main Content -->
            
            <!-- Footer -->
            <%@include file="../../include/footer.jsp" %>

        </div>
        <!-- End of Content Wrapper -->
    </div>
  </div>
   </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

	
	

<!-- Bootstrap core JavaScript-->
    <script src="resources/vender/project_nsa/admin_host/jquery/jquery.min.js"></script>
    <script src="resources/vender/project_nsa/admin_host/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vender/project_nsa/admin_host/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/project_nsa/admin_host/sb-admin-2.min.js"></script>
	
	<!-- 유효성검사 -->
    <script src="resources/js/project_nsa/admin_host/vaildation.js"></script>
    
    <script type="text/javascript">
    
    	var form = $("form[name='formList']");
    	var target = $("form[name='formTarget']");
    	var objVal = $("#code_value");
    	var objDec = $("#code_description");
    	
    	$("#btn").on("click",function(){
    		/* 자기 자신을 다시한번 호출을 해준다. */
    		form.attr("method", "post");
    		form.attr("action", "/codeForm").submit();
//    		alert("Nothing say anyone");
    	});
    	
    	vaildationInst = function(){
    		if(vaildationUpdt() == false) return false;
    	}
    	
    	vaildationUpdt = function(){
    		if(check(objVal) == false) return false;
    		if(check(objDec) == false) return false;
    	}
    	    	
    	$("#create").on("click",function(){
    		if($.trim($("#code_id").val()) == "" || $.trim($("#code_id").val()) == null ){
    			alert("코드 일련번호를 적으셔야합니다.");
    			$("#code_id").focus();
    		}else if(vaildationInst() == false){
    			return false;
    		}else if($.trim($("#sort").val()) == "" || $.trim($("#sort").val()) == null){
    			alert("순서가 몇번인가요?");
    			$("#sort").focus();
    		}else if($.trim($("#codeGroup_seq").val()) == "" || $.trim($("#codeGroup_seq").val()) == null ){
    			alert("이 코드는 어디 코드그룹에 속해 있나요?");
    			$("#codeGroup_seq").focus();
    		}else{
	    		target.attr("action", "/codeInsert").submit();
    		}
    		
    	});
    	
    </script>
          
</body>

</html>