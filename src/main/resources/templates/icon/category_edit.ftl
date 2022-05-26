<#import "../global/spring.ftl" as spring>
<#include "../global/modal.ftl">
<section class="content-header">
    <div class="container-fluid">
        <h1>图标分类</h1>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                </h3>
                <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <div class="float-right">
                            <a href="${request.contextPath}/icon/category/list">
                                <button id="return-button" type="button" class="btn btn-primary">返回图标列表</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- form start -->
            <form class="form-horizontal" id="form2" enctype="multipart/form-data"
                  action="${request.contextPath}/icon/category/save_or_update" method="post">
                <input type="hidden" value="${(item.id)!}" name="id"/>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>展示顺序</label>
                                <input type="text" class="form-control" name="rank" value="${(item.rank)!}">
                                <#if item?? ><@spring.bind "item.rank" /><@spring.showErrors ""/></#if>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>分类名称</label>
                                <input type="text" class="form-control" name="name" value="${(item.name)!}">
                                <#if item?? ><@spring.bind "item.name" /><@spring.showErrors ""/></#if>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <#if item?? && item.id??  >
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>展示状态</label>
                                    <div>
                                        <input type="radio" name="status" value="1" <#if item.status==1>checked</#if>>
                                        显示 &nbsp;&nbsp;
                                        <input type="radio" name="status" value="2" <#if item.status==2>checked</#if>>
                                        隐藏
                                        <#if item?? ><@spring.bind "item.status" /><@spring.showErrors ""/></#if>
                                    </div>
                                </div>
                            </div>
                        <#else >
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>发布选项</label>
                                    <div>
                                        <input type="radio" name="publish" value="0" checked> 手动发布 &nbsp;&nbsp;
                                        <input type="radio" name="publish" value="1"> 定时发布
                                    </div>
                                </div>
                            </div>
                        </#if>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>发布时间</label>
                                <input type="text" class="form-control float-right" id="reservationtime"
                                       name="scheduleTime">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="card-footer">
                    <#if item?? && item.id??  >
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-confirm"
                                data-action="${request.contextPath}/icon/category/delete?id=${item.id!}">删 除
                        </button>
                    </#if>
                    <button type="submit" class="btn btn-primary float-right" id="smsSaveSumbit">提 交</button>
                    <button type="button" class="btn btn-default float-right" id="btn-back">取 消</button>
                </div>
                <!-- /.box-footer -->
            </form>
        </div>
    </div>
</section>

<!-- 图标包列表 -->

<#if item?? && item.id?? && packages??  >
    <section class="content-header">
        <div class="container-fluid">
            <h1>图标包列表</h1>
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">
                    </h3>
                    <div class="card-tools">
                        <div class="input-group input-group-sm">
                            <div class="float-right">
                                <button id="updateSort" type="button" class="btn btn-primary">批量排序</button>
                                <a href="${request.contextPath}/icon/package/edit?catId=${(item.id)!}">
                                    <button id="return-button" type="button" class="btn btn-primary">新 增</button>
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
                                <th width="5%">展示顺序</th>
                                <th width="4%">id</th>
                                <th width="10%">创作者</th>
                                <th width="5%">图标数</th>
                                <th width="5%">使用次数</th>
                                <th width="4%">状态</th>
                                <th width="10%">发布时间</th>
                                <th width="10%">操作</th>
                            </tr>
                            </thead>
                            <tbody id="items">
                            <#list packages as pkg>
                                <#assign textClass = "" />
                                <#if pkg.future>
                                    <#assign textClass = "text-danger" />
                                <#else >
                                    <#if pkg.status == 1>
                                        <#assign textClass = "text-success" />
                                    <#elseif pkg.status == 2>
                                        <#assign textClass = "text-muted" />
                                    </#if>
                                </#if>
                                <tr data-id="${(pkg.id)!}" class="${textClass!}">
                                    <td><i class="fas fa-arrows-alt handle"></i></td>
                                    <td>${(pkg.rank)!}</td>
                                    <td>${(pkg.id)!}</td>
                                    <td>
                                        <a href="${request.contextPath}/icon/package/edit?id=${(pkg.id)!}">${(pkg.author)!}</a>
                                    </td>
                                    <td>${(pkg.iconCount)!}</td>
                                    <td>${(pkg.subscribeCount)!}</td>
                                    <td>
                                        <#if pkg.future>
                                            定时
                                        <#else >
                                            <#assign status=controller.enum2name("icon.cate.status",(pkg.status)?string)>
                                            ${(status)!}
                                        </#if>
                                    </td>
                                    <td>
                                        <#if pkg.future>
                                            <span class="right badge badge-danger">${((pkg.startDate)?string("yyyy-MM-dd HH:mm:ss"))!}</span>
                                            &nbsp;&nbsp;<i class="fas fa-clock"></i>
                                        <#else >
                                            ${((pkg.startDate)?string("yyyy-MM-dd HH:mm:ss"))!}
                                        </#if>
                                    </td>
                                    <td><a href="${request.contextPath}/icon/package/edit?id=${(pkg.id)!}">编 辑</a></td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</#if>

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
                window.location.href = "/icon/category/sort?from=/icon/category/edit?id=${item.id!}&orders=" + mySortable.toArray();
            });
            $('#reservationtime').daterangepicker({
                timePicker: true,
                timePickerIncrement: 10,
                singleDatePicker: true,
                timePicker24Hour: true,
                startDate: moment('${(item.scheduleTime)!'2020-01-01 00:00:00'}', 'YYYY-MM-DD HH:mm:ss').startOf('hour'),
                locale: {
                    format: 'YYYY-MM-DD HH:mm:ss'
                }
            });
            $('#topapp_table').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "order": [[1, "desc"]],
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
    </script>
</aidata-script>