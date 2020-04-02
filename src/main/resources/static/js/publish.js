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
        url: "/publish/" + QuestionId,
        data: {},
        success: function (result) {
            if (result.success) {
                var data = result.data;
                $("#title").val(data.title);
                $("#description").html(data.description);
                $("#tag").val(data.tag);
            } else {
                layer.msg(result.message, {time: 1000, icon: 5, shift: 6})
            }
        },
        error: function () {

        }
    });

    $("#releaseBtn").click(function () {
        var title = $("#title");
        var description = $("#description");
        var tag = $("#tag");
        //先对要提交给服务器的数据进行校验
        if (title.val() == ''){
            show_validate_msg("#title", "error", "问题标题不能为空");
            return false;
        }else {
            show_validate_msg("#title", "success", "");
        }
        if (description.val() == ''){
            show_validate_msg("#description", "error", "问题描述不能为空");
            return false;
        }else {
            show_validate_msg("#description", "success", "");
        }
        if (tag.val() == ''){
            show_validate_msg("#tag", "error", "标签不能为空");
            return false;
        }else {
            show_validate_msg("#tag", "success", "");
        }
        $.ajax({
            type: "POST",
            url: "/publish",
            data: {
                "id": QuestionId,
                "title": title.val(),
                "description": description.val(),
                "tag": tag.val()
            },
            success: function (result) {
                if (result.success) {
                    window.location.href = "/";
                } else {
                    layer.msg(result.message, {time: 1000, icon: 5, shift: 6})
                }
            },
            error: function () {
                layer.msg("发布失败！", {time: 1000, icon: 5, shift: 6});
            }
        });
    });

    //显示校验结果的提示信息
    function show_validate_msg(ele, status, msg){
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text(msg);
        if("success" == status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error" == status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    showSelectTag = function (){
        $("#select-tag").show();
        selectTags(1,'language');
    };

    addTag = function (value) {
        var previous = $("#tag").val();
        if (previous.split(",").indexOf(value) == -1){
            if (previous){
                $("#tag").val(previous + ',' + value);
            }else {
                $("#tag").val(value);
            }
        }
    };

    selectTags = function (type, id) {
        $.ajax({
            type: "POST",
            url: "/tag",
            data: {
                "type": type
            },
            success: function (result) {
                if (result.success) {
                    var data = result.data;
                    var content = '';
                    $.each(data, function (i, n) {
                        content += '<a class="glyphicon glyphicon-tag label label-info" onclick="addTag(\'' + n.name + '\')">&ensp;' + n.name + '</a>';
                    });

                    $("#" + id).html(content);
                } else {
                    layer.msg(result.message, {time: 1000, icon: 5, shift: 6})
                }
            },
            error: function () {
                layer.msg("查询标签失败！", {time: 1000, icon: 5, shift: 6});
            }
        });
    };

    //显示通知个数
    $.ajax({
        type: "GET",
        url: "/totalNotice",
        data: {},
        success : function (result) {
            if (result == 0){
                $(".badge").html('0');
            }else {
                $(".badge").html(result);
            }
        },
        error : function () {
        }
    });

    editormd("question-editor", {
        width  : "100%",
        height : "360px",
        path   : "/js/lib/",
        watch  : false,
        delay  : 0,
        placeholder : "请输入问题描述(支持Markdown语法)",
        imageUpload    : true,
        imageFormats   : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
        imageUploadURL : "/file/upload"
    });
});