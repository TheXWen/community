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
        type: "POST",
        url: "/question/" + QuestionId,
        data: {},
        beforeSend: function () {
            loadingIndex = layer.load(2, {time: 10 * 1000});
            return true;
        },
        success: function (result) {
            layer.close(loadingIndex);
            if (result.success) {
                var data = result.data;
                var user = result.user;
                $("#title").html(data.question.title);

                var content = '';
                content += '<div class="media">';
                content += '<div class="media-body">';
                content += '<span class="text">';
                content += '作者&ensp;' + data.user.name
                        + '&ensp;|&ensp;发布时间:&ensp;' + data.question.gmtCreate.slice(0, data.question.gmtCreate.length - 3)
                        + '&ensp;|&ensp;阅读数:&ensp;' + data.question.viewCount + '</span>';
                content += '</span>';
                content += '</div>';
                content += '</div>';

                var editContent = '';
                editContent += '<a href="/publish?id=' + data.question.id + '" class="community-menu">';
                editContent += '<span class="glyphicon glyphicon-pencil" aria-hidden="true">';
                editContent += '</span> 编辑';
                editContent += '</a>';

                var userContent = '';
                userContent += '<div class="media">';
                userContent += '<div class="media-left">';
                userContent += '    <a href="#">';
                userContent += '    <img class="media-object img-rounded" src="' + data.user.avatarUrl + '">';
                userContent += '    </a>';
                userContent += '    </div>';
                userContent += '<div class="media-body">';
                userContent += '<h5 class="media-heading"><span>' + data.user.name + '</span></h5>   ';
                userContent += '</div>';
                userContent += '</div>';

                var commentContent = '';
                commentContent += '<h4>提交回复</h4>';
                commentContent += '<hr/>';
                commentContent += '<div class="media">';
                commentContent += '<div class="media-left">';
                commentContent += '    <a href="#">';
                commentContent += '    <img class="media-object img-rounded" src="' + user.avatarUrl + '">';
                commentContent += '    </a>';
                commentContent += '    </div>';
                commentContent += '<div class="media-body">';
                commentContent += '<h5 class="media-heading"><span>' + user.name + '</span></h5>   ';
                commentContent += '</div>';
                commentContent += '</div>';
                commentContent += '<textarea id="comment_content" class="form-control comment" rows="6"></textarea>';
                commentContent += '<span class="help-block"></span>';
                commentContent += '<button id="commentBtn" type="button" class="btn btn-success btn-publish">回复</button>';

                $(".question").html(content);
                editormd.markdownToHTML("question-view", {
                    markdown : data.question.description,
                    htmlDecode : true,
                    htmlDecode : "style,script,iframe"
                });
                $.each(data.question.tag.split(","), function (i, n) {
                    $("#tags").append('<span class="glyphicon glyphicon-tag label label-info">&ensp;' + n + '</span>&nbsp;');
                });
                $("#replyCount").html(data.question.commentCount + ' 个回复');

                if (user.id != null && data.question.creator == user.id){
                    $("#edit").html(editContent);
                }
                if (user.id != null){
                    $("#comment").html(commentContent);
                }else {
                    $("#comment").html("<h4 style='text-align: center'>要回复问题请先<a href=\"https://gitee.com/oauth/authorize?client_id=ca483c3931e1e8f8585ee36e54d91b079af8ee92e1deedeb19368f08e7354680&redirect_uri=http://localhost:8080/callback&response_type=code\">登录</a></h4>");
                }
                $("#userInfo").html(userContent);

            } else {
                layer.msg(result.message, {time: 1000, icon: 5, shift: 6});
            }
        },
        error: function () {
            layer.msg("查询数据失败！", {time: 1000, icon: 5, shift: 6});
        }
    });

    $.ajax({
        type : "GET",
        data : {},
        url : "/comment/" + QuestionId,
        beforeSend : function() {
            loadingIndex = layer.load(2, {time: 10 * 1000});
            return true;
        },
        success : function (result) {
            layer.close(loadingIndex);
            if (result.success){
                var datas = result.data;
                var user = result.user;
                var replyContent = '';
                $.each(datas, function (i, n) {
                    replyContent += '<div class="media comments">';
                    replyContent += '<div class="media-left">';
                    replyContent += '    <a href="#">';
                    replyContent += '    <img class="media-object img-rounded" src="' + n.user.avatarUrl + '">';
                    replyContent += '    </a>';
                    replyContent += '    </div>';
                    replyContent += '<div class="media-body">';
                    replyContent += '<h5 class="media-heading"><span>' + n.user.name + '</span></h5>   ';
                    replyContent += '<div>' + n.comment.content + '</div>';
                    replyContent += '<div class="menu">';
                    replyContent += '   <span class="glyphicon glyphicon-thumbs-up icon"></span>';
                    replyContent += '   <span id="' + n.comment.id + '" class="glyphicon glyphicon-comment icon collapsed" data-toggle="collapse" href="#collapseExample' + n.comment.id + '" aria-expanded="false">' + n.comment.commentCount + '</span>';
                    replyContent += '   <span class="pull-right">' + n.comment.gmtCreate.slice(0, n.comment.gmtCreate.length - 9) + '</span>';
                    replyContent += '</div>';
                    replyContent += '<div class="collapse" id="collapseExample' + n.comment.id + '"><div class="well ' + n.comment.id + '">';
                    replyContent += '<div id="secondaryReply' + n.comment.id + '"></div>';
                    replyContent += '<div class="secondaryReply_input" id="secondaryReply_input' + n.comment.id + '">';
                    replyContent += ' <input id="secondaryReplyContent' + n.comment.id + '" type="text" class="form-control" placeholder="评论一下...">';
                    replyContent += ' <span class="help-block"></span>';
                    replyContent += ' <button id="replyBtn" type="button" class="btn btn-success pull-right" onclick="addReply(' + n.comment.id + ')">评论</button>';
                    replyContent += '</div>';
                    replyContent += '</div></div>';
                    replyContent += '</div>';
                    replyContent += '</div>';
                });

                $("#replyContent").html(replyContent);
                if (user.id == null){
                    $(".secondaryReply_input").html('');
                }
            }else {
                layer.msg(result.message, {time: 1000, icon: 5, shift: 6});
            }
        },
        error : function () {
            layer.msg("查询回复失败！", {time: 1000, icon: 5, shift: 6});
        }
    });

    /**
     * 提交回复
     */
    $("#comment").on("click","button",function () {
        var content = $("#comment_content").val();
        if (content == ''){
            show_validate_msg("#comment_content", "error", "回复内容不能为空");
            return false;
        }else {
            show_validate_msg("#comment_content", "success", "");
        }
        $.ajax({
            type: "POST",
            url: "/comment",
            contentType: 'application/json',
            data: JSON.stringify({
                "parentId": QuestionId,
                "content": content,
                "type": 1
            }),
            beforeSend: function () {
                loadingIndex = layer.load(2, {time: 10 * 1000});
                return true;
            },
            success : function (result) {
                layer.close(loadingIndex);
                if (result.success){
                    var data = result.data;
                    $("#comment").hide();

                    var newReplyContent = '';
                    newReplyContent += '<div class="media comments">';
                    newReplyContent += '<div class="media-left">';
                    newReplyContent += '    <a href="#">';
                    newReplyContent += '    <img class="media-object img-rounded" src="' + data.user.avatarUrl + '">';
                    newReplyContent += '    </a>';
                    newReplyContent += '    </div>';
                    newReplyContent += '<div class="media-body">';
                    newReplyContent += '<h5 class="media-heading"><span>' + data.user.name + '</span></h5>   ';
                    newReplyContent += '<div>' + data.comment.content + '</div>';
                    newReplyContent += '<div class="menu">';
                    newReplyContent += '   <span class="glyphicon glyphicon-thumbs-up icon"></span>';
                    newReplyContent += '   <span id="' + data.comment.id + '" class="glyphicon glyphicon-comment icon" data-toggle="collapse" href="#collapseExample' + data.comment.id + '" aria-expanded="false">0</span>';
                    newReplyContent += '   <span class="pull-right">' + data.comment.gmtCreate.slice(0, data.comment.gmtCreate.length - 9) + '</span>';
                    newReplyContent += '</div>';
                    newReplyContent += '<div class="collapse" id="collapseExample' + data.comment.id + '"><div class="well ' + data.comment.id + '">';
                    newReplyContent += '<div id="secondaryReply' + data.comment.id + '"></div>';
                    newReplyContent += '<div id="secondaryReply_input' + data.comment.id + '">';
                    newReplyContent += ' <input id="secondaryReplyContent' + data.comment.id + '" type="text" class="form-control" placeholder="评论一下...">';
                    newReplyContent += ' <span class="help-block"></span>';
                    newReplyContent += ' <button id="replyBtn" type="button" class="btn btn-success pull-right" onclick="addReply(' + data.comment.id + ')">评论</button>';
                    newReplyContent += '</div>';
                    newReplyContent += '</div></div>';
                    newReplyContent += '</div>';
                    newReplyContent += '</div>';

                    $("#replyContent").prepend(newReplyContent);
                }else {
                    layer.msg(result.message, {time: 1000, icon: 5, shift: 6});
                }
            },
            error : function () {
                layer.msg("添加评论失败！", {time: 1000, icon: 5, shift: 6});
            }
        });
    });

    /**
     * 展开二级回复
     */
    $("#replyContent").on("click",".glyphicon-comment",function () {
        var replyId = $(this).attr("id");

        if ($("#" + replyId).hasClass("collapsed")){
            $("#" + replyId).addClass("active");
        }else {
            $("#" + replyId).removeClass("active");
        }

        $.ajax({
            type: "GET",
            url: "/reply/" + replyId,
            contentType: 'application/json',
            data: {},
            beforeSend: function () {
                if (replyId == "null"){
                    return false;
                }
                loadingIndex = layer.load(2, {time: 10 * 1000});
                return true;
            },
            success : function (result) {
                layer.close(loadingIndex);
                if (result.success){
                    var datas = result.data;
                    var secondaryReply = '';

                    $.each(datas, function (i, n) {
                        secondaryReply += '<div class="media comments">';
                        secondaryReply += '<div class="media-left">';
                        secondaryReply += '    <a href="#">';
                        secondaryReply += '    <img class="media-object img-rounded" src="' + n.user.avatarUrl + '">';
                        secondaryReply += '    </a>';
                        secondaryReply += '    </div>';
                        secondaryReply += '<div class="media-body">';
                        secondaryReply += '<h5 class="media-heading"><span>' + n.user.name + '</span></h5>   ';
                        secondaryReply += '<div>' + n.comment.content + '</div>';
                        secondaryReply += '<div class="menu">';
                        secondaryReply += '   <span class="pull-right">' + n.comment.gmtCreate.slice(0, n.comment.gmtCreate.length - 9) + '</span>';
                        secondaryReply += '</div>';
                        secondaryReply += '</div>';
                        secondaryReply += '</div>';
                    });

                    $("#secondaryReply" + replyId).html('');
                    $("#secondaryReply" + replyId).append(secondaryReply);

                }else {
                    layer.msg(result.message, {time: 1000, icon: 5, shift: 6});
                }
            },
            error : function () {
                layer.msg("查询二级评论失败！", {time: 1000, icon: 5, shift: 6});
            }
        });
    });

    /**
     * 添加二级回复
     */
    addReply = function (id){
        var content = $("#secondaryReplyContent" + id).val();
        if (content == '') {
            show_validate_msg("#secondaryReplyContent" + id, "error", "回复内容不能为空");
            return false;
        } else {
            show_validate_msg("#secondaryReplyContent" + id, "success", "");
        }
        $.ajax({
            type: "POST",
            url: "/reply",
            contentType: 'application/json',
            data: JSON.stringify({
                "parentId": id,
                "content": content,
                "type": 2
            }),
            beforeSend: function () {
                loadingIndex = layer.load(2, {time: 10 * 1000});
                return true;
            },
            success: function (result) {
                layer.close(loadingIndex);
                if (result.success) {
                    var data = result.data;
                    $("#secondaryReply_input" + id).hide();

                    var newSecondaryReply = '';
                    newSecondaryReply += '<div class="media comments">';
                    newSecondaryReply += '<div class="media-left">';
                    newSecondaryReply += '    <a href="#">';
                    newSecondaryReply += '    <img class="media-object img-rounded" src="' + data.user.avatarUrl + '">';
                    newSecondaryReply += '    </a>';
                    newSecondaryReply += '    </div>';
                    newSecondaryReply += '<div class="media-body">';
                    newSecondaryReply += '<h5 class="media-heading"><span>' + data.user.name + '</span></h5>   ';
                    newSecondaryReply += '<div>' + data.comment.content + '</div>';
                    newSecondaryReply += '<div class="menu">';
                    newSecondaryReply += '   <span class="pull-right">' + data.comment.gmtCreate.slice(0, data.comment.gmtCreate.length - 9) + '</span>';
                    newSecondaryReply += '</div>';
                    newSecondaryReply += '</div>';
                    newSecondaryReply += '</div>';

                    $("#secondaryReply" + id).prepend(newSecondaryReply);
                } else {
                    layer.msg(result.message, {time: 1000, icon: 5, shift: 6});
                }
            },
            error: function () {
                layer.msg("添加二级评论失败！", {time: 1000, icon: 5, shift: 6});
            }
        });
    };

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
});