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
            <form class="form-horizontal form-label-left" onkeydown="if(event.keyCode==13){return false;}"
                  method="post" action="/update/save_or_update" enctype="multipart/form-data">
                <input type="hidden" name="app" value="${(item.app)!}"/>
                <input type="hidden" name="id" value="${(item.id)!}"/>
                <div class="card-body">
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">应用</label>
                        <#assign appName=controller.enum2name("global.app",(item.app)?string) >
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control" value="${appName!}" readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="v">版本 <span
                                    class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="v" name="v" required="required"
                                   class="form-control" value="${(item.v)!}">
                            <#if item?? ><@spring.bind "item.v" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="force" class="control-label col-md-3 col-sm-3 col-xs-12">升级方式<span
                                    class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12" style="line-height: 35px;">
                            <input type="radio" name="force" value="0" required="required"
                                   <#if item?? && item.force?? && item.force==0>checked</#if>> 普通升级 &nbsp;&nbsp;
                            <input type="radio" name="force" value="1" required="required"
                                   <#if item?? && item.force?? && item.force==1>checked</#if>> 强制升级
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="content" class="control-label col-md-3 col-sm-3 col-xs-12">升级提示<span
                                    class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea name="content" id="content" placeholder="请输入描述" rows="3"
                                              class="form-control">${(item.content)!}</textarea>
                            <#if item?? ><@spring.bind "item.content" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="channel" class="control-label col-md-3 col-sm-3 col-xs-12">渠道<span
                                    class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="channel" id="channel" class="form-control select2" required="required">
                                <option value="">请选择渠道</option>
                                <#list channels as channel>
                                    <option value="${channel.code}"
                                            <#if item?? && item.channel?? && item.channel==channel.code>selected</#if> >${channel.name}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pkgFile" class="control-label col-md-3 col-sm-3 col-xs-12">更新方式<span
                                    class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="radio" name="from" value="server" <#if item?? && item.from?? && item.from=="server">checked</#if>> 官方(上传包) &nbsp;&nbsp;
                            <input type="radio" name="from" value="market" <#if item?? && item.from?? && item.from=="market">checked</#if>> 应用市场(填写链接)
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pkgFile" class="control-label col-md-3 col-sm-3 col-xs-12">上传包<span
                                    class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="file" id="pkgFile" name="pkgFile"
                                   class="form-control col-md-7 col-xs-12" accept=".apk">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="url">链接 <span
                                    class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="url" name="url"
                                   class="form-control" value="${(item.url)!}">
                            <#if item?? ><@spring.bind "item.url" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="force" class="control-label col-md-3 col-sm-3 col-xs-12">状态<span
                                    class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12" style="line-height: 35px;">
                            <input type="radio" name="status" value="0" required="required"
                                   <#if item.status == 0>checked</#if> > 禁用 &nbsp;&nbsp;
                            <input type="radio" name="status" value="1" required="required"
                                   <#if item.status == 1>checked</#if> > 启用
                        </div>
                    </div>

                </div>
                <!-- /.box-body -->
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary float-right">提 交</button>
                    <button type="button" class="btn btn-default float-right" id="btn-back">取 消</button>
                </div>
                <!-- /.box-footer -->
            </form>
        </div>
    </div>
</section>
