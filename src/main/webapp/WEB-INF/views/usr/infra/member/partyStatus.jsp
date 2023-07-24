<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="kr">
<%@include file="../include/head.jsp"%>
<body>
	<div>
		<%@include file="../include/header.jsp"%>
		<main>
			<div class="mainBox">
				<div class="mainContainer">
					<%--FORM CONTENT STARTS FROM HERE!!--%>
					<%--FORM CONTENT ENDS FROM HERE!!--%>

					<%--FORM CONTENT STARTS FROM HERE!!--%>
					<!-- 채팅창과 파티 스테이터스 -->

					<!-- 채팅창 -->
					<div class="pc">
						<!-- 0213 참여자 제한 팝업 start -->
						<div id="entry" class="popup_dim">
							<div class="entry_wrap">
								<div class="entry_title">알림</div>
								<div class="entry_contentswrap">
									<div class="entry_form id">
										<label for="id">아이디</label> <input type="text" id="id">
									</div>
									<div class="entry_form pw">
										<label for="pw">비밀번호</label> <input type="password" id="pw">
									</div>
									<div class="entry_contents_subtitle">올바른 형식이 아닙니다. 다시
										입력해주세요.</div>
								</div>
								<div class="entry_btnwrap">
									<button class="submit">확인</button>
									<button class="cancel">취소</button>
								</div>
							</div>
						</div>
						<!-- 0213 참여자 제한 팝업 end -->
						<article class="header">
							<ul>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</article>

						<article class="contents">

							<!-- 파티 스테이터스 -->
							<div class="chat">
								<div class="pb-2 bg-white">
									<div class="party_name d-flex justify-content-between">
										<h5 class="text-white my-1">참여자 명단</h5>
										<span class="text-white ">@ / 10 명</span>
										<!-- DB 연결하면 c:out으로 넣는걸로. -->
									</div>
									<div class="chat_field overflow-y-auto">
										<div class="col-auto">

											<div class="d-flex justify-content-evenly my-3">
												<!-- 프로필 사진 -->
												<div class="col-3">
													<div class="">
														<img src="resources/images/myFortFolio/person_2.jpg"
															alt="Image" class="img-fluid"
															style="width: 100px; height: 100px;">
													</div>
												</div>
												<!-- 프로필 -->
												<div class="col-6">
													<p>닉네임 :</p>
													<p>이메일 :</p>
													<p>&nbsp;&nbsp; 성별 :</p>
												</div>
											</div>
											<div class="d-flex justify-content-evenly mb-3">
												<!-- 프로필 사진 -->
												<div class="col-3">
													<div class="">
														<img src="resources/images/myFortFolio/person_2.jpg"
															alt="Image" class="img-fluid"
															style="width: 100px; height: 100px;">
													</div>
												</div>
												<!-- 프로필 -->
												<div class="col-6">
													<p>닉네임 :</p>
													<p>이메일 :</p>
													<p>&nbsp;&nbsp; 성별 :</p>
												</div>
											</div>
											<div class="d-flex justify-content-evenly mb-3 ">
												<!-- 프로필 사진 -->
												<div class="col-3">
													<div class="">
														<img src="resources/images/myFortFolio/person_2.jpg"
															alt="Image" class="img-fluid"
															style="width: 100px; height: 100px;">
													</div>
												</div>
												<!-- 프로필 -->
												<div class="col-6">
													<p>닉네임 :</p>
													<p>이메일 :</p>
													<p>&nbsp;&nbsp; 성별 :</p>
												</div>
											</div>
											<div class="d-flex justify-content-evenly mb-3 ">
												<!-- 프로필 사진 -->
												<div class="col-3">
													<div class="">
														<img src="resources/images/myFortFolio/person_2.jpg"
															alt="Image" class="img-fluid"
															style="width: 100px; height: 100px;">
													</div>
												</div>
												<!-- 프로필 -->
												<div class="col-6">
													<p>닉네임 :</p>
													<p>이메일 :</p>
													<p>&nbsp;&nbsp; 성별 :</p>
												</div>
											</div>
											<div class="d-flex justify-content-evenly mb-3 ">
												<!-- 프로필 사진 -->
												<div class="col-3">
													<div class="">
														<img src="resources/images/myFortFolio/person_2.jpg"
															alt="Image" class="img-fluid"
															style="width: 100px; height: 100px;">
													</div>
												</div>
												<!-- 프로필 -->
												<div class="col-6">
													<p>닉네임 :</p>
													<p>이메일 :</p>
													<p>&nbsp;&nbsp; 성별 :</p>
												</div>
											</div>
											<div class="d-flex justify-content-evenly mb-3 ">
												<!-- 프로필 사진 -->
												<div class="col-3">
													<div class="">
														<img src="resources/images/myFortFolio/person_2.jpg"
															alt="Image" class="img-fluid"
															style="width: 100px; height: 100px;">
													</div>
												</div>
												<!-- 프로필 -->
												<div class="col-6">
													<p>닉네임 :</p>
													<p>이메일 :</p>
													<p>&nbsp;&nbsp; 성별 :</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--파티 스테이터스 -->
							<!-- 채팅 영역 -->
							<div class="chat">
								<!-- 에러 표시 팝업 -->
								<div class="errorpopup">
									<p>
										<i class="fas fa-exclamation-circle"></i>
									</p>
									<p>시스템이 원활하지 않아 오류가 발생하였습니다. 잠시 후, 다시 참여해 주시기 바랍니다.</p>
									<a class="popupbtn" href="#!">닫기</a>
								</div>

								<div class="lock-room" style="display: none;">
									<div>
										<span>비번</span> <input type="text">
									</div>
									<div>
										<span>이메일</span> <input type="text">
									</div>
								</div>
								<!-- 에러 표시 팝업 끝 -->

								<!-- 커스텀 팝업 -->
								<div class="custompopup">
									<p>팝업</p>
									<a class="popupbtn" href="#!">확인</a><a class="popupbtn"
										href="#!">취소</a>
								</div>
								<!-- 커스텀 팝업 끝 -->

								<!-- 로그인 -->
								<div class="login">
									<p class="login-title">채팅방 설정</p>
									<div class="profile">
										<p>프로필 이미지</p>

										<div class="als-container" id="lista1">
											<span class="als-prev"><img
												src="img/profile/left_arrow.png" alt="prev" title="previous"
												width="100%" /></span>
											<div class="als-viewport">
												<div class="als-wrapper"></div>
											</div>
											<span class="als-next"><img
												src="img/profile/right_arrow.png" alt="next" title="next"
												width="100%" /></span>
										</div>
									</div>
									<div class="name">
										<label for="name">대화명</label> <input class="name" type="text"
											id="name" value="" placeholder="로그인 할 대화명을 입력 해주세요." />
									</div>
									<button class="popupbtn">확인</button>
								</div>
								<!-- 로그인 끝 -->
								<!-- 도움말 시작 -->
								<div class="use_help">
									<div class="help_contents">
										<ul class="help_title_wrap">
											<li class="help_title">메시지 보내기</li>
											<img src="img/help/001.png" class="help_img" width="100%" />
											<ol class="help_subtitle_wrap">
												<li>전송하실 메시지를 입력하고 <span class="btn_send">전송</span>을
													클릭하세요.
												</li>
											</ol>
										</ul>
										<ul class="help_title_wrap">
											<li class="help_title">이모지 및 이모티콘 보내기</li>
											<img src="img/help/002.png" class="help_img" width="100%" />
											<ol class="help_subtitle_wrap">
												<li>채팅 입력창 하단의 <span class="help_point"><i
														class="fas fa-laugh"></i></span> 을 클릭하시면 나타나는 목록에서 원하시는 이모지 또는
													이모티콘을 선택하세요.
												</li>
											</ol>
										</ul>
										<ul class="help_title_wrap">
											<li class="help_title">귓속말 보내기, 1:1 채팅하기, 신고하기</li>
											<img src="img/help/003.png" class="help_img" width="100%" />
											<ol class="help_subtitle_wrap">
												<li>원하시는 상대의 대화명을 클릭하세요.</li>
												<li>귓속말 보내기 : 팝업창에서 <span class="help_point"><i
														class="fa-regular fa-paper-plane"></i>귓속말 보내기</span> 하단의 입력창에 보내실
													메시지를 입력하고 <span>보내기</span>버튼을 클릭하세요.
												</li>
												<li>1:1 채팅하기 : 팝업창에서 <span class="help_point"><i
														class="fa-solid fa-comment"></i>1:1 채팅하기</span>를 클릭하시면 새로운 채팅창이
													나타납니다.
												</li>
												<li>신고하기 : 팝업창에서 <span class="help_point"><i
														class="fas fa-not-equal"></i> 신고하기</span>을 클릭하세요.
												</li>
											</ol>
										</ul>
										<ul class="help_title_wrap">
											<li class="help_title">비밀채팅</li>
											<img src="img/help/004.png" class="help_img" width="100%" />
											<ol class="help_subtitle_wrap">
												<li>상단의 채팅방 이름을 클릭하시면 현재 채팅중인 모든 대화상대의 목록이 나타납니다.</li>
												<li>대화상대 목록에서 비밀 채팅할 사용자를 선택하고 '<span
													class="help_point"><i
														class="fas fa-comments" aria-hidden="true"></i> 선택한 멤버들과
														비밀 채팅'</span>을 클릭하세요.
												</li>
											</ol>
										</ul>
										<ul class="help_title_wrap">
											<li class="help_title">초대하기</li>
											<img src="img/help/005.png" class="help_img" width="100%" />
											<ol class="help_subtitle_wrap">
												<li><span class="invitebtn"><i
														class="fa-solid fa-user-plus"></i>초대하기</span> 을 누르세요</li>
												<li>나타난 팝업창에서 전송 URL을 복사하거나 초대할 상대방의 이메일 주소를 입력한 후 URL을
													전송하세요.</li>
											</ol>
										</ul>
										<ul class="help_title_wrap">
											<li class="help_title">번역하기</li>
											<img src="img/help/006.png" class="help_img" width="100%" />
											<ol class="help_subtitle_wrap">
												<li>번역할 대화내용을 우클릭하세요.</li>
												<li>나타난 팝업창에서 번역할 언어를 선택하시면 번역된 대화내용이 나타납니다.</li>
											</ol>
										</ul>
									</div>
									<div class="btn_help_close">도움말 닫기</div>
								</div>
								<!-- 도움말 끝 -->
								<!-- 다운로드 진행상황 팝업 시작 -->
								<div class="downprogress_dim">
									<!-- 노출시 visibility 속성 변경 -->
									<div class="downprogress_wrap">
										<div class="downprogress_title">다운로드</div>
										<button class="close_ico">
											<i class="fa-solid fa-xmark"></i>
										</button>
										<div class="downprogress_content_wrap">
											<div class="downprogress_subtitle">선택한 파일을 저장하는 중입니다.</div>
											<div class="down_contents_count">
												<span class="current_contents">1</span><span
													class="contents_mid">/</span><span class="general_contents">1</span>
											</div>
											<progress value="10" min="0" max="100"
												class="downprogress_bar"></progress>
											<div class="contents_volume_wrap">
												<span class="current_volume">1MB</span>/<span
													class="general_volume">2MB</span>
											</div>
										</div>
										<button class="down_cancel_btn">취소</button>
									</div>
								</div>
								<!-- 다운로드 진행상황 팝업 끝 -->
								<!-- 파일 모아보기 시작 -->
								<div class="gather-file-wrap">
									<!-- 노출 시 CSS display:block 로 수정-->
									<div class="gather-file-subwrap">
										<div class="file-menu gather-image">
											<span>사진</span>
										</div>
										<div class="file-content-wrap image-wrap">
											<ul class="file-preview-list">
												<li class="file-preview-image"><img
													src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
												</li>
												<li class="file-preview-image"><img
													src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
												</li>
												<li class="file-preview-image"><img
													src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
												</li>
												<li class="file-preview-image"><img
													src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
												</li>
												<li class="file-preview-image"><img
													src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
												</li>
												<li class="file-preview-image"><img
													src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
												</li>
												<li class="file-preview-image"><img
													src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
												</li>
												<li class="file-preview-image"><img
													src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
												</li>
											</ul>
											<ul class="file-selet-count-wrap">
												<li class="file-selet-count"><i
													class="fa-solid fa-circle-xmark"></i> <span
													class="select-count">0</span><span>개 선택</span></li>
												<li class="file-down-btn"><i
													class="fa-solid fa-download"></i></li>
											</ul>
										</div>
										<div class="file-menu gather-vod">
											<span>동영상</span>
										</div>
										<div class="file-content-wrap vod-wrap">
											<ul class="file-preview-list">
												<li class="file-preview-file">
													<div class="gather-video-wrap">
														<p class="gather-file-icon">
															<i class="fa-solid fa-video"></i>
														</p>
														<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
														<p class="gather-file-date">
															유효기간<span>2022-05-03</span>
														</p>
														<p class="gather-file-size">15.87KB</p>
													</div>
												</li>
												<li class="file-preview-file">
													<div class="gather-video-wrap">
														<p class="gather-file-icon">
															<i class="fa-solid fa-video"></i>
														</p>
														<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
														<p class="gather-file-date">
															유효기간<span>2022-05-03</span>
														</p>
														<p class="gather-file-size">15.87KB</p>
													</div>
												</li>
												<li class="file-preview-file">
													<div class="gather-video-wrap">
														<p class="gather-file-icon">
															<i class="fa-solid fa-video"></i>
														</p>
														<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
														<p class="gather-file-date">
															유효기간<span>2022-05-03</span>
														</p>
														<p class="gather-file-size">15.87KB</p>
													</div>
												</li>
												<li class="file-preview-file">
													<div class="gather-video-wrap">
														<p class="gather-file-icon">
															<i class="fa-solid fa-video"></i>
														</p>
														<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
														<p class="gather-file-date">
															유효기간<span>2022-05-03</span>
														</p>
														<p class="gather-file-size">15.87KB</p>
													</div>
												</li>
											</ul>
											<ul class="file-selet-count-wrap">
												<li class="file-selet-count"><i
													class="fa-solid fa-circle-xmark"></i> <span
													class="select-count">0</span><span>개 선택</span></li>
												<li class="file-down-btn"><i
													class="fa-solid fa-download"></i></li>
											</ul>
										</div>
										<div class="file-menu gather-file">
											<span>파일</span>
										</div>
										<div class="file-content-wrap file-wrap">
											<ul class="file-preview-list">
												<li class="file-preview-file">
													<div class="gather-video-wrap">
														<p class="gather-file-icon">
															<i class="fa-solid fa-video"></i>
														</p>
														<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
														<p class="gather-file-date">
															유효기간<span>2022-05-03</span>
														</p>
														<p class="gather-file-size">15.87KB</p>
													</div>
												</li>
												<li class="file-preview-file">
													<div class="gather-video-wrap">
														<p class="gather-file-icon">
															<i class="fa-solid fa-video"></i>
														</p>
														<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
														<p class="gather-file-date">
															유효기간<span>2022-05-03</span>
														</p>
														<p class="gather-file-size">15.87KB</p>
													</div>
												</li>
												<li class="file-preview-file">
													<div class="gather-video-wrap">
														<p class="gather-file-icon">
															<i class="fa-solid fa-video"></i>
														</p>
														<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
														<p class="gather-file-date">
															유효기간<span>2022-05-03</span>
														</p>
														<p class="gather-file-size">15.87KB</p>
													</div>
												</li>
												<li class="file-preview-file">
													<div class="gather-video-wrap">
														<p class="gather-file-icon">
															<i class="fa-solid fa-video"></i>
														</p>
														<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
														<p class="gather-file-date">
															유효기간<span>2022-05-03</span>
														</p>
														<p class="gather-file-size">15.87KB</p>
													</div>
												</li>
												<li class="file-preview-file">
													<div class="gather-video-wrap">
														<p class="gather-file-icon">
															<i class="fa-solid fa-video"></i>
														</p>
														<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
														<p class="gather-file-date">
															유효기간<span>2022-05-03</span>
														</p>
														<p class="gather-file-size">15.87KB</p>
													</div>
												</li>
												<li class="file-preview-file">
													<div class="gather-video-wrap">
														<p class="gather-file-icon">
															<i class="fa-solid fa-video"></i>
														</p>
														<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
														<p class="gather-file-date">
															유효기간<span>2022-05-03</span>
														</p>
														<p class="gather-file-size">15.87KB</p>
													</div>
												</li>
												<li class="file-preview-file">
													<div class="gather-video-wrap">
														<p class="gather-file-icon">
															<i class="fa-solid fa-video"></i>
														</p>
														<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
														<p class="gather-file-date">
															유효기간<span>2022-05-03</span>
														</p>
														<p class="gather-file-size">15.87KB</p>
													</div>
												</li>
											</ul>
											<ul class="file-selet-count-wrap">
												<li class="file-selet-count"><i
													class="fa-solid fa-circle-xmark"></i> <span
													class="select-count">0</span><span>개 선택</span></li>
												<li class="file-down-btn"><i
													class="fa-solid fa-download"></i></li>
											</ul>
										</div>
									</div>
									<div class="btn_gather_close">파일서랍 닫기</div>
								</div>
								<script>
									$('.chat > .gather-file-wrap .file-menu')
											.click(
													function() {
														$(this)
																.next(
																		'.chat > .gather-file-wrap .file-content-wrap')
																.stop()
																.slideToggle(
																		300);
														$(this).toggleClass(
																'on')
																.siblings()
																.removeClass(
																		'on');
														$(this)
																.next(
																		'.chat > .gather-file-wrap .file-content-wrap')
																.siblings(
																		'.chat > .gather-file-wrap .file-content-wrap')
																.slideUp(300); // 1개씩 펼치기
													});
									$('.chat > .gather-file-wrap .file-menu')
											.first().trigger('click');
								</script>
								<!-- 파일 모아보기 끝 -->
								<div class="chat_field1">
									<!-- 채팅 시작 -->
									<div class="chat_field" id="chat">
										<div class="chat_name">
											<ul>
												<li id="chat_room_name"></li>
												<li><a href="#!" class="help">도움말</a></li>
												<li><a href="#!" class="closebtn"><i
														class="fas fa-sign-out-alt closebtn"></i></a></li>
											</ul>
										</div>

										<!--채널 추가 팝업 시작-->
										<div class="channel-popup-dim">
											<!--대화상대 리스트 팝업 시작-->
											<!--노출 시 .active 추가-->
											<div class="chat-user-list-dim">
												<div class="chat-user-list-wrap">
													<div class="chat-user-list-title">
														<p>대화상대</p>
														<p>
															<i class="fas fa-times"></i>
														</p>
													</div>
													<div class="chat-user-list-contents">
														<ul class="chat-user-list">
															<li class="chat-user">
																<div class="invite-check">
																	<input type="checkbox" id="invite" /><label
																		for="invite"></label>
																</div>
																<div class="user-profile-img profile-1"></div>
																<div class="user-name">가나다라마바사아자차카타파하</div>
																<div class="language">번역안함</div>
																<div class="lang-btn-wrap">
																	<input type="checkbox" class="lang-btn" id="switch" />
																	<label for="switch" class="switch_label"> <span
																		class="onf_btn"></span>
																	</label>
																</div>
															</li>
														</ul>
													</div>
													<a href="#" class="chat-user-invite-btn"> <i
														class="fas fa-comments"></i>선택한 멤버들과 비밀 채팅
													</a>
												</div>
												<!--번역언어 선택 팝업 시작-->
												<div class="select-lang-dim">
													<div class="select-lang-wrap">
														<div class="select-lang-title">
															<p>번역 언어 선택</p>
															<p>
																<i class="fas fa-times"></i>
															</p>
														</div>
														<div class="select-lang-contents">
															<ul class="select-lang-list">
																<li class="select-lang"><input type="radio" checked />
																	<label>번역안함</label></li>
																<li class="select-lang"><input type="radio" /> <label>English</label>
																</li>
															</ul>
														</div>
														<a href="#" class="select-lang-btn">선택한 언어로 자동 번역하기</a>
													</div>
												</div>
												<!--번역언어 선택 팝업 끝-->
											</div>
											<!--대화상대 리스트 팝업 끝-->

											<!--초대장 팝업 시작-->
											<!--노출 시 .active 추가-->
											<div class="newchat-invite-dim">
												<div class="newchat-invite-wrap">
													<div class="newchat-invite-title">비밀 채팅 초대</div>
													<div class="newchat-invite-contents">
														<span class="invite-send">-</span>님이<br />비밀 채팅방으로
														초대하셨습니다.
													</div>
													<div class="newchat-invite-btn_wrap">
														<a href="#">수락</a> <a href="#">거절</a>
													</div>
												</div>
											</div>
											<!--초대장 팝업 끝-->
										</div>
										<!--채널 추가 팝업 끝-->

										<!-- 대화 내용 시작 -->
										<div class="chat_contents">
											<div id="content1">
												<!-- 채팅 노출 영역 끝-->

												<!-- 대화명 클릭 시 노출 팝업 시작 -->
												<div class="popupLayer">
													<div class="popup">
														<ul class="popup_content">
															<li class="ico_whisper"><a href="#!"><i
																	class="fa-regular fa-paper-plane"></i>귓속말 보내기</a>
																<div id="whisper">
																	<form onsubmit="return false">
																		<input type="text" name="message" />
																		<button>보내기</button>
																	</form>
																</div></li>
															<li><a href="#!"><i class="fa-solid fa-comment"></i>1:1
																	채팅하기</a></li>
															<li><a href="#!"><i class="fas fa-not-equal"></i>신고하기</a>
															</li>
														</ul>
													</div>
												</div>
												<!-- 대화명 클릭 시 노출 팝업 끝 -->
											</div>
										</div>
										<!-- 대화 내용 끝 -->

										<!-- 메시지 작성 시작 -->
										<div class="chat_scroll" style="display: none"></div>
										<div class="chat_input">
											<div class="chat-write-wrap">
												<div class="name"></div>
												<div class="textbox" id="content" maxlength="200"
													contenteditable="true" placeholder="메세지 입력하기"></div>
											</div>
											<!-- 이모지 및 이모티콘 영역 -->
											<div class="emoji-wrap">
												<!-- 이모지 탭 -->
												<div class="emoji_frame">
													<ul class="emoji-tab-wrap"></ul>
												</div>
											</div>
											<!-- 이모티콘 영역 끝-->
										</div>
										<!-- 메시지 작성 끝 -->

										<!-- 이모지 및 전송 버튼 시작 -->
										<div class="chat_input_btn">
											<ul class="emoji">
												<li><a href="#!" class="ico_emoji show"> <i
														class="fas fa-laugh"></i>
												</a></li>
												<li><a href="#!" class="ico_keyboard"> <i
														class="fas fa-keyboard"></i>
												</a></li>
											</ul>
											<div class="file">
												<a href="#!"> <!-- <i class="fas fa-file-arrow-up"></i> -->
													<i class="fa-solid fa-paperclip"></i>
												</a>
											</div>
											<ul class="send">
												<li><span class="counter" id="counter">0/0</span></li>
												<li class="btn_send"><a href="#!">전송</a></li>
											</ul>
										</div>

										<!-- 이모지 및 전송 버튼 끝 -->
									</div>
								</div>
								<!-- 채팅 끝 -->
						</article>

						<!-- 초대하기 팝업 시작-->
						<div class="invite-btn" style="display: block">
							<a href="#"><i class="fa-solid fa-user-plus"></i>초대하기</a>
						</div>

						<div class="invite-popup-wrap">
							<div class="url-copy">
								<p>접속URL</p>
								<form onsubmit="return false">
									<input readonly type="text" /> <label
										class="fa-regular fa-clone"></label>
								</form>
							</div>
							<div class="url-receive-user">
								<p>초대하기</p>
								<form onsubmit="return false">
									<input type="text" placeholder="이메일주소(,로 구분)" />
									<button>전송</button>
								</form>
							</div>
						</div>
						<!-- 초대하기 팝업 끝-->

						<!-- 비밀 채팅 시작 / 노출시 .active -->
						<div id="draggable" class="newchat-popup-wrap">
							<div class="newchat-popup-subwrap active">
								<!--비밀 채팅 팝업 시작 / 노출시 .active-->
								<div class="newchat-alret-dim active">
									<!--대화 상대 리스트 / 노출시 .active-->
									<div class="newchat-alret-wrap newchat-user-list active">
										<div class="chat-user-list-title">
											<p>대화상대</p>
											<p>
												<i class="fas fa-times"></i>
											</p>
										</div>
										<div class="chat-user-list-contents">
											<ul class="chat-user-list">
												<li class="chat-user">
													<div class="invite-check">
														<input type="checkbox" id="invite1" /><label
															for="invite1"></label>
													</div>
													<div class="user-profile-img profile-1"></div>
													<div class="user-name">가나다라마바사아자차카타파하</div>
													<div class="language">번역안함</div>
													<div class="lang-btn-wrap">
														<input type="checkbox" class="lang-btn" id="switch1" /> <label
															for="switch1" class="switch_label"> <span
															class="onf_btn"></span>
														</label>
													</div>
												</li>
											</ul>
										</div>
										<a href="#" class="chat-user-invite-btn"> <i
											class="fas fa-comments"></i>선택한 멤버들과 비밀 채팅
										</a>
									</div>
									<!--번역언어 선택 팝업 시작-->
									<div class="select-lang-dim">
										<div class="select-lang-wrap">
											<div class="select-lang-title">
												<p>번역 언어 선택</p>
												<p>
													<i class="fas fa-times"></i>
												</p>
											</div>
											<div class="select-lang-contents">
												<ul class="select-lang-list">
													<li class="select-lang"><input type="radio" checked />
														<label>번역안함</label></li>
													<li class="select-lang"><input type="radio" /> <label>English</label>
													</li>
												</ul>
											</div>
											<a href="#" class="select-lang-btn">선택한 언어로 자동 번역하기</a>
										</div>
									</div>
									<!--번역언어 선택 팝업 끝-->
									<!--대화상대 리스트 팝업 끝-->

									<!--채팅 종료 알림 / 노출시 .active-->
									<div class="newchat-alret-wrap out">
										<div class="newchat-alret-contents">
											<p class="newchat-alret-title">채팅방을 나가시겠습니까?</p>
											<p class="newchat-alret-subtitle">
												채팅방을 나가시면<br />대화 내용은 모두 삭제됩니다.
											</p>
										</div>
										<div class="newchat-alret-btn-wrap">
											<a class="newchat-alret-btn">나가기</a> <a
												class="newchat-alret-btn">취소</a>
										</div>
									</div>
									<!--채팅 폐쇄 알림(주최자) / 노출시 .active-->
									<div class="newchat-alret-wrap closing">
										<div class="newchat-alret-contents">
											<p class="newchat-alret-title">채팅방을 폐쇄하시겠습니까?</p>
											<p class="newchat-alret-subtitle">
												채팅방을 나가시면<br />대화 내용은 모두 삭제되고<br />모든 참여자의 채팅이 종료됩니다.
											</p>
										</div>
										<div class="newchat-alret-btn-wrap">
											<a class="newchat-alret-btn">확인</a> <a
												class="newchat-alret-btn">취소</a>
										</div>
									</div>
									<!--채팅 폐쇄 알림(참여자) / 노출시 .active-->
									<div class="newchat-alret-wrap end">
										<div class="newchat-alret-contents">
											<p class="newchat-alret-title">채팅이 종료되었습니다.</p>
											<p class="newchat-alret-subtitle">
												해당 채팅방은 종료되었습니다.<br />모든 대화 내용은 삭제됩니다.
											</p>
										</div>
										<div class="newchat-alret-btn-wrap">
											<a class="newchat-alret-btn">닫기</a>
										</div>
									</div>
									<!--채팅 초대 알림 / 노출시 .active-->
									<div class="newchat-alret-wrap invite">
										<div class="newchat-alret-contents">
											<p class="newchat-alret-title">비밀 채팅에 초대되었습니다.</p>
											<p class="newchat-alret-subtitle">
												<span class="send-chat">가나다라마바사아차카타파하</span>님의 초대를 수락하실 경우<br />현재
												참여중인 채팅은 종료됩니다.
											</p>
										</div>
										<div class="newchat-alret-btn-wrap">
											<a class="newchat-alret-btn">수락</a> <a
												class="newchat-alret-btn">거절</a>
										</div>
									</div>
								</div>
								<!--비밀 채팅 팝업 끝-->
								<div class="newchat-popup-title">
									<p>
										비밀 대화(<a class="chat-user-list_btn" href="#"><i
											class="fas fa-user"></i> 01</a>) <a class="gather-file_btn"
											href="#"><i class="fa-regular fa-folder-open"></i></a>
									</p>
									<p>
										<a href="#"><i class="fas fa-times"></i></a>
									</p>
								</div>
								<div class="newchat-popup-contents">
									<!-- 다운로드 진행상황 팝업 시작 -->
									<div class="newchat-downprogress_dim">
										<!-- 노출시 visibility 속성 변경 -->
										<div class="downprogress_wrap">
											<div class="downprogress_title">다운로드</div>
											<button class="close_ico">
												<i class="fa-solid fa-xmark"></i>
											</button>
											<div class="downprogress_content_wrap">
												<div class="downprogress_subtitle">선택한 파일을 저장하는 중입니다.</div>
												<div class="down_contents_count">
													<span class="current_contents">1</span><span
														class="contents_mid">/</span><span
														class="general_contents">1</span>
												</div>
												<progress value="10" min="0" max="100"
													class="downprogress_bar"></progress>
												<div class="contents_volume_wrap">
													<span class="current_volume">1MB</span>/<span
														class="general_volume">2MB</span>
												</div>
											</div>
											<button class="down_cancel_btn">취소</button>
										</div>
									</div>
									<!-- 다운로드 진행상황 팝업 끝 -->
									<!-- 파일 모아보기 시작 -->
									<div class="newchat-gather-file-wrap">
										<!-- 노출 시 CSS display:block 로 수정-->
										<div class="gather-file-subwrap">
											<div class="file-menu gather-image">
												<span>사진</span>
											</div>
											<div class="file-content-wrap image-wrap">
												<ul class="file-preview-list">
													<li class="file-preview-image"><img
														src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
													</li>
													<li class="file-preview-image"><img
														src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
													</li>
													<li class="file-preview-image"><img
														src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
													</li>
													<li class="file-preview-image"><img
														src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
													</li>
													<li class="file-preview-image"><img
														src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
													</li>
													<li class="file-preview-image"><img
														src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
													</li>
													<li class="file-preview-image"><img
														src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
													</li>
													<li class="file-preview-image"><img
														src="https://s.pstatic.net/static/www/mobile/edit/20220415/cropImg_728x360_91930385614927605.jpeg" />
													</li>
												</ul>
												<ul class="file-selet-count-wrap">
													<li class="file-selet-count"><i
														class="fa-solid fa-circle-xmark"></i> <span
														class="select-count">0</span><span>개 선택</span></li>
													<li class="file-down-btn"><i
														class="fa-solid fa-download"></i></li>
												</ul>
											</div>
											<div class="file-menu gather-vod">
												<span>동영상</span>
											</div>
											<div class="file-content-wrap vod-wrap">
												<ul class="file-preview-list">
													<li class="file-preview-file">
														<div class="gather-video-wrap">
															<p class="gather-file-icon">
																<i class="fa-solid fa-video"></i>
															</p>
															<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
															<p class="gather-file-date">
																유효기간<span>2022-05-03</span>
															</p>
															<p class="gather-file-size">15.87KB</p>
														</div>
													</li>
													<li class="file-preview-file">
														<div class="gather-video-wrap">
															<p class="gather-file-icon">
																<i class="fa-solid fa-video"></i>
															</p>
															<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
															<p class="gather-file-date">
																유효기간<span>2022-05-03</span>
															</p>
															<p class="gather-file-size">15.87KB</p>
														</div>
													</li>
													<li class="file-preview-file">
														<div class="gather-video-wrap">
															<p class="gather-file-icon">
																<i class="fa-solid fa-video"></i>
															</p>
															<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
															<p class="gather-file-date">
																유효기간<span>2022-05-03</span>
															</p>
															<p class="gather-file-size">15.87KB</p>
														</div>
													</li>
													<li class="file-preview-file">
														<div class="gather-video-wrap">
															<p class="gather-file-icon">
																<i class="fa-solid fa-video"></i>
															</p>
															<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
															<p class="gather-file-date">
																유효기간<span>2022-05-03</span>
															</p>
															<p class="gather-file-size">15.87KB</p>
														</div>
													</li>
												</ul>
												<ul class="file-selet-count-wrap">
													<li class="file-selet-count"><i
														class="fa-solid fa-circle-xmark"></i> <span
														class="select-count">0</span><span>개 선택</span></li>
													<li class="file-down-btn"><i
														class="fa-solid fa-download"></i></li>
												</ul>
											</div>
											<div class="file-menu gather-file">
												<span>파일</span>
											</div>
											<div class="file-content-wrap file-wrap">
												<ul class="file-preview-list">
													<li class="file-preview-file active">
														<div class="gather-video-wrap">
															<p class="gather-file-icon">
																<i class="fa-solid fa-video"></i>
															</p>
															<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
															<p class="gather-file-date">
																유효기간<span>2022-05-03</span>
															</p>
															<p class="gather-file-size">15.87KB</p>
														</div>
													</li>
													<li class="file-preview-file">
														<div class="gather-video-wrap">
															<p class="gather-file-icon">
																<i class="fa-solid fa-video"></i>
															</p>
															<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
															<p class="gather-file-date">
																유효기간<span>2022-05-03</span>
															</p>
															<p class="gather-file-size">15.87KB</p>
														</div>
													</li>
													<li class="file-preview-file">
														<div class="gather-video-wrap">
															<p class="gather-file-icon">
																<i class="fa-solid fa-video"></i>
															</p>
															<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
															<p class="gather-file-date">
																유효기간<span>2022-05-03</span>
															</p>
															<p class="gather-file-size">15.87KB</p>
														</div>
													</li>
													<li class="file-preview-file">
														<div class="gather-video-wrap">
															<p class="gather-file-icon">
																<i class="fa-solid fa-video"></i>
															</p>
															<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
															<p class="gather-file-date">
																유효기간<span>2022-05-03</span>
															</p>
															<p class="gather-file-size">15.87KB</p>
														</div>
													</li>
													<li class="file-preview-file">
														<div class="gather-video-wrap">
															<p class="gather-file-icon">
																<i class="fa-solid fa-video"></i>
															</p>
															<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
															<p class="gather-file-date">
																유효기간<span>2022-05-03</span>
															</p>
															<p class="gather-file-size">15.87KB</p>
														</div>
													</li>
													<li class="file-preview-file">
														<div class="gather-video-wrap">
															<p class="gather-file-icon">
																<i class="fa-solid fa-video"></i>
															</p>
															<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
															<p class="gather-file-date">
																유효기간<span>2022-05-03</span>
															</p>
															<p class="gather-file-size">15.87KB</p>
														</div>
													</li>
													<li class="file-preview-file">
														<div class="gather-video-wrap">
															<p class="gather-file-icon">
																<i class="fa-solid fa-video"></i>
															</p>
															<p class="gather-file-name">가나다라마바사아자차카타파하ABCDEFGHIJLMNOPRWEQWSFASFSDGSD1234567890</p>
															<p class="gather-file-date">
																유효기간<span>2022-05-03</span>
															</p>
															<p class="gather-file-size">15.87KB</p>
														</div>
													</li>
												</ul>
												<ul class="file-selet-count-wrap">
													<li class="file-selet-count"><i
														class="fa-solid fa-circle-xmark"></i> <span
														class="select-count">0</span><span>개 선택</span></li>
													<li class="file-down-btn"><i
														class="fa-solid fa-download"></i></li>
												</ul>
											</div>
										</div>
										<div class="btn_gather_close">파일서랍 닫기</div>
									</div>
									<script>
										$('.newchat-popup-wrap .file-menu')
												.click(
														function() {
															$(this)
																	.next(
																			'.newchat-popup-wrap .file-content-wrap')
																	.stop()
																	.slideToggle(
																			300);
															$(this)
																	.toggleClass(
																			'on')
																	.siblings()
																	.removeClass(
																			'on');
															$(this)
																	.next(
																			'.newchat-popup-wrap .file-content-wrap')
																	.siblings(
																			'.newchat-popup-wrap .file-content-wrap')
																	.slideUp(
																			300); // 1개씩 펼치기
														});
										$('.newchat-popup-wrap .file-menu')
												.first().trigger('click');
									</script>
									<!-- 파일 모아보기 끝 -->
									<div class="newchat-chat-contents">
										<!-- 비밀 채팅 내용 시작-->
										<div class="newchat-comment-wrap">
											<p class="profile-img profile-1"></p>
											<a class="user-name" href="#!">가나다라</a> <span class="comment">
												<img src="img/emoticon/emo02/emo02_001.png" width="100%" />
											</span>
										</div>
										<div class="newchat-comment-wrap">
											<p class="profile-img profile-2"></p>
											<a class="user-name" href="#!">가나다라마바사아자차카</a> <span
												class="comment">가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하</span>
										</div>
										<div class="newchat-comment-wrap">
											<p class="profile-img profile-3"></p>
											<a class="user-name" href="#!">가나다라마바사아자차카</a> <span
												class="comment">가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하</span>
										</div>
										<div class="newchat-comment-wrap">
											<p class="profile-img profile-4"></p>
											<a class="user-name" href="#!">가나다라마바사아자차카</a> <span
												class="comment">가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하</span>
										</div>
										<div class="newchat-comment-wrap">
											<p class="profile-img profile-5"></p>
											<a class="user-name" href="#!">가나다라마바사아자차카</a> <span
												class="comment">가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하</span>
										</div>
										<!-- 비밀 채팅 내용 끝-->

										<!-- 비밀 채팅 - 대화명 클릭 시 노출 팝업 시작 -->
										<div class="newchat-popupLayer">
											<div class="popup">
												<ul class="popup_content">
													<li class="ico_whisper"><a href="#!"><i
															class="fas fa-comment-alt"></i>귓속말 보내기</a>
														<div id="newchat-whisper">
															<form onsubmit="return false">
																<input type="text" name="message" />
																<button>보내기</button>
															</form>
														</div></li>
													<li><a href="#!"><i class="fas fa-not-equal"></i>신고하기</a>
													</li>
												</ul>
											</div>
										</div>
										<!-- 비밀 채팅 - 대화명 클릭 시 노출 팝업 끝 -->
									</div>
								</div>
							</div>
							<!-- 메시지 작성 시작 -->
							<div class="newchat-popup-input">
								<div class="sub_chat_scroll" style="display: none"></div>
								<div class="newchat-write-wrap">
									<div class="newchat-myname">홍길동</div>
									<div class="newchat-textbox" id="subContent" maxlength="200"
										contenteditable="true" placeholder="메세지 입력하기"></div>
								</div>
								<!-- 이모지 및 이모티콘 영역 -->
								<div class="newchat-emoji-wrap" style>
									<!-- new chat 이모지 -->
									<div class="new_emoji_frame">
										<ul class="newchat-emoji-tab-wrap"></ul>
									</div>
								</div>
								<script>
									$(document)
											.ready(
													function() {
														$(
																'.newchat-emoji-tab-wrap li.tab-link')
																.click(
																		function() {
																			var tab_id = $(
																					this)
																					.attr(
																							'data-tab');

																			$(
																					'.newchat-emoji-tab-wrap li.tab-link')
																					.removeClass(
																							'current');
																			$(
																					'.newchat-emoji-subwrap')
																					.removeClass(
																							'current');

																			$(
																					this)
																					.addClass(
																							'current');
																			$(
																					'#'
																							+ tab_id)
																					.addClass(
																							'current');
																		});
													});
								</script>
								<!-- 이모티콘 영역 끝-->
							</div>
							<!-- 메시지 작성 끝 -->
							<!-- 이모지 및 전송 버튼 시작 -->
							<div class="newchat-popup-input-btn">
								<ul class="emoji">
									<li><a href="#!" class="ico_emoji show"> <i
											class="fas fa-laugh"></i>
									</a></li>
									<li><a href="#!" class="ico_keyboard"> <i
											class="fas fa-keyboard"></i>
									</a></li>
								</ul>
								<div class="newchat-popup-file">
									<a href="#!"> <!-- <i class="fas fa-file-arrow-up"></i> -->
										<i class="fa-solid fa-paperclip"></i>
									</a>
								</div>
								<ul class="send">
									<li><span class="counter" id="newchat-counter">0</span></li>
									<li class="btn_send"><a href="#!">전송</a></li>
								</ul>
							</div>
							<!-- 이모지 및 전송 버튼 끝 -->
						</div>
					</div>
				</div>
			</div>

			<!-- 채팅 끝 -->
	</div>
	<%--FORM CONTENT ENDS FROM HERE!!--%>
	</main>
	</div>