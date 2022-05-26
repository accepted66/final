<#include "../global/modal.ftl">
<#import "../global/spring.ftl" as spring>
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
            <!-- form start -->
            <form class="form-horizontal" id="form2" action="${request.contextPath}/applist/save_or_update"
                  method="post">
                <input type="hidden" name="id" value="${(item.id)!}"/>
                <#--<input type="hidden" name="icon" value="${(item.icon)!}"/>-->
                <input type="hidden" name="bundleId" value="${(item.bundleId)!}"/>
                <div class="card-body">
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">应用ID</label>
                        <div class="input-group">
                            <input type="text" class="form-control col-sm-6" name="appId" id="appId"
                                   value="${(item.appId)!}"
                                   required="required">
                            <#if item?? ><@spring.bind "item.appId" /><@spring.showErrors ""/></#if>
                            <div class="input-group-append">
                                <button id="lookup" type="button" class="btn btn-primary">检 索</button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">应用图标</label>
                        <div class="col-sm-6">
                            <#if item?? && item.icon??>
                                <img src="${item.icon}"/>
                            </#if>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="icon" id="icon"
                                   value="${(item.icon)!}" required="required" placeholder="图标链接地址">
                            <button type="button" class="btn btn-primary" href="/common/upload?app=icon&path=applist"
                                    data-toggle="modal" data-target="#modal-lg">
                                上 传
                            </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">应用名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="appName" value="${(item.appName)!}"
                                   required="required">
                            <#if item?? ><@spring.bind "item.appName" /><@spring.showErrors ""/></#if>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">索 引</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="index" value="${(item.index)!}"
                                   required="required" minlength="1" maxlength="1" placeholder="26个大写字母或#">
                            <#if item?? ><@spring.bind "item.index" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Bundle ID</label>
                        <div class="col-sm-6">
                            <#assign bundleId = ""/>
                            <#if item?? && item.bundleId??>
                                <#assign bundleId = (item.bundleId)! />
                            </#if>
                            <input type="text" class="form-control" value="${bundleId!}" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Scheme</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="scheme" value="${(item.scheme)!}"
                                   required="required">
                            <#if item?? ><@spring.bind "item.scheme" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="card-footer">
                    <#if item?? && item.id??  >
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-confirm"
                                data-action="${request.contextPath}/applist/delete?id=${item.id!}">删 除
                        </button>
                    </#if>
                    <button type="submit" class="btn btn-primary float-right" id="smsSaveSumbit">提 交</button>
                    <button type="button" class="btn btn-default float-right" id="btn-back">取 消</button>
                </div>
                <!-- /.box-footer -->
            </form>
        </div>
    </div>
</section>

<aidata-script>
    <script>
        $(document).ready(function () {
            $('#lookup').click(function () {
                var id = '${(item.id)!}';
                if ($("#appId").val() == "") {
                    alert("请输入应用id");
                    return;
                }
                window.location.href = "./lookup?appId=" + $("#appId").val() + "&id=" + id;
            });
        });

        $(function () {
            $("#modal-lg").on("show.bs.modal", function (e) {
                console.info("show");
                var link = $(e.relatedTarget);
                $(this).find(".modal-body").load(link.attr("href"), function () {
                })
                $('#modal-lg').off('shown.bs.modal');
            });
            $("#modal-lg").on("hidden.bs.modal", function (e) {
                console.info("hidden");
                $('#icon').attr('value', $('#uploadUrl').attr("value"));
                $('#modal-lg').off('hidden.bs.modal');
            });
        });


    </script>
</aidata-script>
