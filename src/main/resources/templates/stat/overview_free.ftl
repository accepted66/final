<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-12">
                <h6>
                    总用户数&nbsp;&nbsp;&nbsp;&nbsp;
                    换图标&nbsp;:&nbsp;${(icon.totalUsers)?string(",###")!'-'} &nbsp;&nbsp;&nbsp;&nbsp;
                    隐身精灵&nbsp;:&nbsp;${(hm.totalUsers)?string(",###")!'-'} &nbsp;&nbsp;&nbsp;&nbsp;
                    百变语音包&nbsp;:&nbsp;
                    <#if vo?? && vo.totalUsers??>
                    ${(vo.totalUsers)?string(",###")!'-'}
                <#else>
                    -
                    </#if>&nbsp;&nbsp;&nbsp;&nbsp;
                    一键换图标&nbsp;:&nbsp;
                    <#if ios_icon?? && ios_icon.totalUsers??>
                    ${(ios_icon.totalUsers)?string(",###")!'-'}
                <#else>
                    -
                    </#if>&nbsp;&nbsp;&nbsp;&nbsp;
                </h6>
            </div>
        </div>
    </div>
</section>
<#include "../global/nav_app.ftl">
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <form id="form1" class="form-inline" action="${request.contextPath}/stat/overview/list">
                        <input type="hidden" name="app" value="${(req.app)!}"/>
                        <input type="hidden" id="hiddenStartDate" name="startDate" value="${(req.startDate)!}"/>
                        <input type="hidden" id="hiddenEndDate" name="endDate" value="${(req.endDate)!}"/>
                        <input type="text" class="form-control pull-right" id="searchTime" style="width: 200px"/>
                    </form>
                </h3>
                <div class="card-tools">
                    <div class="float-right">
                        <button id="btn-search" type="button" class="btn btn-primary">查 询</button>
                    </div>
                </div>
            </div>
            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover nowrap">
                    <thead>
                    <tr>
                        <th>日期</th>
                        <th title="友盟新增">新增</th>
                        <th title="友盟活跃">活跃</th>
                        <th>广告收入</th>
                        <th title="当日总收入/活跃用户">活跃ARPU</th>
                        <th title="当日广告广告收入/活跃用户">活跃广告ARPU</th>
                        <th title="当日总收入/新增用户数">新增ARPU</th>
                        <th title="当日广告总收入/新增用户数">新增广告ARPU</th>
                        <th>穿山甲收入</th>
                        <th>广点通收入</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#assign totalPayMoney = 0 />
                    <#assign totalAdMoney = 0 />
                    <#assign totalAllMoney = 0 />
                    <#list pageInfo.list as item>
                        <tr>
                            <td>${((item.reportDate)?string("yyyy-MM-dd"))!}</td>
                            <td>${(item.umNewUsers)?string(",##0")!'-'}</td>
                            <td>${(item.umActiveUsers)?string(",##0")!'-'}</td>
                            <td>
                                <#--    广告收入-->
                                <#if (item.allAdMoney?? && (item.allAdMoney)>0)>
                                    ${(mathUtil.div(item.allAdMoney, 100, 4))?string(',##0.00')!'-'}
                                    <#assign totalAdMoney = totalAdMoney + item.allAdMoney />
                                <#else>
                                    -
                                </#if>
                            </td>
                            <td>
                                <#--    活跃ARPU-->
                                ${(item.activeUserArpu)?string(',##0.0000')!'-'}
                            </td>
                            <td>
                                <#--    活跃广告ARPU-->
                                ${(item.activeAdArpu)?string(',##0.0000')!'-'}
                            </td>
                            <td>
                                <#--    新增ARPU-->
                                ${(item.newUserArpu)?string(',##0.0000')!'-'}
                            </td>
                            <td>
                                <#--    新增广告ARPU-->
                                ${(item.newAdArpu)?string(',##0.0000')!'-'}
                            </td>
                            <td>
                                <#--    穿山甲收入-->
                                <#if (item.csjMoney?? && (item.csjMoney)>0)>
                                    ${(mathUtil.div(item.csjMoney, 100, 4))?string(',##0.00')!'-'}
                                <#else>
                                    -
                                </#if>
                            </td>
                            <td>
                                <#--    广点通收入-->
                                <#if (item.gdtMoney?? && (item.gdtMoney)>0)>
                                    ${(mathUtil.div(item.gdtMoney, 100, 4))?string(',##0.00')!'-'}
                                <#else>
                                    -
                                </#if>
                            </td>
                            <td>
                                <a href="/stat/ad/edit?reportDate=${((item.reportDate)?string("yyyy-MM-dd"))!}">编 辑</a>
                            </td>
                        </tr>
                    </#list>
                    <tr>
                        <th></th>
                        <th title="友盟新增">-</th>
                        <th title="友盟活跃">-</th>
                        <th title="合计">${(mathUtil.div(totalAdMoney, 100, 4))?string(',##0.00')!'-'}</th>
                        <th title="当日总收入/活跃用户">-</th>
                        <th title="当日广告广告收入/活跃用户">-</th>
                        <th title="当日总收入/新增用户数">-</th>
                        <th title="当日广告总收入/新增用户数">-</th>
                        <th>-</th>
                        <th>-</th>
                        <th>-</th>
                    </tr>
                    </tbody>
                </table>
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
                    leftColumns: 1,
                    rightColumns: 1
                }
            });
        });
    </script>
</aidata-script>