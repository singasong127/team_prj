<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<header>
    <div class="headerBox">
        <div class="logo" onclick="location.href='#'" ><img src="/resources/img/logo.png" alt=""></div>
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
        <div onclick="location.href='/LoginPage'" class="outBtn">
            <span class="material-symbols-outlined">login</span>
        </div>
    </div>
</header>