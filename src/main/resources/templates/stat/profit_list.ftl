<section class="content-header">
    <div class="container-fluid">
    </div>
</section>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <form id="form1" class="form-inline" action="${request.contextPath}/stat/profit/list">
                        <input type="hidden" name="app" value="${(req.app)!}"/>
                        <input type="hidden" id="hiddenStartDate" name="startDate" value="${(req.startDate)!}"/>
                        <input type="hidden" id="hiddenEndDate" name="endDate" value="${(req.endDate)!}"/>
                        <input type="text" class="form-control pull-right" id="searchTime" placeholder=""
                               style="width: 200px"/>
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
                        <th>换图标</th>
                        <th>隐身精灵</th>
                        <th>百变语音包</th>
                        <th>一键换图标</th>
                        <th>合计</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#assign totalIcon = 0 />
                    <#assign totalHm = 0 />
                    <#assign totalVo = 0 />
                    <#assign totalIosIcon = 0 />
                    <#assign totalAll = 0 />
                    <#list pageInfo.list as item>
                        <tr>
                            <td>${((item.reportDate)?string("yyyy-MM-dd"))!}</td>
                            <td>${((mathUtil.div(item.iconMoney, 100, 4))?string(',##0.00'))!}</td>
                            <td>${((mathUtil.div(item.hmMoney, 100, 4))?string(',##0.00'))!}</td>
                            <td>${((mathUtil.div(item.voMoney, 100, 4))?string(',##0.00'))!}</td>
                            <td>${((mathUtil.div(item.iosIconMoney, 100, 4))?string(',##0.00'))!}</td>
                            <td>${((mathUtil.div(item.totalMoney, 100, 4))?string(',##0.00'))!}</td>
                        </tr>
                        <#assign totalIcon = totalIcon +item.iconMoney  />
                        <#assign totalHm = totalHm +item.hmMoney  />
                        <#assign totalVo = totalVo +item.voMoney  />
                        <#assign totalIosIcon = totalIosIcon +item.iosIconMoney  />
                        <#assign totalAll = totalAll +item.totalMoney  />
                    </#list>
                    </tbody>
                    <tr>
                        <th>合计</th>
                        <th>${(mathUtil.div(totalIcon, 100, 4))?string(',##0.00')!'-'}</th>
                        <th>${(mathUtil.div(totalHm, 100, 4))?string(',##0.00')!'-'}</th>
                        <th>${(mathUtil.div(totalVo, 100, 4))?string(',##0.00')!'-'}</th>
                        <th>${(mathUtil.div(totalIosIcon, 100, 4))?string(',##0.00')!'-'}</th>
                        <th>${(mathUtil.div(totalAll, 100, 4))?string(',##0.00')!'-'}</th>
                    </tr>
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
            });
        });
    </script>
</aidata-script>