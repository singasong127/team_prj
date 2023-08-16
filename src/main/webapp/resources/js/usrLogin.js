// DUPLICATE CHECK
// DUPLICATE CHECK
checkId = function(e) {
    var userId = $("#emailunique").val().trim();

    if (userId === "") {
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
        }, error: function() { $(email).focus(); }
    });
}
// DUPLICATE CHECK
// DUPLICATE CHECK