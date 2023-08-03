<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>


<%--Paging sources--%>
<%--Paging sources--%>
<%--Paging sources--%>
<div class="pagination">
    <ul class="pagination_ul">
        <%--pageNum Next button when startpage is GREATER than pageNumToShow--%>
        <%--pageNum Next button when startpage is GREATER than pageNumToShow--%>

        <c:if test="${vo.startPage gt vo.pageNumToShow}">
            <li class="nextPage">
                <a class="liBox" href="javascript:goList(${vo.startPage - 1})">
                    <span class="material-symbols-outlined">keyboard_double_arrow_left</span>
                </a>
            </li>
        </c:if>

        <%--pageNum Next button when startpage is GREATER than pageNumToShow--%>
        <%--pageNum Next button when startpage is GREATER than pageNumToShow--%>

        <%--Move to Previous Page--%>
        <%--Move to Previous Page--%>
        <c:choose>
            <c:when test="${vo.thisPage ne 1}">
                <li class="nextPage">
                    <a class="liBox" href="javascript:goList(${vo.thisPage - 1})">
                        <span class="material-symbols-outlined">chevron_left</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <%--if thisPage == 1, arrow disappears--%>
            </c:otherwise>
        </c:choose>
        <%--Move to Previous Page--%>
        <%--Move to Previous Page--%>


        <c:forEach begin="${vo.startPage}" end="${vo.endPage}" varStatus="i">
            <c:choose>
                <c:when test="${i.index eq vo.thisPage}">
                    <li class="nextPage active"><a style="color: rgba(255, 16, 16, 0.49);" class="liBox" href="javascript:goList(${i.index})">${i.index}</a></li>
                </c:when>
                <c:otherwise>
                    <li class="nextPage"><a class="liBox" href="javascript:goList(${i.index})">${i.index}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <%--Move to Next Page--%>
        <%--Move to Next Page--%>
        <c:choose>
            <c:when test="${vo.thisPage ne vo.totalPages}">
                <li class="nextPage">
                    <a class="liBox" href="javascript:goList(${vo.thisPage + 1})">
                        <span class="material-symbols-outlined">chevron_right</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <%--if thisPage == totalPages, arrow disappears--%>
            </c:otherwise>
        </c:choose>
        <%--Move to Next Page--%>
        <%--Move to Next Page--%>

        <%--pageNum Next button when startpage is GREATER than pageNumToShow--%>
        <%--pageNum Next button when startpage is GREATER than pageNumToShow--%>
        <c:if test="${vo.endPage ne vo.totalPages}">
            <li class="nextPage">
                <a class="liBox" href="javascript:goList(${vo.endPage + 1})">
                    <span class="material-symbols-outlined">keyboard_double_arrow_right</span>
                </a>
            </li>
        </c:if>
        <%--pageNum Next button when startpage is GREATER than pageNumToShow--%>
        <%--pageNum Next button when startpage is GREATER than pageNumToShow--%>

        <!-- <li class="page-item"><a class="page-link" href="#"><i class="fa-solid fa-angles-right"></i></a></li> -->
    </ul>
</div>
<%--Paging sources--%>
<%--Paging sources--%>
<%--Paging sources--%>