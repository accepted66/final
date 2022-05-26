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
            <form class="form-horizontal" id="form2" enctype="multipart/form-data"
                  action="${request.contextPath}/ad/save_or_update" method="post">
                <input type="hidden" name="id" value="${(item.id)!}"/>
                <input type="hidden" name="app" value="${(item.app)!}"/>
                <input type="hidden" name="image" value="${(item.image)!}">
                <div class="card-body">
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">应用</label>
                        <#assign appName=controller.enum2name("global.app",(item.app)?string) >
                        <div class="col-sm-10">
                            <input type="text" class="form-control" value="${appName!}" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">广告简介</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="intro" value="${(item.intro)!}">
                            <#if item?? ><@spring.bind "item.intro" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">广告类型</label>
                        <div class="col-sm-10">
                            <select class="form-control select2" style="width: 100%;" name="position">
                                <#if positions??>
                                    <#list positions?keys as key>
                                        <option value="${key}"
                                                <#if (item?? && (item.position)?? && (item.position)?string == key)>selected</#if> >${positions[key]}</option>
                                    </#list>
                                </#if>
                            </select>
                            <#if item?? ><@spring.bind "item.position" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">广告位置</label>
                        <div class="col-sm-10">
                            <select class="form-control select2" style="width: 100%;" name="location">
                                <#if locations??>
                                    <#list locations?keys as key>
                                        <option value="${key}"
                                                <#if (item?? && (item.location)?? && (item.location)?string == key)>selected</#if> >${locations[key]}</option>
                                    </#list>
                                </#if>
                            </select>
                            <#if item?? ><@spring.bind "item.location" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">广告链接</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="url" value="${(item.url)!}">
                            <#if item?? ><@spring.bind "item.url" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="inputFile">广告图片</label>
                        <input type="file" id="inputFile" name="file">
                        <#if item?? ><@spring.bind "item.image" /><@spring.showErrors ""/></#if>
                        <#if item?? && item.image??  >
                            <img src="${(item.image)!}" width="200"/><br/>
                        </#if>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="card-footer">
                    <#if item?? && item.id??  >
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-confirm"
                                data-action="${request.contextPath}/ad/delete?id=${item.id!}">删 除
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
