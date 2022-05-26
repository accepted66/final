$(function () {
    $('.select2').select2();
    $('#searchTime').daterangepicker(
        {
            maxDate: moment(new Date()),//设置最大日期
            startDate: moment($('#hiddenStartDate').val(), 'YYYY-MM-DD'),
            endDate: moment($('#hiddenEndDate').val(), 'YYYY-MM-DD'),
            locale: {
                format: "YYYY-MM-DD",
            },
            autoApply: true
        },
        function (start, end) {
            $('#hiddenStartDate').val(start.format('YYYY-MM-DD'));
            $('#hiddenEndDate').val(end.format('YYYY-MM-DD'));
        }
    );
});


$(function () {
    if ($("input[name='publish']").attr("value")==0) {
        $("#reservationtime").attr("disabled","disabled");
    }

    $("input[name='publish']").change(function () {
        if ($(this).attr("value") == 0) {
            $("#reservationtime").attr("disabled","disabled");
        } else {
            $("#reservationtime").removeAttr("disabled")
        }
    })

    $("#btn-back").click(function (event) {
        window.history.go(-1);
    });

    $(".nav-item").each(
        function () {
            var reqUrl = getUrlPath();
            var navUrl = $(this).children("a").attr("href");
            reqUrl = reqUrl.substring(0, reqUrl.lastIndexOf("/") + 1);
            navUrl = navUrl.substring(0, navUrl.lastIndexOf("/") + 1);
            // console.info("reqUrl = " + reqUrl);
            // console.info("navUrl = " + navUrl);
            if (reqUrl == navUrl) {
                $(this).children("a").addClass("active");
                $(this).parent("ul").parent("li").addClass("menu-open");
                $(this).parent("ul").prev("a").addClass("active");
            }
        }
    );

    $("#modal-confirm-submit").click(function (event) {
        $("button").each(
            function () {
                if ($(this).attr("data-toggle")=='modal' && $(this).attr("data-target")=='#modal-confirm') {
                    if ($(this).attr("data-action")) {
                        window.location.href = $(this).attr("data-action");
                        return;
                    }

                }
            }
        );
    });
});

/**
 * 验证空字符串
 */
function isEmpty(data) {
    var str = trim(data);
    if (str == null || str == '' || str == undefined) {
        return true;
    } else {
        return false;
    }
}

/**
 * trim截取空格
 */
function trim(str) {
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

function jump(page) {
    var params = getUrlParameters(getUrlPath());
    var reParams = "";
    for (var i = 0; i < params.length; i++) {
        if (params[i].indexOf("pageIndex") != -1 || params[i] == "") {
            continue;
        }
        reParams = reParams + "&" + params[i];
    }
    return window.location.href = getUrlPath() + "?pageIndex=" + page + reParams;
}

function getUrlPath() {
    var url = document.location.toString();
    var arrUrl = url.split("//");
    var start = arrUrl[1].indexOf("/");
    var relUrl = arrUrl[1].substring(start);
    if (relUrl.indexOf("?") != -1) {
        relUrl = relUrl.split("?")[0];
    }
    return relUrl;
}

function getUrlParameters(urlPath) {
    var url = document.location.toString();
    var params = [""];
    if (url.indexOf("?") != -1) {
        params = url.split("?")[1];
        return params.split("&");
    }
    return params;
}

function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
};