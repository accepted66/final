<#import "../global/spring.ftl" as spring>
<#include "../global/modal.ftl">
<section class="content-header">
    <div class="container-fluid">
        <h1>音效分类</h1>
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
                            <a href="${request.contextPath}/resource/category/list">
                                <button id="return-button" type="button" class="btn btn-primary">返回音效列表</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- form start -->
            <form class="form-horizontal" id="form2"
                  action="${request.contextPath}/resource/category/save_or_update" method="post">
                <input type="hidden" value="${(item.id)!}" name="id"/>
                <input type="hidden" value="${(item.group)!}" name="group"/>
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
                                <label>分类名称</label>
                                <input type="text" class="form-control" name="name" value="${(item.name)!}">
                                <#if item?? ><@spring.bind "item.name" /><@spring.showErrors ""/></#if>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <#if item?? && item.id??  >
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>展示状态</label>
                                    <div>
                                        <input type="radio" name="state" value="1" <#if item.state==1>checked</#if>>
                                        显示 &nbsp;&nbsp;
                                        <input type="radio" name="state" value="2" <#if item.state==2>checked</#if>>
                                        隐藏
                                        <#if item?? ><@spring.bind "item.state" /><@spring.showErrors ""/></#if>
                                    </div>
                                </div>
                            </div>
                        </#if>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="card-footer">
                    <#if item?? && item.id??  >
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-confirm"
                                data-action="${request.contextPath}/resource/category/delete?id=${item.id!}">删 除
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

<!-- 音效列表 -->

<#if item?? && item.id?? && resources??  >
    <section class="content-header">
        <div class="container-fluid">
            <h1>音效列表</h1>
        </div>
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

                                <a href="${request.contextPath}/resource/edit?catId=${(item.id)!}">
                                    <button id="return-button" type="button" class="btn btn-primary">新 增</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body table-responsive ">
                    <table id="topapp_table" class="table table-hover ">
                        <thead>
                        <tr>
                            <th width="4%">id</th>
                            <th width="10%">展示顺序</th>
                            <th width="10%">音效名称</th>
                            <th width="15%">资源</th>
                            <th width="10%">使用次数</th>
                            <th width="10%">发布时间</th>
                            <th width="10%">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list resources as res>
                            <tr>
                                <td>${(res.id)!}</td>
                                <td>${(res.rank)!}</td>
                                <td>${(res.name)!}</td>
                                <td>
                                    <audio src="${(res.url)!}" controls="controls" preload="none"></audio>
                                    &nbsp;<a href="${(res.url)!}" target="_blank">文件</a>
                                </td>
                                <td>暂无</td>
                                <td>${((res.createTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                                <td><a href="${request.contextPath}/resource/edit?id=${(res.id)!}">编 辑</a></td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                    <#--
                    <#import "../global/page.ftl" as cast/>
                    <@cast.page pageNo=pageInfo.pageNum totalPage=pageInfo.pages showPages=10 call="jump" total=pageInfo.total/>
                    -->
                </div>
            </div>
        </div>
    </section>
</#if>

<aidata-script>
    <script>
        $(document).ready(function () {
            $('#topapp_table').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "order": [[1, "desc"]],
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
    </script>
</aidata-script>