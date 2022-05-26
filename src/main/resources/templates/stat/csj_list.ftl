<#include "../global/nav_app.ftl">
<#if info??>
    <section class="content-header">
        <div class="container-fluid">
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h5><i class="icon fas fa-check"></i> Alert!</h5>
                ${info!}
            </div>
        </div>
    </section>
</#if>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <form id="form1" class="form-inline" action="${request.contextPath}/stat/csj/list">
                        <input type="hidden" name="app" value="${(req.app)!}"/>
                        <input type="hidden" id="hiddenStartDate" name="startDate" value="${(req.startDate)!}"/>
                        <input type="hidden" id="hiddenEndDate" name="endDate" value="${(req.endDate)!}"/>
                        <input type="text" class="form-control pull-right" id="searchTime" placeholder=""
                               style="width: 200px"/>
                    </form>
                </h3>
                <div class="card-tools">
                    <div class="float-right">
                        <button id="btn-upload" type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#modal-upload">数据导入
                        </button>
                        <button id="btn-search" type="button" class="btn btn-primary">查 询</button>
                    </div>
                </div>
            </div>
            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover nowrap">
                    <thead>
                    <tr>
                        <th>日期</th>
                        <th>新增</th>
                        <th>活跃</th>
                        <#if req?? && req.app == 'icon'>
                            <th>实际活跃</th>
                        </#if>
                        <th>开屏展示量</th>
                        <th>激励视频展示量</th>
                        <#if req?? && req.app == 'icon'>
                            <th>信息流展示量</th>
                        </#if>
                        <th>开屏收益(元)</th>
                        <th>激励视频收益(元)</th>
                        <#if req?? && req.app == 'icon'>
                            <th>信息流收益(元)</th>
                        </#if>
                        <th>总收益(元)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list list as item>
                        <tr>
                            <td>${((item.reportDate)?string("yyyy-MM-dd"))!}</td>
                            <td>${(item.umNewUsers)?string(",##0")!'-'}</td>
                            <td>${(item.umActiveUsers)?string(",##0")!'-'}</td>
                            <#if req?? && req.app == 'icon'>
                                <td>
                                    ${(item.iconActiveUsers)?string(",##0")!'-'}
                                </td>
                            </#if>
                            <td>
                                ${(item.openImpression)?string(",##0")!'-'}
                                /
                                ${(mathUtil.mul(item.openImpressionRate,100))?string(',##0.00')!'-'}
                                %
                            </td>
                            <td>${(item.powerImpression)?string(",##0")!'-'}
                                /
                                ${(mathUtil.mul(item.powerImpressionRate,100))?string(',##0.00')!'-'}
                                %
                            </td>
                            <#if req?? && req.app == 'icon'>
                                <td>${(item.infoImpression)?string(",##0")!'-'}
                                    /
                                    ${(mathUtil.mul(item.infoImpressionRate,100))?string(',##0.00')!'-'}
                                    %
                                </td>
                            </#if>
                            <td>${(item.openIncome)?string(",##0.00")!'-'}
                                /
                                ${(mathUtil.mul(item.openIncomeRate,100))?string(',##0.00')!'-'}
                                %
                            </td>
                            <td>${(item.powerIncome)?string(",##0.00")!'-'}
                                /
                                ${(mathUtil.mul(item.powerIncomeRate,100))?string(',##0.00')!'-'}
                                %
                            </td>
                            <#if req?? && req.app == 'icon'>
                                <td>${(item.infoIncome)?string(",##0.00")!'-'}
                                    /
                                    ${(mathUtil.mul(item.infoIncomeRate,100))?string(',##0.00')!'-'}
                                    %
                                </td>
                            </#if>
                            <td>${(item.totalIncome)?string(",##0.00")!'-'}</td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="modal-upload">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">数据导入</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form2" class="form-inline" enctype="multipart/form-data"
                      action="${request.contextPath}/stat/csj/import"
                      method="post">
                    <div class="form-group">
                        <input type="file" class="form-control" name="file" id="file" accept="xlsx">
                    </div>
                    <label>上传支持格式:xlsx</label>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">取 消</button>
                <span class="align-content-center " id="tip"></span>
                <button id="btn-import" type="button" class="btn btn-primary">导 入</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<aidata-script>
    <script>
        $(document).ready(function () {
            $('#btn-search').click(function (event) {
                $('#form1').submit();
            });
            $('#btn-import').click(function (event) {
                $('#tip').text("正在导入...");
                $('#btn-import').attr("disabled", "disabled");
                $('#form2').submit();
            });
            $('#topapp_table').DataTable({
                "paging": true,
                "lengthChange": true,
                "iDisplayLength": 50,
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
                    leftColumns: 1
                }
            });
        });
    </script>
</aidata-script>