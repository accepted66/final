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
            <form class="form-horizontal" id="form1" action="${request.contextPath}/ad/space/save_or_update"
                  method="post">
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
                <a href="./list" class="btn btn-default float-right">返 回</a>
            </div>

        </div>
    </div>
</section>

<#assign appName=controller.enum2name("global.app",(item.app)?string) >
<aidata-script>
    <script src='${request.contextPath}/js/global/jsoneditor.min.js'></script>
    <script>
        // Set default options
        JSONEditor.defaults.options.theme = 'bootstrap3';

        // Initialize the editor
        var editor = new JSONEditor(document.getElementById("editor_holder"), {
            disable_collapse: true,
            disable_properties: true,
            disable_edit_json: true,
            schema: {
                "title": "广告展示位配置",
                "type": "object",
                "properties": {
                    "app": {
                        "type": "string",
                        "title": "所属app(*)",
                        "enum": ["${(item.app)!}"],
                        options: {
                            enum_titles: ["${appName!}"]
                        }
                    },
                    "name": {
                        "type": "string",
                        "title": "广告展示位名称(*)",
                        "description": "如:换图标音频页触发"
                    },
                    "desc": {
                        "type": "string",
                        "title": "展示位置描述",
                        "description": "如:换图标点击音频3次后触发"
                    },
                    "adType": {
                        "type": "integer",
                        "title": "广告类型(*)",
                        "enum": [1, 2, 3, 4, 5, 6],
                        options: {
                            enum_titles: ["Native", "Banner", "开屏", "插屏", "激励视频", "信息流"]
                        }
                    },
                    "ads": {
                        "type": "array",
                        "format": "table",
                        "title": "广告权重配置(*)",
                        "uniqueItems": true,
                        "items": {
                            "type": "object",
                            "title": "广告配置",
                            "properties": {
                                "platform": {
                                    "type": "string",
                                    "title": "广告平台(*)",
                                    "enum": ['csj', 'gdt'],
                                    options: {
                                        enum_titles: ["穿山甲", "广点通"]
                                    },
                                },
                                "name": {
                                    "type": "string",
                                    "title": "广告名称(*)",
                                    "description": "从广告平台获取"
                                },
                                "id": {
                                    "type": "string",
                                    "title": "广告ID(*)",
                                    "description": "从广告平台获取"
                                },
                                "weight": {
                                    "type": "integer",
                                    "title": "广告权重%(*)",
                                    "description": "0~100"
                                }
                            }
                        }
                    }
                }
            }
        });

        // Set the value
        <#if item?? && item.id??  >
        editor.setValue(${item.configJson});
        console.info(${item.configJson});
        </#if>

        // Get the value
        var data = editor.getValue();

        // Validate
        var errors = editor.validate();
        if (errors.length) {
            console.info(errors);
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
                $("#data").val(JSON.stringify(data));
                $("#form1").submit();
            });
        });
    </script>
</aidata-script>

