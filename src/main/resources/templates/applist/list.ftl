<#import "../global/spring.ftl" as spring>

<section class="content-header">
    <div class="container-fluid">
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
                            <a href="${request.contextPath}/cache/clean?keyPrefix=icon:applist" class="btn btn-primary">
                                更新缓存
                            </a>
                            <a href="${request.contextPath}/applist/edit" class="btn btn-primary">
                                新 增
                            </a>
                            <a href="${request.contextPath}/feedback/list?app=ios_icon&category=1" class="btn btn-primary">
                                缺失应用
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover ">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>应用ID</th>
                        <th>应用图标</th>
                        <th>应用名称</th>
                        <th>索引</th>
                        <th>Bundle ID</th>
                        <th>scheme</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="items">
                    <#list list as item>
                        <tr>
                            <td>${(item.id)!}</td>
                            <td>${(item.appId)!}</td>
                            <td><img src="${(item.icon)!}" width="40" height="40"/></td>
                            <td>${(item.appName)!}</td>
                            <td>${(item.index)!}</td>
                            <td>${(item.bundleId)!}</td>
                            <td>${(item.scheme)!}</td>
                            <td>
                                <a href="${request.contextPath}/applist/edit?id=${(item.id)!}">编 辑</a>
                            </td>
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
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "order": [[0, "desc"]],
                "info": true,
                "autoWidth": true,
                "responsive": true,
            });
        });
    </script>
</aidata-script>