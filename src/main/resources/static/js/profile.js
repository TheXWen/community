$(function(){
    doQuestion(1);
    function doQuestion(pageIndex) {
        var jsonObj = {
            "pageno" : 1,
            "pagesize" : 5
        };
        jsonObj.pageno = pageIndex;
        $.ajax({
            type: "GET",
            url: "/profile/doQuestions",
            data: jsonObj,
            beforeSend: function () {
                loadingIndex = layer.load(2, {time: 10 * 1000});
                return true;
            },
            success: function (result) {
                layer.close(loadingIndex);
                if (result.success) {
                    var page = result.page;
                    var data = page.datas;

                    $(".list-group-item").removeClass("active");
                    $("#myQuestion").addClass("active");
                    $("#title").html(page.title);

                    var content = '';

                    $.each(data, function (i, n) {
                        content += '<div class="media">';
                        content += '<div class="media-body">';
                        content += '<h4 class="media-heading"><a href="/question?id=' + n.id + '">' + n.title + '</a></h4>   ';
                        content += n.description + '<br>   ';
                        content += '<span class="text">';
                        content += n.commentCount + ' 个评论 • ' + n.viewCount + ' 次浏览 • ' + n.gmtCreate.slice(0, n.gmtCreate.length - 3) + '</span>';
                        content += '</span>';
                        content += '</div>';
                        content += '</div>';
                    });
                    $(".questionList").html(content);

                    $("#pagination1").pagination({
                        currentPage: page.pageno,
                        totalPage: page.totalno,
                        callback: doQuestion
                    });
                } else {
                    layer.msg(result.message, {time: 1000, icon: 5, shift: 6});
                }
            },
            error: function () {
                layer.msg("加载数据失败！", {time: 1000, icon: 5, shift: 6});
            }
        });
    }

    $("#myQuestion").click(function () {
        doQuestion(1);
    });
    $("#myReply").click(function () {
        doReply(1);
    });

    function doReply(pageIndex){
        $(".questionList").html("");
        $("#pagination1").html("");
        var jsonObj = {
            "pageno" : 1,
            "pagesize" : 5
        };
        jsonObj.pageno = pageIndex;
        $.ajax({
            type: "GET",
            url: "/profile/replies",
            data: jsonObj,
            beforeSend: function () {
                loadingIndex = layer.load(2, {time: 10 * 1000});
                return true;
            },
            success : function (result) {
                layer.close(loadingIndex);
                if (result.success){
                    var page = result.page;
                    var datas = page.datas;

                    $(".list-group-item").removeClass("active");
                    $("#myReply").addClass("active");
                    $("#title").html(page.title);

                    var content = '';

                    $.each(datas, function (i, n) {
                        var type;
                        if (n.type == 1){
                            type = '回复了问题';
                        }else if (n.type == 2){
                            type = '回复了评论';
                        }
                        content += '<div class="media">';
                        content += '<div class="media-body">';
                        content += '    <h4 class="media-heading">';
                        content += '    <span>' + n.senderName + '&nbsp;&nbsp;' + type + '</span>&nbsp;';
                        content += '    <a href="/notification/' + n.id + '">' + n.outerTitle + '</a>';
                        if (n.status == 0){
                            content += '    <span class="label label-danger">未读</span>';
                        }
                        content += '    </h4>';
                        content += '</div>';
                        content += '</div>';
                    });

                    $(".questionList").html(content);
                    $("#pagination1").pagination({
                        currentPage: page.pageno,
                        totalPage: page.totalno,
                        callback: doReply
                    });
                }else {
                    layer.msg(result.message, {time: 1000, icon: 5, shift: 6});
                }
            },
            error : function () {
                layer.msg("查询通知失败！", {time: 1000, icon: 5, shift: 6});
            }
        });
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