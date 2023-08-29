// DUPLICATE CHECK
// DUPLICATE CHECK
checkId = function(e) {
    var userId = $("#emailunique").val();

    if (userId == "" || userId == null) {
        $('.id_ok').css("display", 'none');
        $('.id_already').css("display", 'none');
        return;
    }

    var email = $("input[name=email]").val();
    $.ajax({
        async: true,
        cache: false,
        url: "/idCheck",
        type: 'post',
        data: {"email": email},
        success: function(response) {
            if(response.rt == "available") {
                $('.id_ok').css("display", 'inline-block');
                $('.id_already').css("display", "none");
            } else {
                $('.id_ok').css("display", 'none');
                $('.id_already').css("display", "inline-block");
            }
        }, error: function() { $("input[name=email]").focus(); }
    });
}

//NICKNAME CHECK
checkNickname = function(e) {
    var userId = $("#nickunique").val();

    if (userId == "" || userId == null) {
        $('.nickname_ok').css("display", 'none');
        $('.nickname_already').css("display", 'none');
        return;
    }

    var nickname = $("input[name=nickname]").val();
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
        }, error: function() { $("input[name=nickname]").focus(); }
    });
}
// DUPLICATE CHECK
// DUPLICATE CHECK