<#import "../global/spring.ftl" as spring>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-12">
                <h1>用户[ uid: ${(user.uid)!} ]已购商品列表</h1>
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
                    <a href="/user/list?app=${(user.app)!}" class="pull-left">
                        <button class="btn btn-primary">返回上级</button>
                    </a>
                </div>
            </div>
            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>uid</th>
                        <th>类型</th>
                        <th>产品id</th>
                        <th>产品名称</th>
                        <th>获得途径</th>
                        <th>备注</th>
                        <th>创建时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list products as item>
                        <tr>
                            <td>${(item.id)!}</td>
                            <td>${(item.uid)!}</td>
                            <td>${controller.showProductType(item.type)!}</td>
                            <td>${(item.pid)!}</td>
                            <td>${(item.name)!}</td>
                            <td>${controller.showFee(item.fee)!}</td>
                            <td>${(item.memo)!}</td>
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
            $('#topapp_table').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": false,
                "ordering": false,
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
    </script>
</aidata-script>

