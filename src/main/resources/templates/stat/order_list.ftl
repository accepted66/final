<#include "../global/nav_paid_app.ftl">

<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <form id="form1" class="form-inline" action="${request.contextPath}/stat/order/list">
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
                <table id="topapp_table" class="table table-hover ">
                    <thead>
                    <tr>
                        <th>日期</th>
                        <#if req.app == "icon">
                            <th>VIP购买量</th>
                            <th>动效包购买量</th>
                            <th>动效购买量</th>
                        <#elseif req.app == "hm">
                            <th>VIP购买量</th>
                        <#elseif req.app == "vo">
                            <th>VIP购买量</th>
                            <th>语音包购买量</th>
                            <th>语音购买量</th>
                        </#if>
                    </tr>
                    </thead>
                    <tbody>
                    <#list pageInfo.list as item>
                        <tr>
                            <td>${(item.reportDate)!}</td>
                            <#if req.app == "icon">
                                <td>${(item.iconVipSales)!}</td>
                                <td><a href="/stat/icon/pay/list?type=1&startDate=${(item.reportDate)!}&endDate=${(item.reportDate)!}">${(item.iconPkgSales)!}</a></td>
                                <td><a href="/stat/icon/pay/list?type=2&startDate=${(item.reportDate)!}&endDate=${(item.reportDate)!}">${(item.iconItemSales)!}</a></td>
                            <#elseif req.app == "hm">
                                <td>${(item.hmVipSales)!}</td>
                            <#elseif req.app == "vo">
                                <td>${(item.voVipSales)!}</td>
                                <td>${(item.voPkgSales)!}</td>
                                <td>${(item.voItemSales)!}</td>
                            </#if>
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
            $('#btn-search').click(function (event) {
                $('#form1').submit();
            });
            $('#topapp_table').DataTable({
                "paging": true,
                "lengthChange": true,
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