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
                    <select class="form-control select2" name="categoryId" id="categoryId">
                        <option value="">状态</option>
                        <option value="/dicon/category/list">全部</option>
                        <#if statusMap??>
                            <#list statusMap?keys as key>
                                <option value="/dicon/category/list?status=${key}">${statusMap[key]}</option>
                            </#list>
                        </#if>
                    </select>
                </h3>
                <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <div class="float-right">
                            <button id="updateSort" type="button" class="btn btn-primary">批量排序</button>
                            <a href="${request.contextPath}/cache/clean?keyPrefix=icon:dyna" class="btn btn-primary">
                                更新缓存
                            </a>
                            <a href="${request.contextPath}/dicon/category/edit" class="btn btn-primary">
                                新 增
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-body table-responsive ">
                <div class="table-responsive mailbox-messages">
                    <table id="topapp_table" class="table table-hover ">
                        <thead>
                        <tr>
                            <th width="2%"></th>
                            <th width="6%">展示顺序</th>
                            <th width="4%">id</th>
                            <th width="10%">分类名称</th>
                            <th width="5%">价格(元)</th>
                            <th width="5%">动效数</th>
                            <th width="8%">动效包购买量</th>
                            <th width="6%">动效购买量</th>
                            <th width="5%">状态</th>
                            <th width="8%">发布时间</th>
                            <th width="5%">操作</th>
                        </tr>
                        </thead>
                        <tbody id="items">
                        <#list list as item>
                            <#assign textClass = "" />
                            <#if item.future>
                                <#assign textClass = "text-danger" />
                            <#else >
                                <#if item.state == 1>
                                    <#assign textClass = "text-success" />
                                <#elseif item.state == 2>
                                    <#assign textClass = "text-muted" />
                                </#if>
                            </#if>
                            <tr data-id="${(item.id)!}" class="${textClass!}">
                                <td><i class="fas fa-arrows-alt handle"></i></td>
                                <td>${(item.rank)!}</td>
                                <td>${(item.id)!}</td>
                                <td>
                                    <a href="${request.contextPath}/dicon/category/edit?id=${(item.id)!}">${(item.name)!}</a>
                                </td>
                                <td>${(mathUtil.div(item.price, 100, 4))?string("0.00")!}</td>
                                <td>${(item.itemCount)!}</td>
                                <td>${(item.packageSales)!}</td>
                                <td>${(item.diconSales)!}</td>
                                <td>
                                    <#if item.future>
                                        定时
                                    <#else >
                                        <#assign status=controller.enum2name("icon.cate.status",(item.state)?string)>
                                        ${(status)!}
                                    </#if>
                                </td>
                                <td>
                                    <#if item.future>
                                        <span class="right badge badge-danger">${((item.startDate)?string("yyyy-MM-dd HH:mm:ss"))!}</span>
                                        &nbsp;&nbsp;<i class="fas fa-clock"></i>
                                    <#else >
                                        ${((item.startDate)?string("yyyy-MM-dd HH:mm:ss"))!}
                                    </#if>

                                </td>
                                <td>
                                    <a href="${request.contextPath}/dicon/category/edit?id=${(item.id)!}">编 辑</a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<aidata-script>
    <script>
        $(document).ready(function () {
            var items = document.getElementById("items");
            if (items) {
                var mySortable = new Sortable(items, {
                    handle: '.handle',
                    animation: 150
                });
            }

            $('#updateSort').click(function (event) {
                window.location.href = "/dicon/category/sort?from=/dicon/category/list&orders=" + mySortable.toArray();
            });
            $("select").change(function (event) {
                var selectVal = $(this).children('option:selected').val();
                if (selectVal != '') {
                    window.location.href = selectVal;
                }
            });
            $('#topapp_table').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": true,
                "ordering": true,
                "order": [[1, "desc"]],
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
    </script>
</aidata-script>