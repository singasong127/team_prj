<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<header>
    <div class="headerBox">
        <div class="logo" onclick="location.href='/indexUsrView'" ><img src="/resources/team/img/logo.png" alt=""></div>
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
                        <a href="/partyApproved"><li>
                            참가 중
                        </li></a>
                        <a href="/partyPending"><li>
                            참가 신청
                        </li></a>
                        <a href="/partyEvaluate"><li>
                            참가 완료
                        </li></a>
                    </ul>

                </div>

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