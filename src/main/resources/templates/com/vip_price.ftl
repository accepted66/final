<#import "../global/spring.ftl" as spring>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>VIP价格设置</h1>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <form class="form-horizontal" id="form1" action="${request.contextPath}/pay/vip_price/save_or_update" method="post">
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
                <button type="button" class="btn btn-primary float-right" id="btn-submit">提 交</button>
            </div>
        </div>
    </div>

</section>

<aidata-script>
    <script src='${request.contextPath}/js/global/jsoneditor.min.js'></script>
    <script>
        // Set default options
        JSONEditor.defaults.options.theme = 'bootstrap3';
        JSONEditor.plugins.selectize.enable = true;

        // Initialize the editor
        var editor = new JSONEditor(document.getElementById("editor_holder"), {
            disable_collapse: true,
            disable_properties: true,
            disable_edit_json: true,
            schema: {
                type: "object",
                title: " ",
                //"format": "grid",
                properties: {
                    "icon": {
                        "type": "object",
                        "title": "换图标VIP",
                        "format": "grid",
                        "properties": {
                            "vipPrice": {
                                "title": "VIP售价(*)",
                                "type": "number",
                                "default": "0"
                            },
                            "referPrice": {
                                "title": "划线价(*)",
                                "type": "number",
                                "default": "0"
                            }
                        }
                    },
                    "hm": {
                        "type": "object",
                        "title": "隐身精灵VIP",
                        "format": "grid",
                        "properties": {
                            "vipPrice": {
                                "title": "VIP售价(*)",
                                "type": "number",
                                "default": "0"
                            },
                            "referPrice": {
                                "title": "划线价(*)",
                                "type": "number",
                                "default": "0"
                            }
                        }
                    },
                    "vo": {
                        "type": "object",
                        "title": "语音包VIP",
                        "format": "grid",
                        "properties": {
                            "vipPrice": {
                                "title": "VIP售价(*)",
                                "type": "number",
                                "default": "0"
                            },
                            "referPrice": {
                                "title": "划线价(*)",
                                "type": "number",
                                "default": "0"
                            }
                        }
                    }

                }
            }
        });

        // Set the value
        <#if itemJson??  >
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
                $("#data").val(JSON.stringify(data));
                $("#form1").submit();
            });
        });
    </script>
</aidata-script>

