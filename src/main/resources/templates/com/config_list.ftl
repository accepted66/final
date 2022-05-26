<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>配置列表</h1>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title"></h3>
                <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <a href="${request.contextPath}/cache/clean?keyPrefix=common" class="btn btn-primary">
                            更新缓存
                        </a>
                    </div>
                </div>
            </div>

            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover ">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>key</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <#list list as item>
                        <tr>
                            <td>${(item.id)!}</td>
                            <td>${(item.key)!}</td>
                            <td><a href="${request.contextPath}/config/edit?id=${item.id}">编 辑</a></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>