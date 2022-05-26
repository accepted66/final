<#include "../global/nav_app.ftl">

<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <form id="form1" class="form-inline" action="${request.contextPath}/push/list">
                        <input type="hidden" name="app" value="${(req.app)!}"/>
                        <div class="row">
                            <div class="col-8">
                                <input type="text" class="form-control" placeholder="内容" id="searchKey" name="searchKey"
                                       value="${(req.searchKey)!}">
                            </div>
                            <div class="col-4">
                                <select class="form-control" name="status" id="status">
                                    <option value="">全部</option>
                                    <option value="1"  <#if req.status! =="1">selected</#if>>已发送</option>
                                    <option value="-1" <#if req.status! =="-1">selected</#if>>定时中</option>
                                    <option value="-2" <#if req.status! =="-2">selected</#if>>已关闭</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </h3>
                <div class="card-tools">
                    <div class="float-right">
                        <button id="btn-search" type="button" class="btn btn-primary">查询</button>
                        <button id="btn-add" type="button" class="btn btn-success">新 增</button>
                    </div>
                </div>
            </div>
            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover">
                    <thead>
                    <tr>
                        <th width="5%">ID</th>
                        <th width="10%">任务名</th>
                        <th width="10%">标题</th>
                        <th width="30%">内容</th>
                        <th width="10%">用户量</th>
                        <th width="10%">状态</th>
                        <th width="20%">发送时间</th>
                        <th width="20%">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list pageInfo.list as item>
                        <tr>
                            <td>${(item.id)!}</td>
                            <td>${(item.taskName)!}</td>
                            <td>${(item.pushTitle)!}</td>
                            <td>${(item.pushContent)!}</td>
                            <td>${(item.sidCount)!}</td>
                            <td>
                                <#if item.status==1>已发送</#if>
                                <#if item.status==0>发送中</#if>
                                <#if item.status==-1>定时中</#if>
                                <#if item.status==-2>已关闭</#if>
                            </td>
                            <td>${((item.createTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                            <td>
                                <a href="/push/showadd?app=${(req.app)}&id=${(item.id)!}">编辑</a>
                                <#if item.status==-1><a href="javascript:closeTask(${(item.id)!})">关闭</a></#if>
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

            $('#btn-add').click(function (event) {
                window.location = "${request.contextPath}/push/showadd?app=${(req.app)!}"
            });
        });

        //关闭任务：只有定时未发送任务可以关闭
        function closeTask(id) {
            $.ajax({
                type: 'GET',
                url: '${request.contextPath}/push/closePushTask?id=' + id,
                success: (data, status) => {
                    if (data.code == "OK") {
                        window.location = "/push/list?pageIndex=#{(pageInfo.pageNum)!1}"
                    } else {
                        alert("系统错误,请稍后再试");
                    }
                },
            });
        }
    </script>
</aidata-script>

