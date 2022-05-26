<#include "../global/nav_paid_app.ftl">

<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <form class="form-inline" action="${request.contextPath}/user/list">
                        <input type="hidden" name="app" value="${(req.app)!}"/>
                        <div class="form-group">
                            <input type="text" class="form-control" name="keyword" id="keyword" placeholder="请输入手机号码/uid">
                        </div>
                        <button id="search-button" type="submit" class="btn btn-primary">搜 索</button>
                    </form>
                </h3>
                <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <div class="float-right">
                            <#if req?? && req.app == "icon">
                                <a href="${request.contextPath}/user/give_edit?app=${(req.app)!}"
                                   class="btn btn-primary">
                                    赠 送
                                </a>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover">
                    <thead>
                    <#if req?? && req.app == "vo">
                        <tr>
                            <th>uid</th>
                            <th>昵称</th>
                            <th>头像</th>
                            <th>注册方式</th>
                            <th>用户类型</th>
                            <th>累计消费(元)</th>
                            <th>创建时间</th>
                            <#--<th>更新时间</th>-->
                            <th>操作</th>
                        </tr>
                    <#else>
                        <tr>
                            <th>uid</th>
                            <th>手机号码</th>
                            <th>昵称</th>
                            <th>头像</th>
                            <th>注册方式</th>
                            <th>用户类型</th>
                            <th>累计消费(元)</th>
                            <th>创建时间</th>
                            <#--<th>更新时间</th>-->
                            <th>操作</th>
                        </tr>
                    </#if>
                    </thead>
                    <tbody>
                    <#if pageInfo??>
                        <#list pageInfo.list as item>
                            <#if req?? && req.app == "vo">
                                <tr>
                                    <td>${((item.uid)?c)!}</td>
                                    <td>${(item.nickname)!}</td>
                                    <td><img src="${(item.avatar)!}" width="50"/></td>
                                    <td>
                                        <#assign source=controller.enum2name("global.source",((item.source)))!"Unknown">
                                        ${(source)!}
                                    </td>
                                    <td>${(item.userType)!}</td>
                                    <td>${(mathUtil.div(item.totalPrice, 100, 4))?string("0.00")!}</td>
                                    <td>${((item.createTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
<#--
                                    <td>${((item.updateTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
-->
                                    <td><a href="${request.contextPath}/user/product_list?uid=${(item.uid)?c}">已购商品</a>
                                    </td>
                                </tr>
                            <#else >
                                <tr>
                                    <td>${((item.uid)?c)!}</td>
                                    <td>${(item.mobile)!}</td>
                                    <td>${(item.nickname)!}</td>
                                    <td><img src="${(item.avatar)!}" width="50"/></td>
                                    <td>
                                        <#assign source=controller.enum2name("global.source",((item.source)))!"Unknown">
                                        ${(source)!}
                                    </td>
                                    <td>${(item.userType)!}</td>
                                    <td>${(mathUtil.div(item.totalPrice, 100, 4))?string("0.00")!}</td>
                                    <td>${((item.createTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
<#--
                                    <td>${((item.updateTime)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
-->
                                    <td><a href="${request.contextPath}/user/product_list?uid=${(item.uid)?c}">已购商品</a>
                                    </td>
                                </tr>
                            </#if>
                        </#list>
                    </#if>
                    </tbody>
                </table>
                <#import "../global/page.ftl" as cast/>
                <@cast.page pageNo=pageInfo.pageNum totalPage=pageInfo.pages showPages=10 call="jump" total=pageInfo.total/>
            </div>

        </div>
    </div>
</section>

