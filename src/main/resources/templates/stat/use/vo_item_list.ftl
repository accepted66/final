<#include "vo_nav.ftl">

<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <form id="form1" class="form-inline" action="${request.contextPath}/stat/vo/use/list">
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
                        <th>分类名称</th>
                        <th>语音包名</th>
                        <th>语音文件</th>
                        <th>价格</th>
                        <th>资源</th>
                        <th>播放量</th>
                        <th>点赞量</th>
                        <th>收藏量</th>
                        <th>发布时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list pageInfo.list as item>
                        <tr>
                            <td>${(item.id)!}</td>
                            <td>${(item.alNames)!}</td>
                            <td>${(item.pkName)!}</td>
                            <td width="15%">${(item.voName)!}</td>
                            <td>${(mathUtil.div(item.price, 100, 4))?string("0.00")!}</td>
                            <td><audio src="${(item.voUrl)!}" controls="controls" preload="none"></audio></td>
                            <td>${(item.listenCount)!}</td>
                            <td>${(item.favourCount)!}</td>
                            <td>${(item.collectCount)!}</td>
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