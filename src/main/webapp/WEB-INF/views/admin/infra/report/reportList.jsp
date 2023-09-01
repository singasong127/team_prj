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
          		<h2 class="tableLabel">신고내용 관리</h2>
           	</div>
           	<form name="">
           		<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
                <input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
                <div class = "searchBox">
                	<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
                    <input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
                    
                </div>
           	</form>
           	<div class="tableBox">
           		<table>
           			<thead>
           				<tr>
           					<th>신고번호</th>
           					<th>신고분류</th>
           					<th>신고자</th>
           					<th>피신고자</th>
           					<th>신고 제목</th>
           					<th>삭제</th>
           					<th>신고내용</th>
           					<th>신고날짜</th>
           					<th>상세보기</th>
           				</tr>
           			</thead>
           			<tbody>
           				<c:choose>
           					<c:when test="${fn:length(list) eq 0 }">
           						<tr>
                                    <td></td>
                                    <td></td>
                                    <td><h4 id="nodata">신고 접수된게 없네요..</h4></td>
                                    <td></td>
                                    <td></td>
                                </tr>
           					</c:when>
           					<c:otherwise>
           						<c:forEach items="${list}" var="list" varStatus="status">
           							<tr>
           								<td><c:out value="${list.seq }"/></td>
           								<td><c:out value="${list.type }"/></td>
           								<td><c:out value="${list.actor }"/></td>
           								<td><c:out value="${list.actee }"/></td>
           								<td><c:out value="${list.reason }"/></td>
           								<td><c:out value="${list.delNy }"/></td>
           								<td><c:out value="${list.reportDesc }"/></td>
           								<td><c:out value="${list.datetime }"/></td>
           								<td>
           									<button class="detailBtn" onclick="location.href='/reportView?seq=<c:out value = '${list.seq}'/>'">
												상세
											</button>
           								</td>
           							</tr>
           						</c:forEach>
           					</c:otherwise>
           				</c:choose>
           			</tbody>
           		</table>
           	</div>
           	<c:choose>
           		<c:when test="${vo.totalPages eq 1 }">
           		
           		</c:when>
	           	<c:otherwise>
	           		<%@include file="../include/pagination.jsp" %>
	           	</c:otherwise>
           	</c:choose>
         </div>
    </div>
</body>
<script type="text/javascript">
    <%--pagination js function--%>
    <%--pagination js function--%>

    goList = function(thisPage) {
        if(thisPage == 0) {

            $("input:hidden[name=thisPage]").val(1);
            $("form[name=search]").attr("action", "/codeList").submit();

        } else if(thisPage > ${vo.totalPages}){

            $("input:hidden[name=thisPage]").val(thisPage - 1);
            $("form[name=search]").attr("action", "/codeList").submit();
        }else{

            $("input:hidden[name=thisPage]").val(thisPage);
            $("form[name=search]").attr("action", "/codeList").submit();

        }
    }
    <%--pagination js function--%>
    <%--pagination js function--%>

</script>
</html>