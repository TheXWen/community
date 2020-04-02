var jsonObj = {
    "pageno": 1,
    "pagesize": 10
};
$(function(){
    queryPage(1);

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

function queryPage(pageIndex) {
    jsonObj.pageno = pageIndex;
    $.ajax({
        type: "GET",
        url: "/doIndex",
        data: jsonObj,
        beforeSend: function () {
            loadingIndex = layer.load(2, {time: 10 * 1000});
            return true;
        },
        success: function (result) {
            if (result.success) {
                layer.close(loadingIndex);
                var page = result.page;
                var data = page.datas;

                var content = '';

                $.each(data, function (i, n) {
                    content += '<div class="media">';
                    content += '<div class="media-left">';
                    content += '    <a href="#">';
                    content += '    <img class="media-object img-rounded" src="' + n.user.avatarUrl + '">';
                    content += '    </a>';
                    content += '    </div>';
                    content += '<div class="media-body">';
                    content += '<h4 class="media-heading"><a href="/question?id=' + n.question.id + '">' + n.question.title + '</a></h4>   ';
                    content += '<span class="text">';
                    content += n.question.commentCount + ' 个评论 • ' + n.question.viewCount + ' 次浏览 • ' + n.question.gmtCreate.slice(0, n.question.gmtCreate.length - 3) + '</span>';
                    content += '</span>';
                    content += '</div>';
                    content += '</div>';
                });
                $(".questionList").html(content);

                $("#pagination1").pagination({
                    currentPage: page.pageno,
                    totalPage: page.totalno,
                    callback: queryPage
                });
            } else {
                layer.msg(result.message, {time: 1000, icon: 5, shift: 6})
            }
        },
        error: function () {
            layer.msg("加载数据失败！", {time: 1000, icon: 5, shift: 6});
        }
    });
}
    $("#queryBtn").click(function() {
        var queryText = $("#queryText").val();
        location.href = "/search?queryText=" + queryText;
    });
