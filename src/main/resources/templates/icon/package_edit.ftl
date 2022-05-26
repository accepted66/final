<#import "../global/spring.ftl" as spring>
<#include "../global/modal.ftl">
<section class="content-header">
    <div class="container-fluid">
        <h1>图标包</h1>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                </h3>
                <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <div class="float-right">
                            <a href="${request.contextPath}/icon/category/edit?id=${(item.parentId)!}" class="btn btn-primary">
                                返回图标分类
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- form start -->
            <form class="form-horizontal" id="form2" enctype="multipart/form-data"
                  action="${request.contextPath}/icon/package/save_or_update" method="post">
                <input type="hidden" value="${(item.id)!}" name="id"/>
                <input type="hidden" value="${(item.parentId)!}" name="parentId"/>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>展示顺序</label>
                                <input type="text" class="form-control" name="rank" value="${(item.rank)!}">
                                <#if item?? ><@spring.bind "item.rank" /><@spring.showErrors ""/></#if>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>创作者</label>
                                <input type="text" class="form-control" name="author" value="${(item.author)!}">
                                <#if item?? ><@spring.bind "item.author" /><@spring.showErrors ""/></#if>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <#if item?? && item.id??  >
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>展示状态</label>
                                    <div>
                                        <input type="radio" name="status" value="1" <#if item.status==1>checked</#if>>
                                        显示 &nbsp;&nbsp;
                                        <input type="radio" name="status" value="2" <#if item.status==2>checked</#if>>
                                        隐藏
                                        <#if item?? ><@spring.bind "item.status" /><@spring.showErrors ""/></#if>
                                    </div>
                                </div>
                            </div>
                        <#else >
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>发布选项</label>
                                    <div>
                                        <input type="radio" name="publish" value="0" checked> 手动发布 &nbsp;&nbsp;
                                        <input type="radio" name="publish" value="1"> 定时发布
                                    </div>
                                </div>
                            </div>
                        </#if>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>发布时间</label>
                                <input type="text" class="form-control float-right" id="reservationtime"
                                       name="scheduleTime">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>使用次数</label>
                                <input type="text" class="form-control" name="subscribes" value="${(item.subscribes)!0}">
                                <#if item?? ><@spring.bind "item.subscribes" /><@spring.showErrors ""/></#if>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>跳转链接</label>
                                <input type="text" class="form-control" name="jumpUrl" value="${(item.jumpUrl)!}">
                                <#if item?? ><@spring.bind "item.jumpUrl" /><@spring.showErrors ""/></#if>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="card-footer">
                    <#if item?? && item.id??  >
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-confirm"
                                data-action="${request.contextPath}/icon/package/delete?id=${item.id!}">删 除
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

<!-- 图标包列表 -->

<#if item?? && item.id?? && icons??  >
    <section class="content-header">
        <div class="container-fluid">
            <h1>图标列表</h1>
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">
                        <form class="form-inline" enctype="multipart/form-data"
                              onkeydown="if(event.keyCode==13){return false;}"
                              action="${request.contextPath}/icon/package/upload" method="post">
                            <div class="form-group">
                                <input type="file" class="form-control" name="iconFile" id="iconFile">
                                <input type="hidden" class="form-control" name="catId" value="${item.id}">
                            </div>
                            &nbsp;&nbsp;
                            <button id="add-button" type="submit" class="btn btn-primary">上 传</button>
                            <label>上传支持格式:png,jpg,jpeg,bmp,gif,zip</label>
                        </form>
                    </h3>
                    <div class="card-tools">
                    </div>
                </div>
               <#if icons??>
                   <div class="card-body table-responsive p-0">
                       <ul class="users-list">
                        <#list icons as icon>
                            <li>
                                <img src="${icon.iconUrl}" alt="${icon.iconUrl}">
                                <a class="users-list-name" href="/icon/icon/delete?id=${icon.id}">删 除</a>
                                <span class="users-list-date">${icon.iconUrl}</span>
                            </li>
                        </#list>
                       </ul>
                   </div>
                </#if>
            </div>
        </div>
    </section>
</#if>

<aidata-script>
    <script>
        $(document).ready(function () {
            $('#reservationtime').daterangepicker({
                timePicker: true,
                timePickerIncrement: 10,
                singleDatePicker: true,
                timePicker24Hour: true,
                startDate: moment().startOf('hour'),
                locale: {
                    format: 'YYYY-MM-DD HH:mm:ss'
                }
            })
        });
    </script>
</aidata-script>