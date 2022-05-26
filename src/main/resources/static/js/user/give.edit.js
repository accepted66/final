var loadDiconsAjaxUrl = "/api/dicon/dicons?categoryId=";

$(document).ready(function () {
    $("#categoryId").change(function (event) {
        var selectVal = $(this).children('option:selected').val();
        if (selectVal != '') {
            loadCitysViaAjax(selectVal, $("#diconIds"));
        }
    });
});

function loadCitysViaAjax(categoryId, handler) {
    var search = {}
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: loadDiconsAjaxUrl + categoryId,
        data: JSON.stringify(search),
        dataType: 'json',
        cache: false,
        success: function (data) {
            console.log("SUCCESS : ", data);
            var options = "";
            $.each(data.data.items, function (i, item) {
                options += "<option value='" + item.id + "'>" + item.animName + "</option>";
            });
            handler.html(options);
        },
        error: function (e) {
            console.log("ERROR : ", e);
            alert(e.responseText);
        }
    });
}