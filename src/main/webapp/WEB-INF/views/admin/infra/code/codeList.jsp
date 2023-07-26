<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<%--<jsp:useBean id="CodeService" class="com.vandelay.app.infra.service.CodeService"/>--%>
<!DOCTYPE html>
<html lang="en">
<%@include file="../include/head.jsp"%>
<body>
<div>
    <%@include file="../include/header.jsp"%>
    <main>
        <div class="mainBox">
            <div class="mainContainer">
                <%--FORM CONTENT STARTS FROM HERE!!--%>
                <%--FORM CONTENT STARTS FROM HERE!!--%>
                <%--                <c:set var="codeService" value="${CodeService.selectListCachedCode('5')}"></c:set>--%>
                <%--                <c:forEach items="${codeService}" var="abc">--%>
                <%--                    <c:out value="${abc.name}"></c:out>--%>
                <%--                </c:forEach>--%>
                <div class="mainLabelBox">
                    <h2 class="tableLabel">공통코드 관리</h2>
                    <div class="addBox" onclick="location.href='/cdform'">
                        <h3 class="tableSubLabel">공통코드 추가</h3>
                        <span class="material-symbols-outlined">add_box</span></a>
                    </div>
                </div>
                <form name="search">
                    <input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
                    <input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
                    <div class="searchBox">

                        <select name="optDelNy">
                            <option value="">삭제여부</option>
                            <option value="1">삭제</option>
                            <option value="0">미삭제</option>
                        </select>
                        <div class="inputBox">
                            <input id="srcGo" name="shKey" class="short searchInput" type="text" value="<c:out value="${vo.shKey}"/>">
                            <span id="magGlass"class="material-symbols-outlined">search</span>
                        </div>
                    </div>
                </form>
                <div class="tableBox">
                    <table>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>분류코드</th>
                            <th>코드이름</th>
                            <th></th>
                            <th>삭제여부</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${fn:length(list) eq 0}">
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><h4 id="nodata">There is no data!</h4></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </c:when>
                            <c:otherwise>

                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
                <%--pagination include--%>
                <%--pagination include--%>
                <c:choose>
                    <c:when test="${vo.totalPages eq 1}">

                    </c:when>
                    <c:otherwise>

                        <%@include file="../include/pagination.jsp"%>

                    </c:otherwise>
                </c:choose>
                <%--pagination include--%>
                <%--pagination include--%>


                <%--FORM CONTENT ENDS FROM HERE!!--%>
                <%--FORM CONTENT ENDS FROM HERE!!--%>
            </div>
        </div>
    </main>
</div>

</body>
<script type="text/javascript">
    <%--pagination js function--%>
    <%--pagination js function--%>

    goList = function(thisPage) {
        if(thisPage == 0) {

            $("input:hidden[name=thisPage]").val(1);
            $("form[name=search]").attr("action", "/codeList/list").submit();

        } else if(thisPage > ${vo.totalPages}){

            $("input:hidden[name=thisPage]").val(thisPage - 1);
            $("form[name=search]").attr("action", "/codeList/list").submit();
        }else{

            $("input:hidden[name=thisPage]").val(thisPage);
            $("form[name=search]").attr("action", "/codeList/list").submit();

        }
    }
    <%--pagination js function--%>
    <%--pagination js function--%>

</script>
</html>