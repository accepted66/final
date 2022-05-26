<#include "../global/nav_app.ftl">

<section class="content">
    <div class="container-fluid">

        <div class="card">
            <div class="card-header">
                <h3 class="card-title"></h3>
                <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <a href="${request.contextPath}/ad/space/edit?app=${(req.app)!}">
                            <button id="return-button" type="button" class="btn btn-primary">新增</button>
                        </a>
                    </div>
                </div>
            </div>

            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover ">
                    <thead>
                    <tr>
                        <th>坑位id</th>
                        <th>广告位名称</th>
                        <th>广告类型</th>
                        <th>广告权重配置</th>
                        <th>创建时间 / 修改时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list list as item>
                        <tr>
                            <td>${(item.sid)!}</td>
                            <td>${(item.name)!}</td>
                            <#assign adType = controller.enum2name("global.adType", ((item.adType)?c)!)! />
                            <td>${(adType)!}</td>
                            <td>
                                <#if item?? && item.configJsonObj??>
                                    <table class="table table-striped">
                                        <tr>
                                            <th>平台</th>
                                            <th>ID</th>
                                            <th>名称</th>
                                            <th>权重</th>
                                        </tr>
                                        <#list item.configJsonObj.ads as cfg>
                                            <tr>
                                                <#assign platform = controller.enum2name("global.adPlatform", (cfg.platform)!)! />
                                                <td>${(platform)!}</td>
                                                <td>${(cfg.id)!}</td>
                                                <td>${(cfg.name)!}</td>
                                                <td>${(cfg.weight)!}%</td>
                                            </tr>
                                        </#list>
                                    </table>
                                </#if>
                            </td>
                            <td>
                                ${((item.createTime)?string("yyyy-MM-dd HH:mm:ss"))!}<br/>
                                ${((item.updateTime)?string("yyyy-MM-dd HH:mm:ss"))!}
                            </td>
                            <td><a href="${request.contextPath}/ad/space/edit?id=${item.id}">编 辑</a></td>
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
                "order": [[0, "desc"]],
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
    </script>
</aidata-script>

