$(function () {
    //新增
    $("#add-button").click(function () {
        var iconFile = $("#iconFile").val();
        if(iconFile == ""){
            alert("请选择上传图片!");
            return false;
        }
        var ext = iconFile.slice(iconFile.lastIndexOf(".")+1).toLowerCase();
        var imgExt = ["png","jpg","jpeg","bmp","gif","zip"];//图片文件的后缀名

        if(imgExt.indexOf(ext) == -1 ){
            alert("请上传格式png,jpg,jpeg,bmp,gif,zip");
            return false;
        }

        $(".form-inline").submit();
    })
    //删除
    //$(".btn-delete").click(function () {
    $(document).on('click','.btn-delete',function(){
        if(!confirm('您确定要删除吗?')){
            return false;
        }
        var id = $(this).data("id");
        var obj = this;
        $.ajax({
            type:'POST',
            url:"/icon/category/icon/set_icon_api",
            data:{id:id},
            success:function(data){
                console.log(data);
                if(data.code == 0){
                    $(obj).parents('tr').hide();
                }
            },
            error:function(){
                alert('网络异常!');
            }
        });

    });

    //复制地址
    var btns = document.querySelectorAll('.btn-copy');
    var clipboard = new ClipboardJS(btns);

});


var topapp_table;

if (topapp_table != null) {
    topapp_table.destroy();
}

topapp_table = $('#topapp_table').DataTable(Object.assign({}, dtConfig, {
    "ajax": {
        "url": "/icon/category/icon/search_icon_api",
        "type": "POST",
        "data": function (d) {
            d.catId = $("#icon-name").data("id");
        }
    },
    "columns": [
        {"data": "id"},
        {
            "data": "iconUrl",
            "render": function ( data, type, full, meta ) {
                return '<img src="'+data+'" width="100">';
            }
        },
        {
            "data": "iconUrl",
            "render": function ( data, type, full, meta ) {
                return data+' <button data-clipboard-text="'+data+'" class="btn btn-primary btn-copy">复制地址</button>';
            }
        },
        {
            "data": "id",
            "render": function ( data, type, full, meta ) {
                return '<button data-id="'+data+'" type="button" class="btn btn-danger btn-delete">删除</button>';
            }
        },
    ]
}));

