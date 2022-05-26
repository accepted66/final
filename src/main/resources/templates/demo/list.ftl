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
                    列表
                </h3>
                <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <div class="float-right">
                            <a href="${request.contextPath}/demo/edit" class="btn btn-primary">
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
                        <th>id</th>
                        <th>文件名</th>
                        <th>提交者</th>
                        <th>校对者</th>
                        <th>所在单位</th>
                        <th>电话</th>
                        <th>邮箱</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="items">
                    <#list list as item>
                        <tr>
                            <td>${(item.id)!}</td>
                            <td>${(item.fileName)!}</td>
                            <td>${(item.creator)!}</td>
                            <td>${(item.checker)!}</td>
                            <td>${(item.company)!}</td>
                            <td>${(item.mobile)!}</td>
                            <td>${(item.email)!}</td>
                            <td>
                                <a href="${request.contextPath}/demo/view?id=${(item.id)!}">查 看</a>
                                <a href="${request.contextPath}/demo/download?id=${(item.id)!}">下 载</a>
                                <a href="${request.contextPath}/demo/delete?id=${(item.id)!}">删 除</a>
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