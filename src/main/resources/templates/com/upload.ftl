<#import "../global/spring.ftl" as spring>
<#include "../global/modal.ftl">

<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                <input type="hidden" id="uploadUrl" />
                <div id='editor_holder'></div>
            </div>
            <div class="card-footer">
            </div>
        </div>
    </div>

</section>

<aidata-script>
    <script src='${request.contextPath}/js/global/jsoneditor.min.js'></script>
    <script>
        // 参考: https://rawgit.com/json-editor/json-editor/master/docs/upload.html
        // Set default options
        JSONEditor.defaults.options.theme = 'bootstrap3';
        JSONEditor.plugins.selectize.enable = true;

        JSONEditor.defaults.options.upload = function (type, file, cbs) {

            var fd = new FormData();
            fd.append("file", file);
            fd.append("path", "${path}");
            fd.append("app", "${app}");
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
                title: "上传资源",
                properties: {
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
                    }
                }
            }
        });

        // Set the value
        // Get the value
        var data = editor.getValue();

        // Validate
        var errors = editor.validate();
        if (errors.length) {
            // Not valid
        }

        // Listen for changes
        editor.on("change", function () {
            var data = editor.getValue();
            $('#uploadUrl').attr("value", data['imgUrl']);
        });

        $(document).ready(function () {
        });
    </script>
</aidata-script>

