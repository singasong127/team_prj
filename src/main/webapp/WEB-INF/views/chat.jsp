<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="/resources/css/user/chat.css" />
    <title>Chat Application</title>
    <style>
        div.header {
            position: sticky;
            top: 0;
            background-color: blue;
        }
    </style>
</head>
<body>
<div class="chat_wrap">

    <div class="chatRecord" id="chat"></div>
    <!-- 채팅저장출력 -->
        <script id="temp" type="text/x-handlebars-template">
            {{#each .}}
            <div class="{{printLeftRight sender}}">
                <div class="sender">{{sender}}</div>
                <div class="message">
                    {{message}}
                    <a href="{{id}}" style="display:{{printNone sender}}">X</a>
                </div>
                <div class="date">{{regdate}}</div>
            </div>
            {{/each}}
        </script>
        <!-- 새로운채팅출력 -->
        <script id="temp1" type="text/x-handlebars-template">
            <div class="{{printLeftRight sender}}">
                <div class="sender">{{sender}}</div>
                <div class="message">{{message}}</div>
                <div class="date">{{regdate}}</div>
            </div>
        </script>
    <div class="input-div">
			<textarea id="txtMessage" cols="10" rows="10"
                      placeholder="메시지를 입력한 후에 엔터키를 누르세요."></textarea>
    </div>
</div>
</body>
<!-- 메시지 입력시 오른쪽 왼쪽으로 기입되는 방식 지정 -->
<script>
    var uid = "${sessionNickName}";
    Handlebars.registerHelper("printLeftRight", function(sender) {
        if (uid != sender) {
            return "left";
        } else {
            return "right";
        }
    });
    Handlebars.registerHelper("printNone", function(sender) {
        if (uid != sender) {
            return "none";
        }
    });
</script>
<script>
    var uid = "${sessionNickName}"
    getList();
    //채팅삭제
    //채팅삭제
    $("#chat").on('click','.message a',function(e){
        e.preventDefault();
        var id=$(this).attr("href");
        if(!confirm(id+"을(를) 삭제하시겠습니까?")) return;
        $.ajax({
            async:true,
            cache:false,
            type:'post',
            url:'/chat/delete',
            data:{id:id},
            success:function(){
                alert("삭제되었습니다.");
                getList();
            }
        })
    })

    $("#txtMessage").on("keypress", function(e) {
        if (e.keyCode == 13 && !e.shiftKey) {
            e.preventDefault();
            var message = $("#txtMessage").val();
            if (message == "") {
                alert("메시지를 입력하세요.");
                $("#txtMessage").focus();
                return;
            }

            // 서버로 메시지 보내기
            sock.send(uid + "|" + message);
            $("#txtMessage").val("");

            // DB로 데이터 보내기
            $.ajax({
                async:"true",
                cache:"false",
                type:'post',
                url:'/chat/insert',
                data:{
                    sender:uid,
                    message:message,
                },
                success:function(data){
                    sock.send(uid + "|" + message+"|"+data);
                }
            })//ajax

        }
    })

    // 채팅 데이터 받아오기
    function getList() {
        $.ajax({
            async:"true",
            cache:"false",
            type : 'get',
            url : '/chat.json',
            dataType : 'json',
            success : function(data) {
                var temp = Handlebars.compile($("#temp").html());
                $("#chat").append(temp(data));
            }
        });
    }

    // 웹소캣 생성
    var sock = new SockJS("http://43.201.70.133:81/echo/");
    sock.onmessage = onMessage;
    console.log(sock);

    // 서버로부터 메시지 받기
    function onMessage(msg) {
        var items = msg.data.split("|");
        var sender = items[0];
        var message = items[1];
        var date = items[2];
        var data = {
            "message" : message,
            "sender" : sender,
            "regdate" : date
        }
        var temp = Handlebars.compile($("#temp1").html());
        $("#chat").append(temp(data));
        window.scrollTo(0, $("#chat").prop("scrollHeight"));

        var chatRecord = $(".chatRecord")[0];
        chatRecord.scrollTo({
            top: chatRecord.scrollHeight,
            behavior: 'smooth' // Set behavior to 'smooth' for smooth scrolling
        });
    }
</script>
</html>