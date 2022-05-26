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
            <!-- form start -->
            <form class="form-horizontal" id="form1" enctype="multipart/form-data"
                  action="${request.contextPath}/resource/save_or_update" method="post">
                <input type="hidden" value="${(item.id)!}" name="id"/>
                <input type="hidden" value="${(item.categoryId)!}" name="categoryId"/>
                <div class="card-body">
                    <div class="form-group">
                        <label>展示顺序</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="rank" value="${(item.rank)!}">
                            <#if item?? ><@spring.bind "item.rank" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">音频文件名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="name" value="${(item.name)!}">
                            <#if item?? ><@spring.bind "item.name" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">资源url</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="url" value="${(item.url)!}">
                            <#if item?? ><@spring.bind "item.url" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">上传资源文件</label>
                        <input type="file" id="inputFile" name="file">
                        <#if item?? ><@spring.bind "item.url" /><@spring.showErrors ""/></#if>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">上传资源说明</label>
                        <p>上传资源文件和手填url不能同时为空，如果都填写则上传资源文件将覆盖手填资源url</p>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="card-footer">
                    <#if item?? && item.id??  >
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-confirm"
                                data-action="${request.contextPath}/resource/delete?id=${item.id!}">删 除
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