const { RoomInit, Trans, FileUtil, OpenGraph, LikeCounter, Util } = e7lib;
const BASE_URL = Util.Config.hostpath;
let vChatCloud, channel, userNick, userKey, channelKey, youtubeId, youtubeList, subChannel, res, roomInfo;
let pw, email;
const lock = { pw: false, email: false };

$(function () {
  // 리소스 로드
  res_load();
  // 파라미터 셋팅
  channelKey = res.getParameters("channelKey");
  console.log("channelKey", channelKey);
  youtubeId = res.getParameters("youtubeId");
  youtubeList = res.getParameters("youtubeList");
  try {
    email = Util.dataEmailPaser(res.getParameters("data"));
  } catch (e) {
    email = ""
  }
  res.init(); // 기본이벤트
  res.invite(); // 초대하기
  res.profileInit(); // 프로필 로드
  res.likeCounterInit(); // 좋아요 카운트
  roomInfo = res.roomInfoLoad(channelKey, function (roomData) {
    // 자동 로그인시 여기서 객체를 생성 후 진행
    vChatCloud = new VChatCloud({
      url: Util.Config.chatUrl,
      // url: BASE_URL+':9001/eventbus'
      serviceId: roomInfo.email(),
    });

    if (roomData.lock() === "Y") {
      switch (roomData.lockType()) {
        case "PW":
          lock.pw = true;
          break;
        case "EM":
          lock.email = true;
          break;
        case "ALL":
          lock.pw = true;
          lock.email = true;
          break;
      }
    }
  });

  if (youtubeList) {
    youtubeList = "list=" + youtubeList;
  } else {
    youtubeList = "playlist=" + youtubeId;
  }

  // 파라미터로 "youtubeId" 값이 빈값이 아닐경우 영상 교체
  // 비디오 영역을 보여주며, 빈값일때는 채팅 채팅화면 영역만 보여준다.
  if (youtubeId != undefined) {
    $("#ytube_link").attr(
      "src",
      `https://www.youtube.com/embed/${youtubeId}?autoplay=1&controls=0&mute=1&modestbranding=1&rel=0&${youtubeList}&loop=1`
    );
  } else {
    res.youtubeRemove();
  }

  res.loginShow();

  $("#name").on("keyup", function (e) {
    if (e.keyCode == 13) {
      res.loginBtn.trigger("click");
    }
  });

  // 로그인 버튼
  res.loginBtn.off("click").click(async function () {
    let nickName = res.nick.val();
    if (nickName) {
      res.nickTag.text(nickName);

      let joined = false;
      const entryDiv = $("#entry");
      while (!joined) {
        const login = await new Promise((resolve, reject) => {
          if (lock.pw || lock.email) {

            entryDiv.css("display", "flex");
            $(".entry_form").hide();
            if (lock.pw) {
              $(".entry_form.pw").show();
            }
            if (lock.email && !email) {
              $(".entry_form.id").show();
            } else {
              resolve(true);
            }

            $(".entry_btnwrap .submit", entryDiv).on("click", () => {
              pw = $(".entry_form.pw input").val();
              if (!email) {
                email = $(".entry_form.id input").val();
              }
              resolve(true);
            });
            $(".entry_btnwrap .cancel", entryDiv).on("click", () => {
              entryDiv.css("display", "none");
              $(".entry_form.pw input").val("");
              $(".entry_form.id input").val("");
              reject(false);
            });
            $(".entry_form input").on("keypress", (e) => {
              if (e.key === "Enter") {
                e.preventDefault();
                $(".entry_btnwrap .submit", entryDiv).trigger("click");
              }
            });
          } else {
            resolve(true);
          }
        }).then(
          () =>
            new Promise((resolve) => {
              res.joinRoom(
                {
                  roomId: channelKey,
                  clientKey: email ?? res.clientKey,
                  nickName,
                  ...(lock.pw && pw ? { password: pw } : {}),
                },
                function (err, history) {
                  if (err) {
                    // 미허용 회원ID/비밀번호
                    if ((err.code === 10114) | (err.code === 10115)) {
                      pw = "";
                      if (err.code === 10114) {
                        email = "";
                        $(".entry_form.id").show();
                      }
                      $(".entry_contents_subtitle").show();
                      res.loginShow();
                      res.roomInitTagRemove();
                      $("#draggable").removeClass("active");
                      vChatCloud.disconnect();
                    } else {
                      openError(err.code, function () {
                        res.loginShow();
                        res.roomInitTagRemove();
                        $("#draggable").removeClass("active");
                        vChatCloud.disconnect();
                      });
                    }
                  } else {
                    // 채팅영역에 글쓰기가 활성화될시 활성화
                    let noticeMsgCnt = 0;
                    if (typeof write == "function")
                      history &&
                        history.forEach(function (m) {
                          if (m.messageType == "notice") {
                            if (noticeMsgCnt == 0) {
                              noticeMsgCnt++;
                              write(m, "notice", true);
                            }
                          } else if (m.mimeType == "file") {
                            fileWrite(m, true);
                          } else {
                            write(m, "", true);
                          }
                        });
                    $(".entry_contents_subtitle").hide();
                    entryDiv.css("display", "none");
                    res.chatShow();
                    joined = true;

                    // 이벤트 바인딩 시작
                    chatInit();

                    // 채팅영역에 글쓰기가 활성화될시 활성화
                    if (typeof write == "function") write(res.initMsg, "notice");
                  }
                  resolve();
                }
              );
            })
        );
      }
    }
  });

  // 종료 버튼
  res.exitBtn.off("click").click(function () {
    chat_bottom = false;
    res.loginShow();
    if (creatorFlag) {
      channelClose(openRoomId, function () {
        res.roomInitTagRemove(true);
      });
    }
    $("#draggable").removeClass("active");
    res.roomInitTagRemove();
    vChatCloud.disconnect();
    res.likeCounter.text("0");
    // $('.chat > .gather-file-wrap').hide();
    if (res.drawer.is(":visible")) {
      res.drawerClose();
    }
    $(".chat > .use_help").hide();
    res.emoTabInit();
  });
});

// 리소스 로드
var res_load = function () {
  // 리소스
  res = {
    // 초기 로드
    init: function () {
      // 종료시 채널 파기요청
      window.addEventListener("beforeunload", function (e) {
        if (creatorFlag) {
          this.sendCustomMsg({ openRoomId: openRoomId, type: "subOut", clientKey: channel.clientKey });
          channelClose(openRoomId, function () { });
        }
      });
      window.addEventListener("unload", function () {
        if (creatorFlag) {
          this.sendCustomMsg({ openRoomId: openRoomId, type: "subOut", clientKey: channel.clientKey });
          channelClose(openRoomId, function () { });
        }
      });
      // 팝업 외 마우스 클릭 시 팝업 닫힘
      $(document).mouseup(function (e) {
        let popupLayer = $(".popupLayer");
        let subPopupLayer = $(".newchat-popupLayer");
        let chat_input = $(".chat_input");
        let invite = $(".invite-btn, .invite-popup-wrap");
        let contextmenu = $("#contextmenu");
        if (popupLayer.has(e.target).length === 0) {
          $("#whisper input[type=text][name=message]", popupLayer).val("");
          popupLayer.hide();
          $("#whisper").hide();
        }
        if (subPopupLayer.has(e.target).length === 0) {
          $("#newchat-whisper input[type=text][name=message]", subPopupLayer).val("");
          subPopupLayer.hide();
          $("#newchat-whisper").hide();
        }
        if (chat_input.has(e.target).length === 0) {
          // $(".ico_keyboard").trigger('click')
        }
        if (invite.has(e.target).length === 0) {
          $(".invite-popup-wrap").hide("drop");
          $("#wrap > section > div > div.invite-popup-wrap > div.url-receive-user > form > input[type=text]").val("");
        }
        if ($(e.target).attr("id") != "contextmenu" && $(e.target).parents("#contextmenu").length == 0) {
          contextmenu.remove();
        }
      });
      // 토스트팝업 옵션 ( 좌측 상단, 5초 )
      toastr.options = {
        positionClass: "toast-top-left",
        // "progressBar": true,
        timeOut: 5000,
        onclick: function () {
          // res.directClipboardCopy(private_room.password);
        },
      };
    },
    // 이메일 초대하기
    invite: function () {
      // 초대하기 버튼
      $("#wrap > section > div > div.invite-btn > a")
        .off("click")
        .on("click", function () {
          let input = $(
            "#wrap > section > div > div.invite-popup-wrap > div.url-receive-user > form > input[type=text]"
          );
          if ($(".invite-popup-wrap").is(":visible")) {
            $(".invite-popup-wrap").hide("drop");
            input.val("");
          } else {
            $("#wrap > section > div > div.invite-popup-wrap > div.url-copy > form > input[type=text]").val(
              window.location.href
            );
            $(".invite-popup-wrap").show("drop");
          }
        });
      // 접속URL 복사
      $("#wrap > section > div > div.invite-popup-wrap > div.url-copy > form > label").click(function (e) {
        var target = $(e.target).siblings("input");
        var _val = $(target);
        _val.select();
        document.execCommand('Copy');
        self.toastr.success("접속URL 이 복사되었습니다.");
      });
      // 초대 전송
      $("#wrap > section > div > div.invite-popup-wrap > div.url-receive-user > form > button")
        .off("click")
        .on("click", function (e) {
          var _target = $(e.target).siblings("input");
          var _arr = _target.val().split(",");
          for (var i = 0; i < _arr.length; i++) {
            var item = _arr[i].trim();
            if (res.checkEmail(item)) {
              var url = `${BASE_URL}openapi/inviteWebRtc`;
              var href = window.location.href.split("?");
              var urlVal;
              if (href.length > 1) {
                urlVal = encodeURI(href[0]) + "?" + encodeURIComponent(window.location.href.split("?")[1]);
              } else {
                urlVal = encodeURI(href[0]);
              }
              var param = {
                room_id: channel.roomId,
                to_email: item,
                // "url": encodeURI(window.location.href)
                url: urlVal,
              };
              $.post(
                url,
                param,
                function (data) {
                  if (data.result_cd != 1) {
                    toastr.error(data.reuslt_msg, "메일전송 실패 (" + data.result_cd + ")");
                  } else {
                    toastr.success("[ " + item + " ] 으로 메일을 전송하였습니다.", "메일 알림");
                  }
                },
                "json"
              );
            } else {
              toastr.warning("[ " + item + " ] 메일 주소를 확인해주세요.", "메일 형식오류");
            }
          }
          toastr.success("메일 전송을 요청하였습니다.");
          $(".invite-popup-wrap").hide("drop");
          _target.val("");
        });
    },
    // video 삭제
    youtubeRemove: function () {
      $("div .pc").css({ width: "380px", height: "710px" });
      $(".pc .chat_field").css("height", "570px");
      $("div .video").remove();
      $("div .invite-btn").remove();
      // $('div .invite-check').remove(); draw.js > allUserListUpdate(flag) 수정해야됨
      $(".chat-user-invite-btn").remove();
    },
    login: $("div.login"),
    chat: $("div.chat_field1"),
    // 로그인 활성화
    loginShow: function () {
      this.chat.hide();
      this.login.show();
      $("#wrap > section > div > div.invite-btn").hide();
    },
    // 채팅 활성화
    chatShow: function () {
      this.login.hide();
      this.chat.show();
      $("#wrap > section > div > div.invite-btn").show();
    },
    // close drawer
    drawer: $(".chat .gather-file-wrap"),
    drawerTop: $(".chat .gather-file-wrap .file-menu"),
    drawerClose: function () {
      if ($(".chat .gather-file-wrap .file-menu").first().hasClass("on")) {
        this.drawer.toggle();
      } else {
        this.drawer.toggle();
        this.drawerTop.first().trigger("click");
      }
    },
    // emoticon tab init
    emoTabInit: function () {
      $("div.emoji-wrap").hide();
      $("div.emoji-subwrap").removeClass("current");
      $("#tab-1").addClass("current");
      $("li.tab-link").removeClass("current");
      $("ul.emoji-tab-wrap li:first").addClass("current");
      $(".ico_emoji").addClass("show");
      $(".ico_keyboard").removeClass("show");
    },
    likeCounter: $("#likeCounter"),
    nick: $("input#name", this.login),
    nickTag: $("div.chat_input div.name"),
    clientKey: "xxxxxxxx".replace(/[xy]/g, function (a, b) {
      return (b = Math.random() * 16), (a == "y" ? (b & 3) | 8 : b | 0).toString(16);
    }),
    initMsg: "실시간 채팅에 오신 것을 환영합니다. 개인정보를 보호하고 커뮤니티 가이드를 준수하는 것을 잊지 마세요!",
    loginBtn: $("button.popupbtn", this.login),
    exitBtn: $("div.chat_name a.closebtn"),
    // 채팅정보 삭제
    roomInitTagRemove: function (sub) {
      if (sub) {
        $(".newchat-popup-contents").scrollTop(0);
        $(
          "div.newchat-comment-wrap, div.entery, div.chatout, div.notice, div.whisper, div.content",
          $(".newchat-chat-contents")
        ).remove();
      } else {
        $(".chat_contents").scrollTop(0);
        $("div.entery, div.chatout, div.notice, div.whisper, div.content", $("#content1")).remove();
      }
    },
    profileList: $("#lista1 > div > div > li.als-item"), // 프로필 리스트
    profile: "1", // 선택한 프로필 값
    // 프로필 생성
    profileTagInit: function () {
      for (var i = 1; i < 49; i++) {
        let profile = $(
          `<li class="als-item" data-profile-no="${i}"><a><p profile="${i}" class="profile-${i}" href="#"></p></a></li>`
        );
        $("div.als-viewport div.als-wrapper").append(profile);
        if (i == 1) {
          profile.addClass("active");
        }
      }
      this.profileList = $("#lista1 > div > div > li.als-item");
    },
    // 프로필 이벤트
    profileTagEventInit: function () {
      res.profileList.off("click").click(function () {
        res.profileList.removeClass("active");
        $(this).addClass("active");
        res.profile = $(this).attr("data-profile-no");
      });
    },
    // 좌우 스크롤
    alsInit: function (tag, option) {
      $(tag).als(option);
    },
    // 프로필정보 로드
    profileInit: async function () {
      await this.profileTagInit();
      await this.profileTagEventInit();
      await this.alsInit("#lista1", {
        visible_items: 4,
        scrolling_items: 4,
        orientation: "horizontal",
        circular: "no",
        autoscroll: "no",
        speed: 300,
      });
    },
    // 좋아요 카운트 로드
    likeCounterInit: function () {
      var option = {
        parent: $(".pc"),
        radius: { 20: 60 },
        count: 15,
        angle: { 0: 30 },
        children: {
          // delay: 250,
          duration: 1580,
          radius: { 10: 0 },
          fill: ["#ff2d2d"],
          easing: mojs.easing.bezier(0.08, 0.69, 0.39, 0.97),
        },
      };
      var burst = new mojs.Burst(option);
      burst.el.style.zIndex = 202;

      new LikeCounter({
        roomId: channelKey,
        likeButton: "#sendLike",
        likeCount: "#likeCounter",
        likeEvent: function (res) {
          burst.generate().tune({ x: 207, y: 190 }).replay();
        },
      });
    },
    // 룸정보 로드
    roomInfoLoad(key, callback) {
      return new RoomInit(key, callback);
    },
    // 이메일 형식 체크
    checkEmail(str) {
      if (/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/.test(str)) {
        return true;
      } else {
        return false;
      }
    },
    // 룸 접속
    joinRoom: function ({ roomId, clientKey, nickName, password, email }, callback) {
      // vchatcloud 객체
      channel = vChatCloud.joinChannel(
        {
          roomId: roomId,
          clientKey: clientKey,
          nickName: nickName,
          userInfo: {
            profile: res.profile,
          },
          ...(lock.pw && pw ? { password } : {}),
        },
        function (error, history) {
          res.roomInitTagRemove();
          if (error) {
            if (callback) return callback(error, null);
            return error;
          }
          if (callback) callback(null, history);
        }
      );
    },
    // url 파라미터 가져오기
    getParameters: function (paramName) {
      // 리턴값을 위한 변수 선언
      let returnValue;
      // 현재 URL 가져오기
      let url = location.search;
      // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
      let parameters = url.slice(1).split("&");
      console.log("parameters", parameters);
      // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
      for (let i = 0; i < parameters.length; i++) {
        let varName = parameters[i].split("=")[0];
        if (varName.toUpperCase() == paramName.toUpperCase()) {
          returnValue = parameters[i].split("=")[1];
          return decodeURIComponent(returnValue);
        }
      }
    },
  };
};
