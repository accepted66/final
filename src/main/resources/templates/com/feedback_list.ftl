<#include "../global/nav_app.ftl">

<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <form id="form1" class="form-inline" action="${request.contextPath}/feedback/list">
                        <input type="hidden" name="app" value="${(req.app)!}"/>
                        <div class="row">
                            <div class="col-2">
                                <select class="form-control" name="category" id="category">
                                    <option value="">全部反馈</option>
                                    <#if feedbackMap??>
                                        <#list feedbackMap?keys as key>
                                            <option value="${key}"
                                                    <#if (req?? && req.category?? && key == req.category)>selected</#if> >${feedbackMap[key]}</option>
                                        </#list>
                                    </#if>
                                </select>
                            </div>
<#--                            <div class="col-2">
                                <select class="form-control" name="action" id="action">
                                    <option value="">全部状态</option>
                                    <option value="1" <#if (req?? && req.action?? && "1" == req.action)>selected</#if> >已处理</option>
                                    <option value="0" <#if (req?? && req.action?? && "0" == req.action)>selected</#if> >未处理</option>
                                </select>
                            </div>-->
                            <div class="col-2">
                                <select class="form-control" name="action" id="action">
                                    <option value="">全部状态</option>
                                    <#if actionMap??>
                                        <#list actionMap?keys as key>
                                            <option value="${key}"
                                                    <#if (req?? && req.action?? && key == req.action)>selected</#if> >${actionMap[key]}</option>
                                        </#list>
                                    </#if>
                                </select>
                            </div>
                            <div class="col-2">
                                <input type="text" class="form-control" placeholder="品牌" name="brand"
                                       value="${(req.brand)!}">
                            </div>
                            <div class="col-2">
                                <input type="text" class="form-control" placeholder="机型" name="model"
                                       value="${(req.model)!}">
                            </div>
                            <div class="col-2">
                                <input type="text" class="form-control" placeholder="内容" name="content"
                                       value="${(req.content)!}">
                            </div>
                        </div>
                    </form>
                </h3>
                <div class="card-tools">
                    <div class="float-right">
                        <button id="btn-search" type="button" class="btn btn-primary">查 询</button>
                    </div>
                </div>
            </div>
            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover">
                    <thead>
                    <tr>
                        <th width="5%">ID</th>
                        <th width="10%">品牌</th>
                        <th width="10%">机型</th>
                        <th width="5%">版本</th>
                        <th width="45%">内容</th>
                        <th width="15%">时间</th>
                        <th width="10%">处理</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list pageInfo.list as item>
                        <tr>
                            <td>${(item.id)!}</td>
                            <td>${(item.brand)!}</td>
                            <td>${(item.model)!}</td>
                            <td>${(item.version)!}</td>
                            <td>${(item.content)!}</td>
                            <td>${((item.createTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                            <td>
                                <#if item.category??>
                                    <#if item.action??>
                                        <#assign action=controller.enum2name("feedback.action",(item.action)?string)>
                                        ${(action)!}
                                    <#else>
                                        <a href="./action?id=${(item.id)}&action=1">待处理</a>
                                    </#if>
                                    <#else>
                                    -
                                </#if>
                            </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
                <#import "../global/page.ftl" as cast/>
                <@cast.page pageNo=pageInfo.pageNum totalPage=pageInfo.pages showPages=10 call="jump" total=pageInfo.total/>
            </div>

        </div>
    </div>
</section>

<aidata-script>
    <script>
        $(document).ready(function () {
            $('#btn-search').click(function (event) {
                $('#form1').submit();
            });
        });
    </script>
</aidata-script>

