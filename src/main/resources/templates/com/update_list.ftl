<#include "../global/nav_app.ftl">
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-12">
                <h6>规则：
                    1、升级范围有重叠的，优先按升级最高版本；
                    2、升级不允许有两个强制升级/手动升级同时开启；
                    3、强制升级和手动升级同时开启时，优先强制升级。</h6>
            </div>
        </div>
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
                        <div class="box-tools pull-right">
                            <a href="/update/edit?app=${(req.app)!}">
                                <button id="return-button" type="button" class="btn btn-primary">新 增</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover nowrap">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>版本</th>
                        <th>升级方式</th>
                        <th>更新方式</th>
                        <th width="25%">升级提示</th>
                        <th>状态</th>
                        <th width="25%">地址<br/>MD5值</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list pageInfo.list as item>
                        <tr>
                            <td>${(item.id)!}</td>
                            <td>${(item.v)!}</td>
                            <#assign force = controller.enum2name("update.force", ((item.force)?string)!)! />
                            <#assign from = controller.enum2name("update.from", (item.from)!)! />
                            <td>
                                <p>${(force)!}</p>
                            </td>
                            <td>
                                <p>${(from)!}</p>
                            </td>
                            <td>${(item.content)!}</td>
                            <#assign status=controller.enum2name("global.status",(item.status)?string)>
                            <td>
                                <#--${(status)!}-->
                                <input type="checkbox" name="status" data-bootstrap-switch data-id="${(item.id)!}" <#if (item.status == 1)>checked</#if>>
                            </td>
                            <td>
                                <p>${(item.url)!}</p>
                                <p>${(item.md5)!}</p>
                            </td>
                            <td>${((item.createTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                            <td>
                                <a href="/update/edit?id=${(item.id)!}">编 辑</a>
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
                "paging": false,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "order": [[0, "desc"]],
                "info": true,
                "autoWidth": false,
                "responsive": true,
                scrollY: "300px",
                scrollX: true,
                scrollCollapse: true,
                fixedColumns: {
                    leftColumns: 2,
                    rightColumns: 1
                }
            });
        });
        $("input[data-bootstrap-switch]").each(function(){
            $(this).bootstrapSwitch('state', $(this).prop('checked'));
        });
        $("input[data-bootstrap-switch]").on('switchChange.bootstrapSwitch',function(event,state){
            window.location.href = "/update/switch?id="+$(this).attr("data-id")+"&state="+state;
        });

    </script>
</aidata-script>