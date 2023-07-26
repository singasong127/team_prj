<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%--모달 생성--%>
<div class="modalBuild modalWindow">
    <div class="modalHead">
        <h1>파티 정보</h1>
        <a class="modalClose"><span class="material-symbols-outlined">close</span></a>
    </div>
    <div class="modalBodyLongInfo">
        <div class="formBoxInfo">
            <form>
                <div class="labelBox">
                    <label for="partyName">파티명</label>
                    <input id="partyName" placeholder="" value="러닝팟 구합니다" disabled/>
                </div>
                <div class="labelBox">
                    <label for="partyNum">인원</label>
                    <select id="partyNum" disabled>
                        <option>6명</option>
                    </select>
                    <label for="event">종목</label>
                    <select id="event" disabled>
                        <option>러닝</option>
                    </select>
                </div>
                <div class="labelBox">
                    <label for="time">시간</label>
                    <select id="time" disabled>
                        <option>17:00</option>
                    </select>
                    ~
                    <select disabled>
                        <option>21:00</option>
                    </select>
                </div>
                <div class="labelBox">
                    <label>성별</label>
                    <label for="man">남</label>
                    <input checked disabled type="checkbox" value="1" id="man">
                    <label for="woman">여</label>
                    <input disabled type="checkbox" value="0" id="woman">
                </div>
                <div class="labelBox">
                    <div class="inputBox short">
                        <label for="srcGo">지역</label>
                        <input id="srcGo" name="shKey" class="searchInput short" type="text" value="구래동 체육관">
                        <span id="magGlass"class="shortSpan material-symbols-outlined">search</span>
                    </div>
                </div>
                <div class="labelBox">
                    <label>장비</label>
                    <label for="y">필요</label>
                    <input disabled type="radio" name="equip" value="1" id="y">
                    <label for="n">필요없음</label>
                    <input disabled checked type="radio" name="equip" value="0" id="n">
                </div>
                <div class="textArea">
                    <label for="partyDesc">파티소개</label>
                    <textarea id="partyDesc" disabled>안녕하세요 &#10; 우사인볼트를 찾고있습니다. &#10;달리기를 배우고 싶습니다..&#10;구래동에서 우사인볼트를 보신 분은 저에게 DM 해주세요.</textarea>
                </div>
            </form>
        </div>
        <div class="partyInfoImgBox">
            <h3>파티 위치</h3>
            <div class="partyInfoImg">
                <img src="/resources/team/img/kakaoMap.png"/>
            </div>
        </div>


    </div>
    <div class="modalFooter">
        <button class="modalBad">나가기</button>
    </div>
</div>
<%--모달 생성--%>