<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>分类 "${(category.name)!}" 下轮播图列表</h1>
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
                        <div class="box-tools pull-right">
                            <a href="${request.contextPath}/roll/edit?rollNo=${(rollNo)!}" class="btn btn-primary">
                                新 增
                            </a>
                            <a href="${request.contextPath}/icon/category" class="btn btn-primary">
                                返回图标分类
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
                        <th>排位</th>
                        <th>图片</th>
                        <th>标签</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list list as item>
                        <tr>
                            <td>${(item.id)!}</td>
                            <td>${(item.rank)!}</td>
                            <td><a href="${(item.targetUrl)!}" title="${(item.targetUrl)!}"><img src="${(item.imgUrl)!}"
                                                                                                 width="200"/></a></td>
                            <#--<#assign label = controller.enum2name("roll.label", (item.label)!)! />-->
                            <td>${(label)!}</td>
                            <td>${((item.createTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                            <td><a href="${request.contextPath}/roll/edit?id=${item.id}">编 辑</a></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
