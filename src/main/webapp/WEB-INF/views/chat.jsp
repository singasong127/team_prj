<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>Chating</title>
    <style>
        *{
            margin:0;
            padding:0;
        }
        .container{
            width: 300px;
            margin: 0 auto;
            padding: 25px
        }
        .container h1{
            text-align: left;
            padding: 5px 5px 5px 15px;
            color: #FFBB00;
            border-left: 3px solid #FFBB00;
            margin-bottom: 20px;
        }
        .chating{
            background-color: #000;
            width: 300px;
            height: 300px;
            overflow: auto;
        }
        .chating .me{
            color: #F6F6F6;
            text-align: right;
        }
        .chating .others{
            color: #FFE400;
            text-align: left;
        }
        input{
            width: 330px;
            height: 25px;
        }
        #yourMsg{
            /*display: none;*/
        }
    </style>
</head>
<script>
    $(function(){
        wsOpen();
    });
</script>
<script type="text/javascript">
    var ws;

    function wsClose(){
        console.log(ws);
        ws.close();
    }
    function wsOpenFirst(){
        ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
        ws.onopen;
        wsEvt();
    }

    function wsOpen(){
        //웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
        ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
        wsEvt();
    }

    function wsEvt() {
        ws.onopen = function(data){
            //소켓이 열리면 동작
        }

        ws.onmessage = function(data) {
            //메시지를 받으면 동작
            var msg = data.data;
            if(msg != null && msg.trim() != ''){
                var d = JSON.parse(msg);
                if(d.type == "getId"){
                    var si = d.sessionId != null ? d.sessionId : "";
                    if(si != ''){
                        $("#sessionId").val(si);
                    }
                }else if(d.type == "message"){
                    if(d.sessionId == $("#sessionId").val()){

                        $("#chating").append("<p class='me'>나 :" + d.msg + "</p>");
                    }else{

                        $("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
                    }

                }else{
                    console.warn("unknown type!")
                }
            }
        }

        document.addEventListener("keypress", function(e){
            if(e.keyCode === 13){ //enter press
                send();
            }
        });
    }



    function send() {
        var option ={
            type: "message",
            roomNumber: $("#roomNumber").val(),
            sessionId : $("#sessionId").val(),
            userName : $("#userName").val(),
            msg : $("#chatting").val()
        }
        ws.send(JSON.stringify(option))
        $('#chatting').val("");
    }
</script>
<body>
<div id="container" class="container">

    <input type="hidden" id="sessionId" value="">
    <input type="hidden" id="userName" value="${sessionNickName}">
    <input type="hidden" id="roomNumber" value="${roomNumber}">

    <div id="chating" class="chating">
    </div>


    <div id="yourMsg">
        <table class="inputTable">
            <tr>
                <th>메시지</th>
                <th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
                <th><button onclick="send()" id="sendBtn">보내기</button></th>
            </tr>
            <tr><button onclick="wsClose()">방 터뜨리기</button></tr>
            <tr><button onclick="wsOpenFirst()">방 부활</button></tr>
        </table>
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
    var sock = new SockJS("http://localhost/echo/");
//    var sock = new SockJS("http://43.201.115.49:8080/echo/");
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