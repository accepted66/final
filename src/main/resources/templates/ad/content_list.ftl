<#include "../global/nav_app.ftl">

<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title"></h3>
                <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <div class="box-tools pull-right">
                            <a href="${request.contextPath}/ad/edit?app=${(req.app)!}" class="btn btn-primary">
                                新 增
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover ">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>简介</th>
                        <th>广告类型</th>
                        <th>位置</th>
                        <th>配图</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list list as item>
                        <tr>
                            <td>${(item.id)!}</td>
                            <td>${(item.intro)!}</td>
                            <#assign position=controller.enum2name("global.adType",(item.position)?string)>
                            <td>${(position)!}</td>
                            <#assign location=controller.enum2name("global.iconAdLocation",(item.location)?string)>
                            <td>${(location)!}</td>
                            <td><img src="${(item.image)!}" width="200" /></td>
                            <td>${((item.createTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                            <td><a href="${request.contextPath}/ad/edit?id=${item.id}">编 辑</a></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<aidata-script>
    <script>
        $(document).ready(function () {
            $('#topapp_table').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "order": [[2, "desc"]],
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
    </script>
</aidata-script>
