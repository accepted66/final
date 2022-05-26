<#include "dicon_nav.ftl">

<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <form id="form1" class="form-inline" action="${request.contextPath}/stat/icon/pay/list">
                        <input type="hidden" name="type" value="${(req.type)!}"/>
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
                        <th>pid</th>
                        <th>动效包</th>
                        <th>展示顺序</th>
                        <th>价格</th>
                        <th>购买量</th>
                        <th>发布时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list pageInfo.list as item>
                        <tr>
                            <td>${(item.pid)!}</td>
                            <td>${(item.name)!}</td>
                            <td>${(item.rank)!}</td>
                            <td>${(item.yuan)!}</td>
                            <td>${(item.quantity)!}</td>
                            <td>${((item.createTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
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
                "order": [[4, "desc"]],
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
    </script>
</aidata-script>