<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<header>
    <div class="headerBox">
        <div class="logo" onclick="location.href='#'" ><img src="resources/team/img/logo.png" alt=""></div>
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
                            <a href="#"><li>
                                참가신청한 파티
                            </li></a>
                            <a href="#"><li>
                                참가중인 파티
                            </li></a>
                        </ul>
                </div>

                <div class="navListBox">
                    <a class="itemBox" href="#">
                        <li>
                            재료관리
                        </li>
                    </a>
                    <ul class="subNavList">
                        <a href="#"><li>
                            재료코드
                        </li></a>
                        <a href="#"><li>
                            재료코드그룹
                        </li></a>
                    </ul>
                </div>
                <div class="navListBox">
                <a class="itemBox" href="#"><li>레시피관리</li></a>
	                <ul class="subNavList">
	                	<a href="#">
	                		<li>
	                			레시피코드
	                		</li>
	                	</a>
	                </ul>
                </div>
                <a class="itemBox" href="#"><li>멤버관리</li></a>
                <a class="itemBox" href="#"><li>조리도구관리</li></a>
                <a class="itemBox" href="#"><li>테마관리</li></a>
            </ul>
        </div>
                    <div onclick="location.href='/LoginPage'" class="outBtn">
                        <span class="material-symbols-outlined">login</span>
                    </div>
    </div>
</header>