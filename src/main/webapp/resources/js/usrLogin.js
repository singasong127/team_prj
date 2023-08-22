// DUPLICATE CHECK
// DUPLICATE CHECK
checkId = function(e) {
    const email = $("input[name=email]").val();

    if (email === "") {
        $('.id_ok').css("display", 'none');
        $('.id_already').css("display", 'none');
        return;
    }


    $.ajax({
        async: true,
        cache: false,
        url: "/idCheck",
        type: 'post',
        data: {"email": email},
        success: function(response) {
            if(response.rt == "available") {
                console.log("진행시켜!");
                console.log(email);
                $('.id_ok').css("display", 'inline-block');
                $('.id_already').css("display", "none");
            } else {
                console.log("하아");
                $('.id_ok').css("display", 'none');
                $('.id_already').css("display", "inline-block");
            }
        }, error: function() { $(email).focus(); }
    });
}

checkNickname = function(e) {
    const nickname = $("input[name=nickname]").val();

    if (nickname === "") {
        $('.nickname_ok').css("display", 'none');
        $('.nickname_already').css("display", 'none');
        return;
    }


    $.ajax({
        async: true,
        cache: false,
        url: "/nicknameCheck",
        type: 'post',
        data: {"nickname": nickname},
        success: function(response) {
            if(response.rt == "available") {
                $('.nickname_ok').css("display", 'inline-block');
                $('.nickname_already').css("display", "none");
            } else {
                $('.nickname_ok').css("display", 'none');
                $('.nickname_already').css("display", "inline-block");
            }
        }, error: function() { $(nickname).focus(); }
    });
}
// DUPLICATE CHECK
// DUPLICATE CHECK