$(function(){
    // Default
    // Default
    $(".curtain").hide();
    $(".subNavList").hide();

    $(".navList").on("mouseenter mouseleave",function(){
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

    window.onresize = function(event) {
        console.log("x: " + window.innerWidth+"      y: " + window.innerHeight);
    }


});
