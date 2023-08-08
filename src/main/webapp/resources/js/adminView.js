$(function(){


    //채팅창 오픈
    //채팅창 오픈
    $("#chat").on('click',function(e){
        e.preventDefault();
        window.open("/chat","chat","width=500, height=800, top=200, left=200");
        // 경로, 파일, 너비, 높이, 위치 지정
    })
    //채팅창 오픈
    //채팅창 오픈
    // Default
    // Default
    $(".curtain").hide();
    $(".subNavList").hide();

    $(".navListBox").on("mouseenter mouseleave",function(){
        $(".curtain").stop().slideToggle();
    });



    $('.itemBox, .subNavList').on({
        mouseenter: function(e) {
            if ($(this).hasClass("subNavList")) {
                $(this).stop().fadeIn();
            } else {
                $(".subNavList").stop().fadeOut();
                $(this).siblings(".subNavList").stop().fadeIn();
            }
        },
        mouseleave: function(e) {
            $(".subNavList").stop().fadeOut();
        }
    });
   });