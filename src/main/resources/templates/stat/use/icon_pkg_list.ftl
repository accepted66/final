<#include "dicon_nav.ftl">

<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <form id="form1" class="form-inline" action="${request.contextPath}/stat/icon/use/list">
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
                        <th>id</th>
                        <th>图标分类</th>
                        <th>展示顺序</th>
                        <th>使用次数</th>
                        <th>发布时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list pageInfo.list as item>
                        <tr>
                            <td>${(item.id)!}</td>
                            <td>${(item.name)!}</td>
                            <td>${(item.rank)!}</td>
                            <td>${(item.subscribeCount)!}</td>
                            <td>${((item.createTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
                <#import "../../global/page.ftl" as cast/>
                <@cast.page pageNo=pageInfo.pageNum totalPage=pageInfo.pages showPages=10 call="jump" total=pageInfo.total/>
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
        });
    </script>
</aidata-script>