<#import "../global/spring.ftl" as spring>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>赠送</h1>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <!-- form start -->
            <form class="form-horizontal" id="form1" action="${request.contextPath}/user/give_save_or_update"
                  method="post">
                <div class="card-body">
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">用户id</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="uid" value="${(item.uid)!}">
                            <#if item?? ><@spring.bind "item.uid" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">动效包</label>
                        <div class="col-sm-10">
                            <#if categorys??>
                                <#list categorys as category>
                                    <label><input type="checkbox" name="categoryIds" value="${category.id}">&nbsp;&nbsp;&nbsp;${category.name}
                                        &nbsp;&nbsp;&nbsp;</label>
                                </#list>
                            </#if>
                            <#if item?? ><@spring.bind "item.categoryIds" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">动效</label>
                        <div class="col-sm-10">
                            <select class="form-control select2" name="categoryId" id="categoryId">
                                <option value="0">请选择</option>
                                <#if categorys??>
                                    <#list categorys as category>
                                        <option value="${category.id}">${category.name}</option>
                                    </#list>
                                </#if>
                            </select>
                            <select multiple class="form-control select2" size="8" name="diconIds" id="diconIds">
                            </select>
                            <#if item?? ><@spring.bind "item.diconIds" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="memo" value="${(item.memo)!}">
                            <#if item?? ><@spring.bind "item.memo" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary float-right" id="btn-submit">提 交</button>
                    <button type="button" class="btn btn-default float-right" id="btn-back">取 消</button>
                </div>
                <!-- /.box-footer -->
            </form>
        </div>
    </div>
</section>


<aidata-script>
    <script>
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
    </script>
</aidata-script>
