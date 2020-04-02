$(function(){
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery);
    var QuestionId = $.getUrlParam("id");

    $.ajax({
        type: "GET",
        url: "/related/" + QuestionId,
        data: {},
        beforeSend: function () {
            loadingIndex = layer.load(2, {time: 10 * 1000});
            return true;
        },
        success: function (result) {
            layer.close(loadingIndex);
            if (result.success) {
                var data = result.data;

                var content = '';
                $.each(data, function (i, n) {
                    content += '<li><a href="/question?id=' + n.id + '">' + n.title + '</a></li>';
                });

                $("#related").html(content);
            } else {
                layer.msg(result.message, {time: 1000, icon: 5, shift: 6});
            }
        },
        error: function () {
            layer.msg("查询相关问题失败！", {time: 1000, icon: 5, shift: 6});
        }
    });
});