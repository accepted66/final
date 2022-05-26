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
                  action="${request.contextPath}/dicon/dicon/save_or_update" method="post">
                <input type="hidden" value="${(item.id)!}" name="id"/>
                <input type="hidden" value="${(item.iconUrl)!}" name="iconUrl"/>
                <input type="hidden" value="${(item.animGifUrl)!}" name="animGifUrl"/>
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
                        <label for="inputPassword3" class="col-sm-2 control-label">图标名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="iconName" value="${(item.iconName)!}">
                            <#if item?? ><@spring.bind "item.iconName" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">动效名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="animName" value="${(item.animName)!}">
                            <#if item?? ><@spring.bind "item.animName" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">价格(元)</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="price" value="${(item.price)!}">
                            <#if item?? ><@spring.bind "item.price" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">价格修改历史</label>
                        <div class="col-sm-10">
                            <#if product??>
                                ${(controller.showPriceHistory(product.history))!}
                            </#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">动效标识</label>
                        <div class="col-sm-10">
                            <select class="form-control select2" style="width: 100%;" name="animSign">
                                <#if animSigns??>
                                    <#list animSigns?keys as key>
                                        <option value="${key}"
                                                <#if (item?? && (item.animSign)?? && (item.animSign)?string == key)>selected</#if> >${animSigns[key]}</option>
                                    </#list>
                                </#if>
                            </select>
                            <#if item?? ><@spring.bind "item.animSign" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">动效效果</label>
                        <div class="col-sm-10">
                            <select class="form-control select2" style="width: 100%;" name="scale">
                                <#if scales??>
                                    <#list scales?keys as key>
                                        <option value="${key}"
                                                <#if (item?? && (item.scale)?? && (item.scale)?string == key)>selected</#if> >${scales[key]}</option>
                                    </#list>
                                </#if>
                            </select>
                            <#if item?? ><@spring.bind "item.scale" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">图标</label>
                        <input type="file" id="inputFile" name="file">
                        <#if item?? ><@spring.bind "item.iconUrl" /><@spring.showErrors ""/></#if>
                        <#if item?? && item.iconUrl??  >
                            <img src="${(item.iconUrl)!}"/><br/>
                        </#if>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">动效gif</label>
                        <input type="file" id="inputFile" name="file">
                        <#if item?? ><@spring.bind "item.animGifUrl" /><@spring.showErrors ""/></#if>
                        <#if item?? && item.animGifUrl??  >
                            <img src="${(item.animGifUrl)!}"/><br/>
                        </#if>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">推荐音频</label>
                        <div class="col-sm-10">
                            <select class="form-control select2" style="width: 100%;" name="resId">
                                <option value="">请选择</option>
                                <#if resources??>
                                    <#list resources as res>
                                        <option value="${res.value0}" <#if (item.resId?? && item.resId==res.value0)>selected</#if>>${res.value1}</option>
                                    </#list>
                                </#if>
                            </select>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="card-footer">
                    <#if item?? && item.id??  >
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-confirm"
                                data-action="${request.contextPath}/dicon/dicon/delete?id=${item.id!}">删 除
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