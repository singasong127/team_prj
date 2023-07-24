let user_list = [],
  user_info = {},
  chat_bottom,
  setTid,
  animate,
  sub_user_list = [],
  sub_user_info = {},
  sub_chat_bottom,
  openGraph,
  fileUtil,
  trans;

$(function () {
  // 채팅 쌓이는 최대 수 ( 나머지는 최근순으로 삭제 )
  chatLimit = 200;

  // 이모지 로딩
  emojiInit();
  // 메시지 글 카운터 셋팅
  Util.max_count(200, "#counter", "#content", function(name, max) {
    var p = document.getElementById('content'),
    s = window.getSelection(),
    r = document.createRange();
    openError(`"글자수는 ${max}자 이내로 제한됩니다.`, function() {
      setTimeout(() => {
        p.focus()
        r.setStart(p, 1);
        r.setEnd(p, 1);
        s.removeAllRanges();
        s.addRange(r);
      }, 0);
    })
  })
  Util.max_count(200, "#newchat-counter", "#subContent", function(name, max) {
    var p = document.getElementById('subContent'),
    s = window.getSelection(),
    r = document.createRange();
    openError(`"글자수는 ${max}자 이내로 제한됩니다.`, function() {
      setTimeout(() => {
        p.focus()
        r.setStart(p, 1);
        r.setEnd(p, 1);
        s.removeAllRanges();
        s.addRange(r);
      }, 0);
    })
  })
 
  /**
   * 번역기능 사용
   * targetTag: 번역할 태그 (해당 엘리먼트 우클릭 시 번역 창 보임)
   * trans: 번역 가능한 언어 목록
   * roomId: 채널 키 값
   * err: toaster.err 객체
   */
  trans = new Trans({
    targetSelector: 'comment',
    trans: ['ko', 'en', 'de', 'vi', 'es', 'fr', 'pt', 'tr', 'ar', 'it', 'id', 'ja', 'zh-CN', 'zh-TW', 'tl', 'th', 'hi', 'ru'],
    roomId: channelKey,
    err: toastr.error,
  });

  // 오픈그래픽 표현 (링크 미리보기)
  openGraph = new OpenGraph();

  /**
   * 파일 업/다운로드 기능
   * isPrivate: 서브챗(비밀 채팅방)일 때 true / 아니면 false 혹은 값을 주지 않는다.
   * roomId: 채널 키
   * privateRoomId: 서브챗(비밀 채팅방)일 때만 사용, 프라이빗 룸의 채널 키를 받을 수 있는 함수를 건내준다.
   * uploadTag: 클릭 시 업로드 창을 띄울 태그
   * updateEvent: 업로드 시 사용할 콜백 함수
   * uploadDragTag: 해당 태그에 드래그 시 파일이 업로드 됨
   * progressTag: 프로그래스를 보여줄 태그
   * progressSize: 프로그래스의 크기
   * progressEvent: 업로드가 진행될 때 사용할 콜백 함수
   */
  fileUtil = new FileUtil({
    roomId: channelKey,
    uploadTag: 'div.file',
    updateEvent: fileUpdate,
    uploadDragTag: '.chat_contents',
    progressTag: '.chat_contents',
    progressSize: 60,
    progressEvent: function () {
      chatHeight(false, true);
    },
  });
  subFileUtil = new FileUtil({
    isPrivate: true,
    roomId: channelKey,
    privateRoomId: getRoomId,
    uploadTag: 'div.newchat-popup-file',
    updateEvent: subFileUpdate,
    uploadDragTag: '.newchat-popup-contents',
    progressTag: '.newchat-popup-contents',
    progressSize: 60,
    progressEvent: function () {
      chatHeight(true, true);
    },
  });

  // 스크롤 감지
  $('div.chat div.chat_contents')
    .off('scroll')
    .scroll(function () {
      var scrollTop = $(this).scrollTop();
      var innerHeight = $(this).innerHeight();
      var scrollHeight = $(this).prop('scrollHeight');

      clearTimeout(setTid);
      if (Math.ceil(scrollTop) + innerHeight >= scrollHeight) {
        chat_bottom = true;
        $('.chat_scroll').hide();
      } else {
        chat_bottom = false;
        setTid = setTimeout(() => {
          $('.chat_scroll').show();
        }, 100);
      }
    });

  $('.newchat-popup-contents')
    .off('scroll')
    .scroll(function () {
      var scrollTop = $(this).scrollTop();
      var innerHeight = $(this).innerHeight();
      var scrollHeight = $(this).prop('scrollHeight');

      clearTimeout(setTid);
      if (scrollTop + innerHeight >= scrollHeight) {
        sub_chat_bottom = true;
        $('.sub_chat_scroll').hide();
      } else {
        sub_chat_bottom = false;
        setTid = setTimeout(() => {
          $('.sub_chat_scroll').show();
        }, 100);
      }
    });
  // 스크롤 최하단 이동 이벤트
  $('.chat_scroll')
    .off('click')
    .click(function () {
      scrollBotton();
    });
  $('.sub_chat_scroll')
    .off('click')
    .click(function () {
      subScrollBotton();
    });

  // 입력창 전송 버튼
  $('div.chat_input_btn > ul.send > li.btn_send')
    .off('click')
    .click(function (e) {
      chatHeight(false, true);
      channel.sendMessage({
        message: $('#content').text(),
        messageType: JSON.stringify({ profile: res.profile }),
        mimeType: 'text',
      });
      $('#content').text('');
      $('#content').focus();
    });

  // 입력창 엔터
  $('#content').keydown(function (e) {
    if (e.keyCode == 13) {
      chatHeight(false, true);
      e.preventDefault();
      channel.sendMessage({
        message: $(this).text(),
        messageType: JSON.stringify({ profile: res.profile }),
        mimeType: 'text',
      });
      $(this).text('');
    }
  });

  // 특정 유저로 메시지 전송
  let popupLayer = $('div.popupLayer');
  let whisperLayer = $('ul.popup_content li:nth-child(1)', popupLayer);
  popupLayer.close = function () {
    $('#whisper input[type=text][name=message]', whisperLayer).val('');
    $('#whisper', this).hide();
    $(this).hide();
  };
  $('button', whisperLayer)
    .off('click')
    .click(function (e) {
      channel.sendWhisper(
        {
          message: $('input[type=text][name=message]', whisperLayer).val(),
          receivedClientKey: popupLayer.data()['clientKey'],
        },
        function (err, msg) {
          if (err) return openError(err.code);
          chatHeight(false, true);
          write(msg, 'whisperto');
        }
      );
      e.preventDefault();
      popupLayer.close();
    });

  // 1:1 채팅하기
  $('ul.popup_content li:nth-child(2)', popupLayer)
    .off('click')
    .click(function (e) {
      let user = user_info[popupLayer.data().clientKey];
      if (user) {
        if (openRoomId) {
          if (creatorFlag) {
            let closing = $('.closing', $('.newchat-alret-dim').addClass('active')).addClass('active');
            $('div.newchat-alret-btn-wrap > a:nth-child(1)', closing)
              .off('click')
              .click(function () {
                channel_leave();
                channelClose(openRoomId, function () {
                  $('.closing', $('.newchat-alret-dim').removeClass('active')).removeClass('active');
                  chatInvitation(popupLayer.data().clientKey);
                });
              });
            $('div.newchat-alret-btn-wrap > a:nth-child(2)', closing)
              .off('click')
              .click(function () {
                $('.closing', $('.newchat-alret-dim').removeClass('active')).removeClass('active');
                event_trigger(true);
              });
          } else {
            let out = $('.out', $('.newchat-alret-dim').addClass('active')).addClass('active');
            $('div.newchat-alret-btn-wrap > a:nth-child(1)', out)
              .off('click')
              .click(function () {
                $('.out', $('.newchat-alret-dim').removeClass('active')).removeClass('active');
                channel_leave();
                $('#draggable').removeClass('active');
                chatInvitation(popupLayer.data().clientKey);
              });
            $('div.newchat-alret-btn-wrap > a:nth-child(2)', out)
              .off('click')
              .click(function () {
                $('.out', $('.newchat-alret-dim').removeClass('active')).removeClass('active');
              });
          }
        } else {
          chatInvitation(popupLayer.data().clientKey);
        }
      } else {
        toastr.error('유저가 접속되어있지 않습니다.');
      }
      popupLayer.hide();
    });

  // 신고하기
  $('ul.popup_content li:nth-child(3)', popupLayer)
    .off('click')
    .click(function (e) {
      // API 콜한다
      let url = `${Util.Config.hostpath}openapi/insertChatBanUser`;

      let param = {
        room_id: popupLayer.data()['roomId'],
        buser_nick: popupLayer.data()['nickName'],
        buser_msg: popupLayer.data()['message'],
        buser_chat_id: popupLayer.data()['clientKey'],
      };
      // console.log(param);
      $.post(
        url,
        param,
        function (data) {
          if (data.result_cd != 1) {
            toastr.error('추방 요청을 실패하였습니다.');
          } else {
            toastr.info('관리자에게 추방 요청하였습니다.');
          }
        },
        'json'
      );
      popupLayer.close();
    });

  // 도움말 팝업 열기
  $('.help')
    .off('click')
    .click(function () {
      // 서랍 열려 있으면 닫기
      if (res.drawer.is(':visible')) {
        res.drawerClose()
      }
      $('.use_help').toggle();
    });

  // 도움말 팝업 닫기
  $('.btn_help_close')
    .off('click')
    .click(function () {
      $('.use_help').hide();
    });

  // 채팅창 숨기기
  $('.btn_hide')
    .off('click')
    .click(function () {
      $('.chat_field').hide();
      $('.btn_show').addClass('show');
      $('.btn_hide').removeClass('show');
    });

  // 채팅창 보이기
  $('.btn_show')
    .off('click')
    .click(function () {
      $('.chat_field').show();
      $('.btn_hide').addClass('show');
      $('.btn_show').removeClass('show');
    });

  // 귓속말 팝업
  $('.ico_whisper')
    .off('click')
    .click(function () {
      $('#whisper').show();
    });

  // 대화상대 목록에서 자동번역 ON/OFF시 html 변경
  $(document).on('change', '.chat-user-list-dim .chat-user .lang-btn', autoTranslateBtnHandler); // 일반
  $(document).on('change', '.newchat-popup-wrap .chat-user .lang-btn', subAutoTranslateBtnHandler); // 서브

  // 자동 번역 선택 창 닫기
  $(document).on('click', '.chat-user-list-dim .select-lang-dim .select-lang-title p:last-child', autoTranslateWindowClose); // 일반
  $(document).on('click', '.newchat-popup-wrap .select-lang-dim .select-lang-title p:last-child', subAutoTranslateWindowClose); // 서브

  // 자료실
});

// 커스텀메시지 전송
function sendCustomMsg(msg) {
  let param = {};
  if (typeof msg == 'object') {
    param['message'] = typeof msg == 'object' ? JSON.stringify(msg) : msg;
  } else if (typeof msg == 'string') {
    param['message'] = msg;
  } else {
    param['message'] = msg;
  }
  // console.log(param)
  channel.sendCustom(param);
}

// 기존 채팅 초기화
function chatInit() {
  // 룸이름 입력
  $('#chat_room_name').html(
    `<span class="chat-room-name">${channel.roomName}</span> (<a class="chat-user-list_btn"><i class="fas fa-user"></i>01</a>)<a class="gather-file_btn"><i class="fa-regular fa-folder-open"></i></a>`
  );

  // 서브채널
  subInit();

  // 첫 포커스
  $('#content').focus();
  allUserListUpdate();

  // 자료실 초기화
  resourceRepoInit();

  // 신규 메시지 이벤트
  channel.onNotifyMessage = async function (event) {
    if (event.mimeType == 'file') {
      fileWrite(event);
    } else {
      if (event.grade == 'userManager') {
        write(event, 'userManager');
      } else {
        if (getUserInfo(event.clientKey)?.lang && getUserInfo(event.clientKey).lang !== 'none') {
          // console.log('need translate >>>', getUserInfo(event.clientKey)?.lang, event.message);
          const result = await trans.translate(event.message, getUserInfo(event.clientKey).lang, channel.roomId);
          event.message = result.data || event.message;
          // console.log('translated >>>', getUserInfo(event.clientKey)?.lang, result.data);
        }
        write(event);
      }
    }
  };

  // 개인 귓속말 메시지 이벤트
  channel.onPersonalWhisper = function (event) {
    write(event, 'whisper');
  };

  // 글쓰기 제한 이벤트
  channel.onPersonalMuteUser = function (event) {
    openError('글쓰기가 제한되었습니다.');
  };

  // 글쓰기 제한 해제 이벤트
  channel.onPersonalUnmuteUser = function (event) {
    openError('글쓰기 제한이 해제되었습니다.');
  };

  // 공지사항 메시지
  channel.onNotifyNotice = function (event) {
    write(event, 'notice');
  };

  // 유저 입장
  channel.onNotifyJoinUser = function (event) {
    if (channel.clientKey != event.clientKey) {
      write(event, 'join');
    } else {
      scrollBotton();
    }
    allUserListUpdate();
  };

  // 유저 나감
  channel.onNotifyLeaveUser = function (event) {
    write(event, 'leave');
    allUserListUpdate();
  };

  // 유저 추방
  channel.onNotifyKickUser = function (event) {
    write("'<font color='blue'><b>" + event.nickName + "</b></font>' 님이 채팅방에서 추방되었습니다.");
  };

  // 유저 추방 해제
  channel.onNotifyUnkickUser = function (event) {
    write("'<font color='blue'><b>" + event.nickName + "</b></font>' 님이 채팅방에서 추방 해제되었습니다.");
  };

  // 글쓰기 제한
  channel.onNotifyMuteUser = function (event) {
    write("'<font color='blue'><b>" + event.nickName + "</b></font>' 님의 글쓰기가 제한되었습니다.");
  };

  // 글쓰기 제한 해제
  channel.onNotifyUnmuteUser = function (event) {
    write("'<font color='blue'><b>" + event.nickName + "</b></font>' 님의 글쓰기가 제한 해제되었습니다.");
  };

  // 커스텀 메시지
  channel.onNotifyCustom = function (event) {
    // 커스텀 메시지 확인
    var custom = typeof event.message == 'object' ? event.message : JSON.parse(event.message);
    if (custom.type == 'allExit') {
      vChatCloud.disconnect(); // 클라이언트에서 채팅방을 나갈수 있도록 한다.
      channel_leave();
      $('#draggable').removeClass('active');
      write(event, 'allExit');
      return;
    } else if (custom.type == 'subOut') {
      // 채널 종료이벤트
      if (openRoomId == custom.openRoomId) {
        if (custom.clientKey == channel.clientKey) {
          // 본인은 바로 닫기
          openRoomId = null;
          channel_leave();
          $('#draggable').removeClass('active');
        } else {
          // 본인 외에는 팝업창 이후 닫기
          event_reservation(function () {
            openRoomId = null;
            chat_close(function () {
              channel_leave();
              $('#draggable').removeClass('active');
            });
          }, true);
        }
      }
    }
  };

  // 초대 이벤트 수신
  channel.onPersonalInvite = function (event) {
    let inviteRoomId = event.roomId;
    let inviteClient = event.roomId.split('_')[1];
    // let me = user_info[channel.clientKey]
    let user = user_info[inviteClient];

    if (openRoomId) {
      // 이미 새로운 채팅을 사용중인경우
      event_reservation(function () {
        $('.send-chat').text(user.nickName);
        let invite = $('.invite', $('.newchat-alret-dim').addClass('active')).addClass('active');
        $('div.newchat-alret-btn-wrap > a:nth-child(1)', invite)
          .off('click')
          .click(function () {
            event_delete(true);
            if (creatorFlag) {
              channelClose(openRoomId, function () {
                creatorFlag = false;
                subJoin(inviteRoomId);
                $('.invite', $('.newchat-alret-dim').removeClass('active')).removeClass('active');
              });
            } else {
              subJoin(inviteRoomId);
              $('.invite', $('.newchat-alret-dim').removeClass('active')).removeClass('active');
            }
          });
        $('div.newchat-alret-btn-wrap > a:nth-child(2)', invite)
          .off('click')
          .click(function () {
            $('.invite', $('.newchat-alret-dim').removeClass('active')).removeClass('active');
            event_trigger(true);
          });
      }, true);
    } else {
      // 새로운 채팅이 없는 경우
      event_reservation(function () {
        $('.invite-send').text(user.nickName);
        // $(".invite-receive").text(me.nickName)
        $('.newchat-invite-dim', $('.channel-popup-dim').addClass('active')).addClass('active');

        // console.log('onPersonalInvite', inviteRoomId, inviteClient, user)
        $('#chat > div.channel-popup-dim > div.newchat-invite-dim > div > div.newchat-invite-btn_wrap > a:nth-child(1)')
          .off('click')
          .click(function () {
            subJoin(inviteRoomId);
          });
        $('#chat > div.channel-popup-dim > div.newchat-invite-dim > div > div.newchat-invite-btn_wrap > a:nth-child(2)')
          .off('click')
          .click(function () {
            $('.newchat-invite-dim', $('.channel-popup-dim').removeClass('active')).removeClass('active');
          });
      }, false);
    }
  };
}

const getRoomId = () => {
  return privateChannel?.roomId;
};
function fileUpdate(flag, res, isPrivate) {
  if (flag) {
    if (isPrivate) fileUtil.privateRoomId = getRoomId; //privateChannel.roomId;
    let param = [
      {
        id: res.fileKey,
        name: res.fileNm,
        type: res.fileExt,
        size: res.fileSize,
        expire: res.expire,
      },
    ];
    const data = {
      message: JSON.stringify(param),
      messageType: JSON.stringify({ profile: channel.userInfo.profile }),
      mimeType: 'file',
    };
    if (isPrivate === true) {
      subChatHeight(true);
      privateChannel.sendMessage(data);
    } else {
      chatHeight(false, true);
      channel.sendMessage(data);
    }
  } else {
    console.log(res);
    toastr.error('파일전송을 실패 했습니다.');
  }
}

function subFileUpdate(flag, res) {
  fileUpdate(flag, res, true);
}

function fileWrite(msg, pre, isPrivate) {
  // 아직은 단일 파일만 적용
  let data = JSON.parse(msg.message)[0];

  if (data) {
    let param = {
      profile: JSON.parse(msg.messageType).profile,
      clientKey: msg.clientKey,
      nickName: msg.nickName,
    };
    fileUtil.loadCheck({
      ext: data.type,
      key: data.id,
      imgLoad: function (key) {
        param['imgKey'] = key;
        param['tag'] = $('<div>', { class: 'fileComment' });
        write(param, 'fileSend', pre, isPrivate);
      },
      vodLoad: function (key) {
        param['vodKey'] = key;
        param['tag'] = $('<div>', { class: 'fileComment' });
        write(param, 'fileSend', pre, isPrivate);
      },
      audioLoad: function (key) {
        param['aodKey'] = key;
        param['tag'] = $('<div>', { class: 'fileComment' });
        write(param, 'fileSend', pre, isPrivate);
      },
      fileLoad: function () {
        param['tag'] = fileUtil.fileInTag(data.name, data.type, `~ ${data.expire}`, data.size, data.id);
        write(param, 'fileSend', pre, isPrivate);
      },
    });
  }
}

function subFileWrite(msg, pre) {
  fileWrite(msg, pre, true);
}

// 새로운 채팅 접속
function subJoin(inviteRoomId) {
  subJoinRoom(inviteRoomId, channel.clientKey, channel.nickName, function (err, history) {
    if (err) {
      openError(err.code, function () {
        // res.loginShow();
        // vChatCloud.disconnect();
        channel_leave();
        $('.newchat-invite-dim', $('.channel-popup-dim').removeClass('active')).removeClass('active');
        $('#draggable').removeClass('active');
      });
    } else {
      openRoomId = inviteRoomId;

      // 팝업 정리
      $('.chat-user-list-dim', $('.channel-popup-dim').removeClass('active')).removeClass('active');
      $('div', $('.newchat-alret-dim').removeClass('active')).removeClass('active');

      // 채팅방 초기화
      res.roomInitTagRemove(true);
      $('.newchat-myname').text(channel.nickName);
      // 채팅영역에 글쓰기가 활성화될시 활성화
      let noticeMsgCnt = 0;
      if (typeof write == 'function')
        history &&
          history.forEach(function (m) {
            if (m.messageType == 'notice') {
              if (noticeMsgCnt == 0) {
                noticeMsgCnt++;
                write(m, 'notice', true, true);
              }
            } else {
              write(m, '', true, true);
            }
          });

      // 이벤트 바인딩 시작
      subChatInit();

      $('#draggable').addClass('active');

      // 채팅영역에 글쓰기가 활성화될시 활성화
      if (typeof write == 'function') write(res.initMsg, 'notice', null, true);
    }
  });
}

// 새로운 채팅 초기화
function subChatInit() {
  // 첫 포커스
  $('#subContent').focus();
  setTimeout(() => {
    allUserListUpdate(true);
  }, 1000);

  subResourceRepoInit();

  // 신규 메시지 이벤트
  privateChannel.onNotifyMessage = async function (event) {
    if (event.mimeType == 'file') {
      subFileWrite(event);
    } else {
      if (event.grade == 'userManager') {
        write(event, 'userManager', null, true);
      } else {
        if (getSubUserInfo(event.clientKey)?.lang && getSubUserInfo(event.clientKey).lang !== 'none') {
          // console.log('need translate >>>', getSubUserInfo(event.clientKey)?.lang, event.message);
          const result = await trans.translate(event.message, getSubUserInfo(event.clientKey).lang, channel.roomId);
          event.message = result.data || event.message;
          // console.log('translated >>>', getSubUserInfo(event.clientKey)?.lang, result.data);
        }
        write(event, '', null, true);
      }
    }
  };

  // 개인 귓속말 메시지 이벤트
  privateChannel.onPersonalWhisper = function (event) {
    write(event, 'whisper', null, true);
  };

  // 글쓰기 제한 이벤트
  privateChannel.onPersonalMuteUser = function (event) {
    openError('글쓰기가 제한되었습니다.');
  };

  // 글쓰기 제한 해제 이벤트
  privateChannel.onPersonalUnmuteUser = function (event) {
    openError('글쓰기 제한이 해제되었습니다.');
  };

  // 공지사항 메시지
  privateChannel.onNotifyNotice = function (event) {
    write(event, 'notice', null, true);
  };

  // 유저 입장
  privateChannel.onNotifyJoinUser = function (event) {
    if (channel.clientKey != event.clientKey) {
      write(event, 'join', null, true);
    } else {
      subScrollBotton();
    }
    allUserListUpdate(true);
  };

  // 유저 나감
  privateChannel.onNotifyLeaveUser = function (event) {
    write(event, 'leave', null, true);
    allUserListUpdate(true);
  };

  // 유저 추방
  privateChannel.onNotifyKickUser = function (event) {
    write("'<font color='blue'><b>" + event.nickName + "</b></font>' 님이 채팅방에서 추방되었습니다.", null, null, true);
  };

  // 유저 추방 해제
  privateChannel.onNotifyUnkickUser = function (event) {
    write("'<font color='blue'><b>" + event.nickName + "</b></font>' 님이 채팅방에서 추방 해제되었습니다.", null, null, true);
  };

  // 글쓰기 제한
  privateChannel.onNotifyMuteUser = function (event) {
    write("'<font color='blue'><b>" + event.nickName + "</b></font>' 님의 글쓰기가 제한되었습니다.", null, null, true);
  };

  // 글쓰기 제한 해제
  privateChannel.onNotifyUnmuteUser = function (event) {
    write("'<font color='blue'><b>" + event.nickName + "</b></font>' 님의 글쓰기가 제한 해제되었습니다.", null, null, true);
  };

  // 커스텀 메시지
  privateChannel.onNotifyCustom = function (event) {};
}

// 채팅창 높이 조절
function chatHeightEdit(flag) {
  $('.chat_contents').css(
    'max-height',
    $('.chat_field').innerHeight() -
      $('.chat_field .chat_name').innerHeight() -
      $('.chat_field .chat_input_btn').innerHeight() -
      $('.chat_field .chat_input').innerHeight() -
      10
  );
  if (chat_bottom || animate) {
    scrollBotton(flag);
  }
}
function subChatHeightEdit(flag) {
  $('.newchat-popup-contents').css(
    'max-height',
    $('#draggable').innerHeight() -
      $('.newchat-popup-title').innerHeight() -
      $('.newchat-popup-input').innerHeight() -
      $('.newchat-popup-input-btn').innerHeight() -
      10
  );
  if (chat_bottom || animate) {
    subScrollBotton(flag);
  }
}

// 스크롤 최하단으로 이동
function scrollBotton(flag) {
  if (flag) {
    animate = true;
    $('.chat_contents')
      .stop(true)
      .animate({ scrollTop: $('div#content1').height() }, 380, function () {
        animate = false;
      });
  } else {
    $('.chat_contents').scrollTop($('div#content1').height());
  }
}
function subScrollBotton(flag) {
  if (flag) {
    animate = true;
    $('.newchat-popup-contents')
      .stop(true)
      .animate({ scrollTop: $('div.chat .newchat-chat-contents').height() }, 380, function () {
        animate = false;
      });
  } else {
    $('.newchat-popup-contents').scrollTop($('.newchat-chat-contents').height());
  }
}

// 에러팝업
function openError(code, callback) {
  let p = $('div.errorpopup').hide();
  if (errMsg[code] == undefined) {
    $('p:nth-child(2)', p).text(code);
  } else {
    $('p:nth-child(2)', p).text(errMsg[code].kor);
  }
  $('a', p)
    .off()
    .off('click')
    .click(function () {
      p.hide();
      if (typeof callback == 'function') {
        callback();
      }
    });
  p.show('shake');
}

// 오픈팝업
function openPopup(msg, callback, option) {
  var p = $('div.custompopup').hide();
  $('p:nth-child(1)', p).text(msg);
  $('a:nth-child(2)', p)
    .off()
    .off('click')
    .click(function () {
      p.hide();
      if (typeof callback == 'function') {
        callback('확인');
      }
    });
  if (option) {
    $('a:nth-child(3)', p).hide();
  } else {
    $('a:nth-child(3)', p).show();
    $('a:nth-child(3)', p)
      .off()
      .off('click')
      .click(function () {
        p.hide();
        if (typeof callback == 'function') {
          callback('취소');
        }
      });
  }
  p.show();
}

// 귓속말 팝업
function openLayer(e) {
  $('#whisper').show();
  let sWidth = $('#chat').width();
  let sHeight = $('#chat').height();
  let oWidth = $('.popupLayer').width();
  let oHeight = $('.popupLayer').height();
  let fWidth = $('#chat').offset().left;
  let fHeight = $('#chat').offset().top;
  let cHeight = $('#content1').height();
  // 레이어가 나타날 위치를 셋팅한다.
  var divLeft = e.clientX - fWidth + $('html').scrollLeft();
  var divTop = e.clientY - fHeight + $('html').scrollTop();
  // 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
  if (divLeft + oWidth > sWidth) divLeft -= oWidth;
  if (divTop + oHeight > sHeight) divTop -= oHeight;
  if (divTop > cHeight - oHeight) {
    divTop = divTop - oHeight;
  }
  $('.popupLayer')
    .data($(this).data())
    .css({
      top: Math.max(0, divTop),
      left: Math.max(0, divLeft),
      position: 'absolute',
      'z-index': 1,
    })
    .show();
}
function subOpenLayer(e) {
  // console.log("e", e)
  let sWidth = window.innerWidth;
  let sHeight = window.innerHeight;
  let oWidth = $('.newchat-popupLayer').width();
  let oHeight = $('.newchat-popupLayer').height();
  let fWidth = $('#draggable').offset().left;
  let fHeight = $('#draggable').offset().top;
  let cHeight = $('.newchat-popup-contents').height();
  // 레이어가 나타날 위치를 셋팅한다.
  var divLeft = e.clientX - fWidth + $('html').scrollLeft();
  var divTop = e.clientY - fHeight + $('html').scrollTop();
  // 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
  if (divLeft + oWidth > sWidth) divLeft -= oWidth;
  if (divTop + oHeight > sHeight) divTop -= oHeight;
  if (divTop > cHeight - oHeight) {
    divTop = divTop - oHeight;
  }
  $('.newchat-popupLayer')
    .data($(this).data())
    .css({
      top: Math.max(0, divTop),
      left: Math.max(0, divLeft),
      position: 'absolute',
      'z-index': 1,
    })
    .show();
  $('#newchat-whisper').show();
}

// 오브젝트 체크
function objectCheck(val) {
  if (typeof val === 'object') {
    return val;
  } else if (typeof val === 'string') {
    let _temp = val.replace(/{/g, '').replace(/}/g, '');
    let result = {};
    _temp = _temp.split(',');
    for (target in _temp) {
      result[_temp[target].split('=')[0]] = _temp[target].split('=')[1];
    }
    return result;
  } else {
    return null;
  }
}

// 채팅 인원 업데이트
function allUserListUpdate(flag) {
  let new_user_info = {};
  if (flag) {
    // 서브 챗 (비밀 대화방)
    sub_user_list = [];
    privateChannel.getAllUserList(function (err, list) {
      sub_user_list = list;
      let count = 0;
      let el = $('div.newchat-alret-wrap div ul.chat-user-list').empty();
      sub_user_list.forEach((val) => {
        if (sub_user_info[val.clientKey]) Object.assign(val, sub_user_info[val.clientKey]);
        new_user_info[val.clientKey] = val;
        let userInfo = objectCheck(val.userInfo);
        if (userInfo) {
          ++count;
          if (channel.clientKey != val.clientKey) {
            // 채팅 대화상대 목록 그리기
            let html = subChatuserListItem(val.clientKey, userInfo, val.nickName);
            el.append(html);
          }
        }
      });
      [sub_user_info, new_user_info] = [new_user_info, null];
      $('div.newchat-popup-title > p:nth-child(1) > a.chat-user-list_btn').html(`<i class="fas fa-user"></i>${count.toString().padStart(2, '0')}`);
    });
  } else {
    // 일반 대화방
    user_list = [];
    channel.getAllUserList(function (err, list) {
      user_list = list;
      let count = 0;
      let el = $('div.chat-user-list-wrap div ul.chat-user-list').empty();
      user_list.forEach((val) => {
        if (user_info[val.clientKey]) Object.assign(val, user_info[val.clientKey]);
        new_user_info[val.clientKey] = val;
        let userInfo = objectCheck(val.userInfo);
        if (userInfo) {
          ++count;
          if (channel.clientKey != val.clientKey) {
            // 채팅 대화상대 목록 그리기
            let html = chatUserListItem(val.clientKey, userInfo, val.nickName);
            el.append(html);
          }
        }
      });
      [user_info, new_user_info] = [new_user_info, null];
      $('#chat_room_name > a.chat-user-list_btn').html(`<i class="fas fa-user"></i>${count.toString().padStart(2, '0')}`);
    });
  }
}

// 이미지 로딩 (url, load, error)
function imgAppend(src, onload, error) {
  var _img = new Image();
  _img.onload = function (e) {
    onload(_img, e);
  };
  _img.onerror = function (e) {
    error(e);
  };
  _img.src = src;
}

// 채팅창 높이 조절
function chatHeight(sub, pre) {
  if (sub) {
    subChatHeightEdit();
    if (pre) {
      subScrollBotton();
    }
  } else {
    chatHeightEdit();
    if (pre) {
      scrollBotton();
    }
  }
}

function subChatHeight(pre) {
  chatHeight(true, pre);
}

// 접속, 퇴장, 귓속말, 공지사항 문구 html ADD
async function write(msg, tp, pre, sub) {
  // 히스토리 로딩 시 파일 데이터 JSON이 그대로 노출되서 추가함
  if (msg.mimeType === 'file') {
    return fileWrite(msg, null, sub);
  }

  let cl = sub ? $('.newchat-chat-contents') : $('div.chat div#content1');
  let cc = sub ? $('<div', { class: 'newchat-comment-wrap' }) : $('<div>', { class: 'chat-content' });
  let nameClass = sub ? 'user-name' : 'name';
  switch (tp) {
    case 'join':
      cc = $('<div>', { class: 'entery' });
      cc.append($('<span>').html('<b>' + msg.nickName + '</b>님이 입장하셨습니다.'));
      break;
    case 'leave':
      cc = $('<div>', { class: 'chatout' });
      cc.append($('<span>').html('<b>' + msg.nickName + '</b>님이 나가셨습니다.'));
      break;
    case 'notice':
      cc = $('<div>', { class: 'notice' });
      cc.append($('<span><i class="fas fa-flag"></i></span>'));
      cc.append($('<span>').html(typeof msg == 'string' ? msg : msg.message));
      break;
    case 'whisper':
      cc = $('<div>', { class: 'whisper' });
      cc.append($('<span><i class="fas fa-comment-alt"></i></span>'));
      cc.append(
        $('<ul>')
          .append(
            $('<li>')
              .append(
                $('<a href="#!" class="name">')
                  .html(msg.nickName)
                  .data(msg)
                  .on({ click: sub ? subOpenLayer : openLayer })
              )
              .append(document.createTextNode('님의 귓속말'))
          )
          .append($('<li class="comment">').text(msg.message))
      );
      break;
    case 'whisperto':
      cc = $('<div>', { class: 'whisper' });
      cc.append($('<span><i class="fas fa-comment-alt"></i></span>'));
      cc.append(
        $('<ul>')
          .append($('<li>').append($('<a href="#!" class="name">').html(msg.receivedNickName).data(msg)).append(document.createTextNode('님에게 귓속말')))
          .append($('<li class="comment">').text(msg.message))
      );
      break;
    case 'allExit':
      $('div.login').show();
      $('div.chat_field1').hide();
      cc = $('<div>', { class: 'entery' });
      cc.append($('<span>').html('<b>채팅방을 종료합니다..</b>'));
      break;
    case 'userManager':
      cc = $('<div>', { class: 'content admin' });
      if (typeof msg == 'string') {
        cc.append($('<a>', { class: nameClass, href: '#!' }).text(''));
        cc.append($('<span>').html(msg));
      } else if (typeof msg == 'object' && msg.message) {
        if (channel.clientKey != msg.clientKey) {
          cc.append(
            $('<a>', { class: nameClass, href: '#!' })
              .text(msg.nickName)
              .data(msg)
              .on({ click: sub ? subOpenLayer : openLayer })
          );
        } else {
          cc.append($('<a>', { class: nameClass, href: '#!' }).text(msg.nickName));
        }
        cc.append($('<span>').html(msg.message));
      }
      break;
    case 'fileSend':
      cc = sub ? $('<div>', { class: 'newchat-comment-wrap' }) : $('<div>', { class: 'content' });
      let profile = 'profile-1';
      if (msg.profile) {
        profile = 'profile-' + msg.profile;
      }
      cc.append($('<p>', { class: `profile-img ${profile}` }));
      if (channel.clientKey != msg.clientKey) {
        cc.append(
          $('<a>', { class: nameClass, href: '#!' })
            .text(msg.nickName)
            .data(msg)
            .on({ click: sub ? subOpenLayer : openLayer })
        );
      } else {
        cc.append($('<a>', { class: nameClass, href: '#!' }).text(msg.nickName));
      }
      if (msg.imgKey) {
        fileUtil.imgLoad(msg.imgKey, function (_img, button) {
          cc.append(
            msg.tag
              .append(
                $(_img).on('click', function () {
                  let windowOpen = window.open('img.html');
                  let openImgUrl = _img.src;
                  windowOpen.addEventListener('load', function () {
                    windowOpen.document.getElementById('target').src = openImgUrl;
                  });
                })
              )
              .append(button)
          );
          chatHeight(sub, pre);
        });
      } else if (msg.vodKey) {
        fileUtil.vodLoad(msg.vodKey, function (vod, button) {
          cc.append(msg.tag.append(vod).append(button));
          chatHeight(sub, pre);
        });
      } else if (msg.aodKey) {
        fileUtil.aodLoad(msg.aodKey, function (aod, button) {
          cc.append(msg.tag.append(aod).append(button));
          chatHeight(sub, pre);
        });
      }
      cc.append(msg.tag);
      break;
    default:
      cc = sub ? $('<div>', { class: 'newchat-comment-wrap' }) : $('<div>', { class: 'content' });
      if (typeof msg == 'string') {
        let _msg = $(`<input value='${msg}' />`).val()
        cc.append($('<p>', { class: 'profile-img profile-1' }));
        cc.append($('<a>', { class: nameClass, href: '#!' }).text(''));
        cc.append($('<span>', { class: 'comment' }).html(_msg));
      } else if (typeof msg == 'object' && msg.message) {
        let _msg = $(`<input value='${msg.message}' />`).val()
        let profile = 'profile-1';
        if (msg.messageType) {
          profile = 'profile-' + JSON.parse(msg.messageType).profile;
        }
        cc.append($('<p>', { class: `profile-img ${profile}` }));
        if (channel.clientKey != msg.clientKey) {
          cc.append(
            $('<a>', { class: nameClass, href: '#!' })
              .text(msg.nickName)
              .data(msg)
              .on({ click: sub ? subOpenLayer : openLayer })
          );
        } else {
          cc.append($('<a>', { class: nameClass, href: '#!' }).text(msg.nickName));
        }
        if (msg.mimeType == 'emoji_img') {
          var html = $('<span>', { class: 'comment' });
          imgAppend(
            msg.message,
            function (_img) {
              cc.append(html.append(_img));
              chatHeight(sub, pre);
            },
            function () {}
          );
        } else {
          cc.append($('<span>', { class: 'comment' }).html(_msg));
          // 텍스트에 url 정보가 있는지 체크이후 정보 요청
          openGraph.getOpenGraph(msg.message, function (ogHtml, url, data) {
            cc.append(ogHtml)
              .children('div')
              .on('click', function () {
                // window.open(target);
                window.open(url);
              });
            chatHeight(sub, pre);
          });
        }
      }
  }
  if (pre) {
    // 히스토리의 경우 역순
    await cl.prepend(cc);
    if (sub) {
      await this.subScrollBotton();
    } else {
      await this.scrollBotton();
    }
  } else {
    await cl.append(cc);
    if (sub) {
      await this.subChatHeightEdit(true);
    } else {
      await this.chatHeightEdit(true);
    }
  }

  // 대화내용이 너무 많은경우 삭제처리
  if (sub) {
    if ($('div.newchat-comment-wrap, div.entery, div.chatout, div.notice, div.whisper, div.content', $('.newchat-chat-contents')).length > chatLimit) {
      $('div.newchat-comment-wrap, div.entery, div.chatout, div.notice, div.whisper, div.content', $('.newchat-chat-contents'))[0].remove();
    }
  } else {
    if ($('div.entery, div.chatout, div.notice, div.whisper, div.content', $('#content1')).length > chatLimit) {
      $('div.entery, div.chatout, div.notice, div.whisper, div.content', $('#content1'))[0].remove();
    }
  }
}

// 채팅 유저 목록 html 만들기
function chatUserListItem(clientKey, userInfo, nickName, isPrivate) {
  let html = ''
  if(youtubeId != undefined) {
    html = `
    <li class="chat-user" data-client-key="${clientKey}">
        <div class="invite-check">
            <input type="checkbox" id="${isPrivate === true ? 'private_' : ''}newchat-invite_${clientKey}"><label for="${
      isPrivate === true ? 'private_' : ''
    }newchat-invite_${clientKey}"></label>
        </div>
        <div class="user-profile-img profile-${userInfo?.profile}"></div>
        <div class="user-name">${nickName}</div>
        <div class="language">${userInfo?.lang && userInfo.lang !== 'none' ? trans.getLanguageName(userInfo.lang) : '번역안함'}</div>
        <div class="lang-btn-wrap">
          <input type="checkbox" class="lang-btn" id="${isPrivate === true ? 'private_' : ''}switch_${clientKey}" ${
      userInfo?.lang && userInfo?.lang !== 'none' ? 'checked' : ''
    }/>
          <label for="${isPrivate === true ? 'private_' : ''}switch_${clientKey}" class="switch_label">
            <span class="onf_btn"></span>
          </label>
        </div>
    </li>
    `;
  } else {
    html = `
    <li class="chat-user" data-client-key="${clientKey}">
        <div class="user-profile-img profile-${userInfo?.profile}"></div>
        <div class="user-name">${nickName}</div>
        <div class="language">${userInfo?.lang && userInfo.lang !== 'none' ? trans.getLanguageName(userInfo.lang) : '번역안함'}</div>
        <div class="lang-btn-wrap">
          <input type="checkbox" class="lang-btn" id="${isPrivate === true ? 'private_' : ''}switch_${clientKey}" ${
      userInfo?.lang && userInfo?.lang !== 'none' ? 'checked' : ''
    }/>
          <label for="${isPrivate === true ? 'private_' : ''}switch_${clientKey}" class="switch_label">
            <span class="onf_btn"></span>
          </label>
        </div>
    </li>
    `;
  }
  return $(html);
}

// 위와 동일, 서브 챗 용
function subChatuserListItem(clientKey, userInfo, nickName) {
  return chatUserListItem(clientKey, userInfo, nickName, true);
}

// 자동번역 스위치 ON 핸들러
function autoTranslateBtnHandler(e, isPrivate) {
  if (e.target.tagName === 'INPUT') {
    const input = $(e.target);
    const clientKey = input.parent().parent().data('clientKey');
    const { userInfo } = isPrivate === true ? sub_user_info[clientKey] : user_info[clientKey];
    let userListWindow, langWindow, submitBtn, selectedInputRadio;
    if (input.is(':checked')) {
      if (!isPrivate) {
        // console.log('normal chat >>');
        userListWindow = '.chat-user-list-dim .select-lang-dim';
        langWindow = '.chat-user-list-dim .select-lang-dim .select-lang-list';
        submitBtn = '.chat-user-list-dim .select-lang-dim .select-lang-btn';
        selectedInputRadio = `.chat-user-list-dim .select-lang-dim input[name="target-lang"]:checked`;
      } else {
        // console.log('sub chat >>');
        userListWindow = '.newchat-popup-wrap .select-lang-dim';
        langWindow = '.newchat-popup-wrap .select-lang-dim .select-lang-list';
        submitBtn = '.newchat-popup-wrap .select-lang-dim .select-lang-btn';
        selectedInputRadio = `.newchat-popup-wrap .select-lang-dim input[name="target-lang"]:checked`;
      }
      // 언어 선택창 초기화
      $(userListWindow).toggleClass('active');
      $(langWindow).html(trans.makeLangHtml(userInfo?.lang));
      // 자동번역 언어 선택 후 등록 버튼
      $(submitBtn)
        .off()
        .on('click', function () {
          userInfo.lang = $(selectedInputRadio).val();
          allUserListUpdate(isPrivate);
          $(userListWindow).removeClass('active');
        });
    } else {
      userInfo.lang = 'none';
      input.parent().parent().children('.language').html(`번역안함`);
    }
  }
}

// 위와 동일, 서브 챗 용
function subAutoTranslateBtnHandler(e) {
  autoTranslateBtnHandler(e, true);
}

// 번역 언어 선택창 닫기
function autoTranslateWindowClose(e, isPrivate) {
  const x = $(e.target);
  x.parent().parent().parent().parent().removeClass('active');
  allUserListUpdate(isPrivate);
}

// 위와 동일, 서브 챗 용
function subAutoTranslateWindowClose(e) {
  autoTranslateWindowClose(e, true);
}

// 유저 정보 가져옴
function getUserInfo(clientKey, isPrivate) {
  try {
    return isPrivate && isPrivate === true ? sub_user_info[clientKey]?.userInfo : user_info[clientKey]?.userInfo;
  } catch (error) {
    return undefined;
  }
}

function getSubUserInfo(clientKey) {
  return getUserInfo(clientKey, true);
}

// element의 부모중에 tag, class가 일치하는 부모 엘리먼트를 가져옴
function getParentElement(element, option) {
  const { tag, class: className } = option;

  try {
    if (tag) {
      if (element.tagName !== tag.toUpperCase()) {
        throw new Error();
      }
    }
    if (className) {
      if (!element.classList.contains(className)) {
        throw new Error();
      }
    }
    return element;
  } catch (error) {
    if (element.parentElement !== null) return getParentElement(element.parentElement, option);
    else throw new Error('더 이상 부모가 없습니다');
  }
}

// 자료실 초기화
async function resourceRepoInit(isPrivate) {
  let resourceBtn, closeBtn, wrap;
  if (isPrivate === true) {
    resourceBtn = '#draggable .newchat-popup-subwrap .newchat-popup-title .gather-file_btn';
    closeBtn = '#draggable .newchat-popup-subwrap .btn_gather_close';
    wrap = '#draggable .newchat-popup-subwrap .newchat-popup-contents .newchat-gather-file-wrap';
  } else {
    resourceBtn = '#chat_room_name .gather-file_btn';
    closeBtn = '.chat > .gather-file-wrap .btn_gather_close';
    wrap = '.chat > .gather-file-wrap';
    help = '.use_help'
  }

  $(resourceBtn)
    .off()
    .on('click', (e) => {
      if (!$(wrap).is(':visible')) {
        if (isPrivate === true) {
          subResourceRepoInit();
        } else {
          resourceRepoInit();
          // 도움말 펼쳐져 있으면 닫기
          if($(help).is(':visible')) {
            $(help).hide()
          }
        }
      }
      
      $(wrap).toggle();
    });

  $(closeBtn)
    .off()
    .on('click', (e) => {
      $(wrap).toggle();
    });

  let _channel = isPrivate === true ? privateChannel : channel;

  const {
    result_msg,
    data: { list },
    result_cd,
  } = await $.ajax({
    type: 'post',
    url: `${Util.Config.hostpath}openapi/getFileList?roomId=${_channel.roomId}`,
  });

  if (list && result_cd === 1) {
    if (isPrivate === true) {
      subImageRepoInit(list);
      subVideoRepoInit(list);
      subFileRepoInit(list);
    } else {
      imageRepoInit(list);
      videoRepoInit(list);
      fileRepoInit(list);
    }
  } else {
    console.error('요청에 실패했습니다.', result_msg);
  }
}

async function subResourceRepoInit() {
  resourceRepoInit(true);
}

// 자료실 이미지 목록 초기화
async function imageRepoInit(array, isPrivate) {
  let _fileUtil = isPrivate === true ? subFileUtil : fileUtil;
  // let _fileUtil = fileUtil;
  const images = array.filter(({ fileExt }) => _fileUtil.getFileType(fileExt) === 'image');
  let html = '',
    list,
    img,
    selectedCount,
    cancelBtn,
    downloadBtn;
  if (isPrivate === true) {
    // #draggable .newchat-gather-file-wrap
    list = '#draggable .newchat-gather-file-wrap .file-content-wrap.image-wrap .file-preview-list';
    img = '#draggable .newchat-gather-file-wrap .file-content-wrap.image-wrap .file-preview-list .file-preview-image';
    selectedCount = '#draggable .newchat-gather-file-wrap .file-content-wrap.image-wrap .file-selet-count .select-count';
    cancelBtn = '#draggable .newchat-gather-file-wrap .file-content-wrap.image-wrap .fa-circle-xmark';
    downloadBtn = '#draggable .newchat-gather-file-wrap .file-content-wrap.image-wrap .file-down-btn';
  } else {
    list = '.chat > .gather-file-wrap .file-content-wrap.image-wrap .file-preview-list';
    img = '.chat > .gather-file-wrap .file-content-wrap.image-wrap .file-preview-list .file-preview-image';
    selectedCount = '.chat > .gather-file-wrap .file-content-wrap.image-wrap .file-selet-count .select-count';
    cancelBtn = '.chat > .gather-file-wrap .file-content-wrap.image-wrap .fa-circle-xmark';
    downloadBtn = '.chat > .gather-file-wrap .file-content-wrap.image-wrap .file-down-btn';
  }

  $(selectedCount).text(0);

  images.forEach((image, index) => {
    html += `<li class="file-preview-image" data-index="${index}">`;
    html += `<img src="${_fileUtil.download_url}?fileKey=${image.fileKey}" data-origin-file-nm="${image.originFileNm}">`;
    html += `</li>`;
  });
  $(list).html(html);

  let targetIndex = null;
  let shift = false;

  window.addEventListener('keydown', (e) => (shift = e.shiftKey));
  window.addEventListener('keyup', (e) => (shift = e.shiftKey));

  $(img)
    .off()
    .on('click', function (e) {
      const target = e.target.tagName === 'IMG' ? $(e.target).parent() : $(e.target);
      let newIndex = target.data('index');

      if (targetIndex !== null && shift) {
        targetIndex = parseInt(targetIndex);
        newIndex = parseInt(newIndex);
        $(`${img}[data-index="${targetIndex}"]`).toggleClass('active');
        if (targetIndex > newIndex) [newIndex, targetIndex] = [targetIndex, newIndex];
        for (targetIndex; targetIndex <= newIndex; targetIndex++) {
          const selector = `${img}[data-index="${targetIndex}"]`;
          $(selector).toggleClass('active');
        }
      } else {
        target.toggleClass('active');
      }

      targetIndex = target.data('index');

      $(selectedCount).text($(`${img}.active`).length);
    });

  $(cancelBtn)
    .off()
    .on('click', function (e) {
      $(img).removeClass('active');
      $(selectedCount).text('0');
    });

  $(downloadBtn)
    .off()
    .on('click', function (e) {
      const urls = $(`${img}.active img`)
        .toArray()
        .map((i) => {
          return {
            url: i.src,
            name: i.dataset.originFileNm,
          };
        });

      if (urls.length > 0) compressedZipDownload(urls, isPrivate);
    });
}

function subImageRepoInit(array) {
  imageRepoInit(array, true);
}

// 자료실 동영상 목록 초기화
function videoRepoInit(array, isPrivate) {
  let _fileUtil = isPrivate === true ? subFileUtil : fileUtil;
  // let _fileUtil = fileUtil;
  const videos = array.filter(({ fileExt }) => _fileUtil.getFileType(fileExt) === 'video');
  let html = '',
    list,
    video,
    selectedCount,
    cancelBtn,
    downloadBtn;
  if (isPrivate === true) {
    list = '#draggable .newchat-gather-file-wrap .file-content-wrap.vod-wrap .file-preview-list';
    video = '#draggable .newchat-gather-file-wrap .file-content-wrap.vod-wrap .file-preview-file';
    selectedCount = '#draggable .newchat-gather-file-wrap .file-content-wrap.vod-wrap .file-selet-count .select-count';
    cancelBtn = '#draggable .newchat-gather-file-wrap .file-content-wrap.vod-wrap .fa-circle-xmark';
    downloadBtn = '#draggable .newchat-gather-file-wrap .file-content-wrap.vod-wrap .file-down-btn';
  } else {
    list = '.chat > .gather-file-wrap .file-content-wrap.vod-wrap .file-preview-list';
    video = '.chat > .gather-file-wrap .file-content-wrap.vod-wrap .file-preview-file';
    selectedCount = '.chat > .gather-file-wrap .file-content-wrap.vod-wrap .file-selet-count .select-count';
    cancelBtn = '.chat > .gather-file-wrap .file-content-wrap.vod-wrap .fa-circle-xmark';
    downloadBtn = '.chat > .gather-file-wrap .file-content-wrap.vod-wrap .file-down-btn';
  }

  $(selectedCount).text(0);

  videos.forEach((video, index) => {
    html += `<li class="file-preview-file" data-index="${index}" data-file-key="${video.fileKey}">`;
    html += `<div class="gather-video-wrap">`;
    html += `<p class="gather-file-icon"><i class="fa-solid fa-video"></i></p>`;
    html += `<p class="gather-file-name">${video.originFileNm}</p>`;
    html += `<p class="gather-file-date">유효기간<span>${video.expire}</span></p>`;
    html += `<p class="gather-file-size">${
      video.fileSize > 1024 * 1024 ? (video.fileSize / 1024 / 1024).toFixed(2) + 'MB' : (video.fileSize / 1024).toFixed(2) + 'KB'
    }</p>`;
    html += `</div>`;
    html += `</li>`;
  });
  $(list).html(html);

  let targetIndex = null;
  let shift = false;

  window.addEventListener('keydown', (e) => (shift = e.shiftKey));
  window.addEventListener('keyup', (e) => (shift = e.shiftKey));

  $(video)
    .off()
    .on('click', function (e) {
      const target = $(getParentElement(e.target, { tag: 'li', class: 'file-preview-file' }));
      let newIndex = target.data('index');

      if (targetIndex !== null && shift) {
        targetIndex = parseInt(targetIndex);
        newIndex = parseInt(newIndex);
        $(`${video}[data-index="${targetIndex}"]`).toggleClass('active');
        if (targetIndex > newIndex) [newIndex, targetIndex] = [targetIndex, newIndex];
        for (targetIndex; targetIndex <= newIndex; targetIndex++) {
          const selector = `${video}[data-index="${targetIndex}"]`;
          $(selector).toggleClass('active');
        }
      } else {
        target.toggleClass('active');
      }

      targetIndex = target.data('index');

      $(selectedCount).text($(`${video}.active`).length);
    });

  $(cancelBtn)
    .off()
    .on('click', function (e) {
      $(video).removeClass('active');
      $(selectedCount).text('0');
    });

  $(downloadBtn)
    .off()
    .on('click', function (e) {
      const urls = $(`${video}.active`)
        .toArray()
        .map((v) => {
          return {
            url: `${_fileUtil.download_url}?fileKey=${v.dataset.fileKey}`,
            name: $(v).children().children('.gather-file-name').text(),
          };
        });

      if (urls.length > 0) compressedZipDownload(urls, isPrivate);
    });
}

function subVideoRepoInit(array) {
  videoRepoInit(array, true);
}

// 자료실 파일 목록 초기화
function fileRepoInit(array, isPrivate) {
  let _fileUtil = isPrivate === true ? subFileUtil : fileUtil;
  // let _fileUtil = fileUtil;
  const files = array.filter(({ fileExt }) => _fileUtil.getFileType(fileExt) === 'file');
  let html = '',
    list,
    file,
    selectedCount,
    cancelBtn,
    downloadBtn;
  if (isPrivate === true) {
    list = '#draggable .newchat-gather-file-wrap .file-content-wrap.file-wrap .file-preview-list';
    file = '#draggable .newchat-gather-file-wrap .file-content-wrap.file-wrap .file-preview-file';
    selectedCount = '#draggable .newchat-gather-file-wrap .file-content-wrap.file-wrap .file-selet-count .select-count';
    cancelBtn = '#draggable .newchat-gather-file-wrap .file-content-wrap.file-wrap .fa-circle-xmark';
    downloadBtn = '#draggable .newchat-gather-file-wrap .file-content-wrap.file-wrap .file-down-btn';
  } else {
    list = '.chat > .gather-file-wrap .file-content-wrap.file-wrap .file-preview-list';
    file = '.chat > .gather-file-wrap .file-content-wrap.file-wrap .file-preview-file';
    selectedCount = '.chat > .gather-file-wrap .file-content-wrap.file-wrap .file-selet-count .select-count';
    cancelBtn = '.chat > .gather-file-wrap .file-content-wrap.file-wrap .fa-circle-xmark';
    downloadBtn = '.chat > .gather-file-wrap .file-content-wrap.file-wrap .file-down-btn';
  }

  $(selectedCount).text(0);

  files.forEach((file, index) => {
    html += `<li class="file-preview-file" data-index="${index}" data-file-key="${file.fileKey}">`;
    html += `<div class="gather-video-wrap">`;
    html += `<p class="gather-file-icon"><i class="${_fileUtil.fileExeCheck(file.fileExt)}"></i></p>`;
    html += `<p class="gather-file-name">${file.originFileNm}</p>`;
    html += `<p class="gather-file-date">유효기간<span>${file.expire}</span></p>`;
    html += `<p class="gather-file-size">${
      file.fileSize > 1024 * 1024 ? (file.fileSize / 1024 / 1024).toFixed(2) + 'MB' : (file.fileSize / 1024).toFixed(2) + 'KB'
    }</p>`;
    html += `</div>`;
    html += `</li>`;
  });
  $(list).html(html);

  let targetIndex = null;
  let shift = false;

  window.addEventListener('keydown', (e) => (shift = e.shiftKey));
  window.addEventListener('keyup', (e) => (shift = e.shiftKey));

  $(file)
    .off()
    .on('click', function (e) {
      const target = $(getParentElement(e.target, { tag: 'li', class: 'file-preview-file' }));
      let newIndex = target.data('index');

      if (targetIndex !== null && shift) {
        targetIndex = parseInt(targetIndex);
        newIndex = parseInt(newIndex);
        $(`${file}[data-index="${targetIndex}"]`).toggleClass('active');
        if (targetIndex > newIndex) [newIndex, targetIndex] = [targetIndex, newIndex];
        for (targetIndex; targetIndex <= newIndex; targetIndex++) {
          const selector = `${file}[data-index="${targetIndex}"]`;
          $(selector).toggleClass('active');
        }
      } else {
        target.toggleClass('active');
      }

      targetIndex = target.data('index');

      $(selectedCount).text($(`${file}.active`).length);
    });

  $(cancelBtn)
    .off()
    .on('click', function (e) {
      $(file).removeClass('active');
      $(selectedCount).text('0');
    });

  $(downloadBtn)
    .off()
    .on('click', function (e) {
      const urls = $(`${file}.active`)
        .toArray()
        .map((v) => {
          return {
            url: `${_fileUtil.download_url}?fileKey=${v.dataset.fileKey}`,
            name: $(v).children().children('.gather-file-name').text(),
          };
        });

      if (urls.length > 0) compressedZipDownload(urls, isPrivate);
    });
}

function subFileRepoInit(array) {
  fileRepoInit(array, true);
}

// 다중 파일시 압축 후 다운로드
async function compressedZipDownload(urls, isPrivate) {
  let url,
    name = 'files.zip',
    wrap,
    progress,
    currentCount,
    totalCount,
    currentSize,
    totalSize,
    cancelBtn,
    closeBtn;

  if (isPrivate === true) {
    wrap = `.newchat-popup-wrap .newchat-downprogress_dim`;
    subtitle = `.newchat-popup-wrap .newchat-downprogress_dim .downprogress_subtitle`;
    progress = `.newchat-popup-wrap .newchat-downprogress_dim .downprogress_bar`;
    currentCount = `.newchat-popup-wrap .newchat-downprogress_dim .current_contents`;
    totalCount = `.newchat-popup-wrap .newchat-downprogress_dim .general_contents`;
    currentSize = `.newchat-popup-wrap .newchat-downprogress_dim .current_volume`;
    totalSize = `.newchat-popup-wrap .newchat-downprogress_dim .general_volume`;
    cancelBtn = `.newchat-popup-wrap .newchat-downprogress_dim .down_cancel_btn`;
    closeBtn = `.newchat-popup-wrap .newchat-downprogress_dim .close_ico`;
  } else {
    wrap = `.chat > .downprogress_dim`;
    subtitle = `.chat > .downprogress_dim .downprogress_subtitle`;
    progress = `.chat > .downprogress_dim .downprogress_bar`;
    currentCount = `.chat > .downprogress_dim .current_contents`;
    totalCount = `.chat > .downprogress_dim .general_contents`;
    currentSize = `.chat > .downprogress_dim .current_volume`;
    totalSize = `.chat > .downprogress_dim .general_volume`;
    cancelBtn = `.chat > .downprogress_dim .down_cancel_btn`;
    closeBtn = `.chat > .downprogress_dim .close_ico`;
  }

  // 프로그래스 창 초기화
  $(wrap).css('visibility', 'visible');
  $(`${cancelBtn}, ${closeBtn}`).show();
  $(currentCount).text(1);
  $(progress).val(0);
  $(currentSize).text(`${totalSize / 1024 / 1024 > 1 ? '0MB' : '0KB'}`);
  $(subtitle).text('선택한 파일을 저장하는 중입니다.');
  $(cancelBtn).text('취소');

  if (urls.length > 1) {
    const files = [];

    $(totalCount).text(urls.length);

    for (let i = 0; i < urls.length; i++) {
      $(progress).val(0);
      $(currentSize).text(`${totalSize / 1024 / 1024 > 1 ? '0MB' : '0KB'}`);
      const { url, name } = urls[i];
      try {
        const file = await fetcingData({ url, name, index: i }, isPrivate);
        files.push(file);
      } catch (error) {
        let i = 5;
        $(subtitle).text('요청을 취소하셨습니다. (5)');
        $(cancelBtn).text('닫기');
        const id = setInterval(() => {
          i--;
          if (i >= 0) {
            $(subtitle).text(`요청을 취소하셨습니다. (${i})`);
          } else {
            $(cancelBtn).trigger('click');
            clearInterval(id);
          }
        }, 1000);

        $(`${cancelBtn}, ${closeBtn}`)
          .off()
          .on('click', () => {
            clearInterval(id);
            $(wrap).css('visibility', 'hidden');
          });
        return;
      }
    }

    const zip = new JSZip();
    $(subtitle).text('다운로드한 파일을 압축중입니다.');
    $(`${cancelBtn}, ${closeBtn}`).hide();

    // 각각의 파일 압축
    for (let { blob, name } of files) {
      let i = 1;

      // 이름 중복 체크
      while (zip.file(name) !== null) {
        let [ext, ...baseName] = name.split('.').reverse();
        if (baseName[0].endsWith(`(${i})`)) {
          baseName[0] = baseName[0].replace(`(${i})`, `(${i + 1})`);
          i++;
        } else {
          baseName[0] += ` (1)`;
        }

        name = [ext, ...baseName].reverse().join('.');
      }
      zip.file(name, blob);
    }

    const processUpdate = (meta) => $(progress).val(meta.percent);
    const blob = await zip.generateAsync({ type: 'blob' }, processUpdate);
    url = window.URL.createObjectURL(blob);
  } else {
    url = urls[0].url;
    name = urls[0].name;
  }

  download(url, name);

  window.URL.revokeObjectURL(url);

  $(wrap).css('visibility', 'hidden');
}

function subCompressedZipDownload(urls) {
  compressedZipDownload(urls, true);
}

// 일반 다운로드
function download(url, name) {
  const a = document.createElement('a');
  a.href = url;
  a.download = name;
  a.target = '_blank';
  a.click();
  a.remove();
}

// 데이터 가져오기
async function fetcingData({ url, name, index }, isPrivate) {
  let subtitle, progress, currentCount, currentSize, totalSize, cancelBtn, closeBtn;

  if (isPrivate === true) {
    subtitle = `.newchat-popup-wrap .newchat-downprogress_dim .downprogress_subtitle`;
    progress = `.newchat-popup-wrap .newchat-downprogress_dim .downprogress_bar`;
    currentCount = `.newchat-popup-wrap .newchat-downprogress_dim .current_contents`;
    currentSize = `.newchat-popup-wrap .newchat-downprogress_dim .current_volume`;
    totalSize = `.newchat-popup-wrap .newchat-downprogress_dim .general_volume`;
    cancelBtn = `.newchat-popup-wrap .newchat-downprogress_dim .down_cancel_btn`;
    closeBtn = `.newchat-popup-wrap .newchat-downprogress_dim .close_ico`;
  } else {
    subtitle = `.chat > .downprogress_dim .downprogress_subtitle`;
    progress = `.chat > .downprogress_dim .downprogress_bar`;
    currentCount = `.chat > .downprogress_dim .current_contents`;
    currentSize = `.chat > .downprogress_dim .current_volume`;
    totalSize = `.chat > .downprogress_dim .general_volume`;
    cancelBtn = `.chat > .downprogress_dim .down_cancel_btn`;
    closeBtn = `.chat > .downprogress_dim .close_ico`;
  }

  const cancel = new AbortController();
  $(`${cancelBtn}, ${closeBtn}`)
    .off()
    .on('click', () => {
      cancel.abort(); // throw DOMException
    });

  const response = await fetch(url, { signal: cancel.signal });
  let getSize = 0;
  const size = parseInt(response.headers.get('Content-Length'));
  const reader = response.body.getReader();
  const chunks = [];

  $(currentCount).text(index + 1);
  $(totalSize).text(`${size / 1024 / 1024 > 1 ? (size / 1024 / 1024).toFixed(1) + 'MB ' : (size / 1024).toFixed(1) + 'KB '}`);
  $(subtitle).text('선택한 파일을 저장하는 중입니다.');
  while (true) {
    const { done, value } = await reader.read();

    if (done) {
      return {
        blob: new Blob(chunks),
        name: name,
      };
    }

    chunks.push(value);
    getSize += value.length;

    $(progress).val(((getSize / size) * 100).toFixed(0));
    $(currentSize).text(`${getSize / 1024 / 1024 > 1 ? ' ' + (getSize / 1024 / 1024).toFixed(1) + 'MB' : ' ' + (getSize / 1024).toFixed(1) + 'KB'}`);
  }
}
