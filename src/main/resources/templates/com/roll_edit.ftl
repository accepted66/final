<#import "../global/spring.ftl" as spring>
<#include "../global/modal.ftl">
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>编辑</h1>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <form class="form-horizontal" id="form1" action="${request.contextPath}/roll/save_or_update" method="post">
                <input type="hidden" value="" name="data" id="data"/>
            </form>
            <div class="card-body">
                <#if errorMessage?? >
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h5>提 示!</h5>
                        <p>${errorMessage!}</p>
                    </div>
                </#if>

                <div id='editor_holder'></div>
            </div>
            <div class="card-footer">
                <#if item?? && item.id??  >
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-confirm"
                            data-action="./delete?id=${item.id!}">删 除
                    </button>
                </#if>
                <button type="button" class="btn btn-primary float-right" id="btn-submit">提 交</button>
                <a href="./list?rollNo=${(rollNo)!}" class="btn btn-default float-right">返 回</a>
            </div>
        </div>
    </div>

</section>

<aidata-script>
    <script src='${request.contextPath}/js/global/jsoneditor.min.js'></script>
    <script>
        // 上传功能 参考:https://rawgit.com/json-editor/json-editor/master/docs/upload.html
        // Set default options
        JSONEditor.defaults.options.theme = 'bootstrap3';
        JSONEditor.plugins.selectize.enable = true;

        JSONEditor.defaults.options.upload = function (type, file, cbs) {

            var fd = new FormData();
            fd.append("file", file);
            fd.append("path", "icon/roll/");
            fd.append("app", "icon");
            $.ajax({
                url: '${request.contextPath}/api/upload',
                data: fd,
                processData: false,
                contentType: false,
                type: 'POST',
                success: function (data) {
                    cbs.success(data.data.item);
                },
                error: function (e) {
                    cbs.failure("Upload failed, " + e.responseText);
                }
            });

            /**
             var tick = 0;
             var tickFunction = function () {
                tick += 1;
                console.log('progress: ' + tick);
                if (tick < 100) {
                    cbs.updateProgress(tick);
                    window.setTimeout(tickFunction, 50)
                } else if (tick == 100) {
                    cbs.updateProgress();
                    window.setTimeout(tickFunction, 500)
                } else {
                    cbs.success('http://www.example.com/images/' + file.name);
                }
            };

             window.setTimeout(tickFunction)
             **/
        };

        // Initialize the editor
        var editor = new JSONEditor(document.getElementById("editor_holder"), {
            disable_collapse: true,
            disable_properties: true,
            disable_edit_json: true,
            schema: {
                type: "object",
                title: "轮播图编辑",
                properties: {
                    id: {
                        type: "integer",
                        readOnly: true
                    },
                    rollNo: {
                        type: "integer",
                        title: "轮播组编号",
                        readOnly: true
                    },
                    imgUrl: {
                        type: "string",
                        format: "url",
                        title: "轮播图(*)",
                        options: {
                            upload: true
                        },
                        links: [
                            {
                                href: "{{self}}",
                                mediaType: "image"
                            }
                        ]
                    },
                    "targetUrl": {
                        "type": "string",
                        "format": "url",
                        "title": "图片链接(*)",
                        "description": ""
                    },
                    "rank": {
                        "type": "integer",
                        "title": "排位(*)",
                        "description": "正序"
                    },
                    "label": {
                        "title": "分类标签(*)",
                        "type": "string",
                        "enum": ["tb", "jd", "pdd"],
                        options: {
                            enum_titles: ["淘宝", "京东", "拼多多"]
                        }
                    }
                }
            }
        });

        // Set the value
        <#if item?? && item.id?? && itemJson??  >
        editor.setValue(${itemJson});
        </#if>

        // Get the value
        var data = editor.getValue();

        // Validate
        var errors = editor.validate();
        if (errors.length) {
            // Not valid
        }

        // Listen for changes
        editor.on("change", function () {
            // Do something...
        });

        $(document).ready(function () {
            $("#btn-submit").click(function () {
                var data = editor.getValue();
                <#if item?? && item.id??>
                data['id'] = ${(item.id)!};
                </#if>
                <#if rollNo??>
                data['rollNo'] = ${(rollNo)!};
                </#if>
                $("#data").val(JSON.stringify(data));
                $("#form1").submit();
            });
        });
    </script>
</aidata-script>

