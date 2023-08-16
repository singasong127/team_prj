<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<header>
    <div class="headerBox">

        <div class="logo" onclick="location.href='/indexUsrView'" ><img src="/resources/img/logo.png" alt=""></div>
        <div class="nav">
            <div class="curtain"></div>
            <ul class="navList">
                <div class="navListBox">
                    <a class="itemBox" href="#">
                        <li>
                            공통코드관리
                        </li>
                    </a>
                    <ul class="subNavList">
                        <a href="/codeList"><li>
                            공통코드
                        </li></a>
                        <a href="/cglist"><li>
                            공통코드그룹
                        </li></a>
                    </ul>
				</div>
                <a class="itemBox" href="/memberList">
                    <li>
                        멤버 관리
                    </li>
                </a>
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