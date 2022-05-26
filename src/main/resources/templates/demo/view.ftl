<#import "../global/spring.ftl" as spring>

<section class="content-header">
    <div class="container-fluid">
    </div>
</section>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    查看
                </h3>
                <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <div class="float-right">
                            <a href="${request.contextPath}/demo/list">
                                <button id="return-button" type="button" class="btn btn-primary">返 回</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover ">
                    <thead>
                    <tr>
                        <#list header as item>
                            <th>${(item)!}</th>
                        </#list>
                    </tr>
                    </thead>
                    <tbody id="items">
                    <#list list as item>
                        <tr>
                            <#list item?keys as key>
                                <td>${(item[key])!}</td>
                            </#list>
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
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "order": [[0, "desc"]],
                "info": true,
                "autoWidth": true,
                "responsive": true,
            });
        });
    </script>
</aidata-script>