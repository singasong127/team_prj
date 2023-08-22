<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<header>
    <div class="headerBox">
        <div class="logo" onclick="location.href='/'" ><img src="/resources/img/logo.png" alt=""></div>
        <div class="nav">
            <div class="curtain"></div>
            <ul class="navList">
                <div class="navListBox">
                    <a class="itemBox" href="#">
                        <li>
                            파티
                        </li>
                    </a>
                    <ul class="subNavList">
                        <a style="display:block; width: 100%; text-decoration: none; margin: 0 15px;" href="#">
                            <li style="margin: 0 15px">
                            참가신청한 파티
                        </li></a>
                        <a style="display: block; width: 100%; text-decoration: none; margin: 0 15px; " href="#">
                            <li>
                                참가중인 파티
                            </li>
                        </a>
                    </ul>
                </div>

            </ul>
        </div>
        <c:choose>
        	<c:when test="${not empty sessionId}">
                <c:choose>
                    <c:when test="${empty sessionProfilePath}">
                        <div class="dropdown">
                            <a id="headerProfile" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img style="object-fit: cover; align-self: center" id="uploadImgProfilePreview" src="/resources/img/defaultProfile.png" class="rounded-circle d-block" width="68" height="68">
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" onclick="location.href='/memberOne?seq=<c:out value='${sessionSeq}'/>'">내 정보</a></li>
                                <li><a class="dropdown-item" onclick="location.href='/usrLogout'">로그아웃</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="dropdown">
                            <a id="headerProfile" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img style="object-fit: cover; align-self: center" id="uploadImgProfilePreview" src="<c:out value="${sessionProfilePath}"/><c:out value="${sessionProfileName}"/>" class="rounded-circle d-block" width="68" height="68">
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" onclick="location.href='/memberOne?seq=<c:out value='${sessionSeq}'/>'">내 정보</a></li>
                                <li><a class="dropdown-item" onclick="location.href='/usrLogout'">로그아웃</a></li>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
        	</c:when>
	        <c:otherwise>
		        <div onclick="location.href='/LoginPage'" class="outBtn">
	    	        <span class="material-symbols-outlined">login</span>
	    	    </div>
	        </c:otherwise>
        </c:choose>
    </div>
</header>