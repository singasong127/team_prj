<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<style>
	#modalCre {position: fixed;
		z-index: 999;
		top: 40%;
		margin: auto;
	}
</style>

<%--모달 생성--%>
<div class="modalBuild modalWindow" id="modalCre" style="display: none">
    <div class="modalHead">
        <h1>생성하기</h1>
        <a class="modalClose" onclick="$('#modalCre').css('display', 'none')"><span class="material-symbols-outlined">close</span></a>
    </div>
    <div class="modalBodyLong">
        <div class="formBox">
            <form>
                <div class="labelBox">
                    <label for="partyName">파티명</label>
                    <input id="partyName" placeholder="파티명"/>
                </div>
                <div class="labelBox">
                    <label for="partyNum">인원</label>
                    <select id="partyNum">
                        <option>::인원</option>
                    </select>
                    <label for="event">종목</label>
                    <select id="event">
                        <option>::종목</option>
                    </select>
                </div>
                <div class="labelBox">
                    <label for="time">시간</label>
                    <select id="time">
                        <option>17:00</option>
                    </select>
                    ~
                    <select>
                        <option>21:00</option>
                    </select>
                </div>
                <div class="labelBox">
                    <label>성별</label>
                    <label for="man">남</label>
                    <input type="checkbox" value="1" id="man">
                    <label for="woman">여</label>
                    <input type="checkbox" value="0" id="woman">
                </div>
                <div class="labelBox">
                    <div class="inputBox short">
                        <label for="srcGo">지역</label>
                        <input id="srcGo" name="shKey" class="searchInput short" type="text" value="<c:out value="${vo.shKey}"/>">
                        <span id="shMap" class="shortSpan material-symbols-outlined">search</span>
                    </div>
                </div>
                <div class="labelBox">
                    <label>장비</label>
                    <label for="y">필요</label>
                    <input type="radio" name="equip" value="1" id="y">
                    <label for="n">필요없음</label>
                    <input type="radio" name="equip" value="0" id="n">
                </div>
                <div class="textArea">
                    <label for="partyDesc">파티소개</label>
                    <textarea id="partyDesc"></textarea>
                </div>
            </form>
        </div>
    </div>
    <div class="modalFooter">
        <button class="modalOk">생성</button>
    </div>
</div>
<%--모달 생성--%>

<script type="text/javascript">

	$("#shMap").on("click", function() {
		
		location.href = "/findmap";
		
	});

</script>