<#import "../global/spring.ftl" as spring>
<#include "../global/modal.ftl">
<section class="content-header">
    <div class="container-fluid">
        <h1>动效分类</h1>
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
                            <a href="${request.contextPath}/dicon/category/list">
                                <button id="return-button" type="button" class="btn btn-primary">返回动效列表</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- form start -->
            <form class="form-horizontal" id="form2"
                  action="${request.contextPath}/dicon/category/save_or_update" method="post">
                <input type="hidden" value="${(item.id)!}" name="id"/>
                <input type="hidden" value="${(item.group)!}" name="group"/>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>展示顺序</label>
                                <input type="text" class="form-control" name="rank" value="${(item.rank)!}" placeholder="不填默认设置第一位">
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
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>价格(元)</label>
                                <input type="text" class="form-control" name="price" value="${(item.price)!}">
                                <#if item?? ><@spring.bind "item.price" /><@spring.showErrors ""/></#if>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>发布时间</label>
                                <input type="text" class="form-control float-right" id="reservationtime"
                                       name="scheduleTime">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>价格修改历史</label>
                                <#if product??>
                                    ${(controller.showPriceHistory(product.history))!}
                                </#if>
                            </div>
                        </div>
                        <#if item?? && item.id??  >
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>展示状态</label>
                                    <div>
                                        <input type="radio" name="state" value="1" <#if item.state==1>checked</#if>>
                                        显示 &nbsp;&nbsp;
                                        <input type="radio" name="state" value="2" <#if item.state==2>checked</#if>>
                                        隐藏
                                        <#if item?? ><@spring.bind "item.state" /><@spring.showErrors ""/></#if>
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
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="card-footer">
                    <#if item?? && item.id??  >
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-confirm"
                                data-action="${request.contextPath}/dicon/category/delete?id=${item.id!}">删 除
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

<!-- 动效列表 -->

<#if item?? && item.id?? && pageInfo?? && pageInfo.list??  >
    <section class="content-header">
        <div class="container-fluid">
            <h1>动效列表</h1>
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
                                <a href="${request.contextPath}/dicon/dicon/edit?catId=${(item.id)!}" class="btn btn-primary">
                                    新 增
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body table-responsive">
                    <table id="topapp_table" class="table table-hover ">
                        <thead>
                        <tr>
                            <th width="2%"></th>
                            <th width="5%">展示顺序</th>
                            <th width="4%">id</th>
                            <th width="8%">动效名称</th>
                            <th width="5%">展示效果</th>
                            <th width="8%">推荐音频</th>
                            <th width="5%">价格(元)</th>
                            <th width="5%">购买量</th>
                            <th width="5%">动效标识</th>
                            <th width="5%">动效效果</th>
                            <th width="8%">发布时间</th>
                            <th width="4%">操作</th>
                        </tr>
                        </thead>
                        <tbody id="items">
                        <#list pageInfo.list as dicon>
                            <tr data-id="${(dicon.id)!}">
                                <td><i class="fas fa-arrows-alt handle"></i></td>
                                <td>${(dicon.rank)!}</td>
                                <td>${(dicon.id)!}</td>
                                <td>${(dicon.animName)!}</td>
                                <td>
                                    <img src="${dicon.iconUrl}" width="100"/>
                                    <span></span>
                                    <a id="animlink" href="${(dicon.animGifUrl)}" target="_blank" class="float-right">动
                                        画</a>
                                </td>
                                <td>${(dicon.resName)!'-'}</td>
                                <td>${(mathUtil.div(dicon.price, 100, 4))?string("0.00")!}</td>
                                <td>${(dicon.diconSales)!}</td>
                                <#assign sign=controller.enum2name("dicon.animsign",(dicon.animSign)?string)>
                                <td>${(sign)!}</td>
                                <#assign scale=controller.enum2name("dicon.scale",(dicon.scale)?string)>
                                <td>${(scale)!}</td>
                                <td>${((dicon.createTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                                <td><a href="${request.contextPath}/dicon/dicon/edit?id=${(dicon.id)!}">编 辑</a></td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                    <#--
                    <#import "../global/page.ftl" as cast/>
                    <@cast.page pageNo=pageInfo.pageNum totalPage=pageInfo.pages showPages=10 call="jump" total=pageInfo.total/>
                    -->
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
                window.location.href = "/dicon/sort?from=/dicon/category/edit?id=${(item.id)!}&orders=" + mySortable.toArray();
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
            })

            $("img").each(function () {
                var img = $(this);
                $.getJSON(img.attr("src") + "?imageInfo", "", function (data, status) {
                    img.next().append("<br/>" + (data.size / 1024).toFixed(0) + "K");
                    var anim = img.next().next().attr("href");
                    $.getJSON(anim + "?imageInfo", "", function (data, status) {
                        img.next().next().append("(" + (data.size / 1024).toFixed(0) + "K)");
                    })
                })
            });

            $('#topapp_table').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": true,
                "ordering": true,
                "order": [[0, "desc"]],
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
    </script>
</aidata-script>