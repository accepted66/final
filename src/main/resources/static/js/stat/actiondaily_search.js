$(function () {
    $('.select2').select2();
    $('#searchTime').daterangepicker({
        maxDate:moment(new Date()) ,//设置最大日期
        startDate: moment().date(1).hours(0).minutes(0).seconds(0),
        locale:{
            format: "YYYY-MM-DD",
        }
    });
    $("#search-button").click(function () {
        serach();
    });

    $("#app").change(function(){
        var tmpVal = $(this).val();
        var options = "<option value=''>请选择动作</option>";
        if(tmpVal == "icon"){
            options += "<option value='iconClick'>iconClick</option>";
            options += "<option value='startUp'>startUp</option>";
        }
        if(tmpVal == "zhihu"){
            options += "<option value='startUp'>startUp</option>";
        }
        $("#action").html('').append(options);
    })

});

var originapp_table;
var topapp_table;

function serach() {
    var appName = $("#app").val();
    var action = $("#action").val();
    var channel = $("#channel").val();
    var statDay = $("#searchTime").val();
    if (isEmpty(appName) && isEmpty(channel)) {
        alert("请输入查询条件");
        return;
    }

    if (topapp_table != null) {
        topapp_table.destroy();
    }

    topapp_table = $('#topapp_table').DataTable(Object.assign({}, dtConfig, {
        "ajax": {
            "url": "/stat/actiondaily/search_actiondaily_api",
            "type": "POST",
            "data": function (d) {
                d.app = appName;
                d.action = action;
                d.channel = channel;
                d.statDay = statDay;
            }
        },
        "columns": [
            {
                "data": "statDay",
                "render": function ( data, type, full, meta ) {
                    return data.substr(0,10);
                }
            },
            {"data": "app"},
            {"data": "channel"},
            {"data": "action"},
            {"data": "uv"},
            {"data": "pv"},
        ]
    }));
}
