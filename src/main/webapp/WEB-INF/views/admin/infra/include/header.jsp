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
		<div onclick="location.href=" class="outBtn">
			<span class="material-symbols-outlined">account_circle</span>
		</div>
		<div onclick="location.href=" class="outBtn">
			<span class="material-symbols-outlined">login</span>
		</div>
	</div>
</header>