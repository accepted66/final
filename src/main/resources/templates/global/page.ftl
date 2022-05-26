<#-- 参数说明：pageNo当前的页码，totalPage总页数， showPages显示的页码个数，call回调方法名（需在js中自己定义）-->
<#macro page pageNo totalPage showPages call total>
    <#assign _totalPage_ = totalPage />
    <#if _totalPage_ == 0 >
        <#assign _totalPage_ = 1 />
    </#if>
    <div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4 card-footer ">
        <div class="row">
            <div class="col-sm-12 col-md-5">
                <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">
                    Total ${total!} entries
                </div>
            </div>
            <div class="col-sm-12 col-md-7">
                <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
                    <ul class="pagination pagination-md m-2 float-right">
                        <li class="paginate_button page-item previous"><a href="javascript:${call+'('+1+')'};"
                                                                          class="page-link">首页</a></li>
                        <#if pageNo!=1>
                            <li class="paginate_button page-item previous"><a
                                        href="javascript:${call+'('+(pageNo-1)?c+')'};"
                                        class="page-link">上一页</a></li>
                        </#if>
                        <#if pageNo-showPages/2 gt 0>
                            <#assign start = pageNo-(showPages-1)/2/>
                            <#if showPages gt _totalPage_>
                                <#assign start = 1/>
                            </#if>
                        <#else>
                            <#assign start = 1/>
                        </#if>
                        <#if _totalPage_ gt showPages>
                            <#assign end = (start+showPages-1)/>
                            <#if end gt _totalPage_>
                                <#assign start = _totalPage_-showPages+1/>
                                <#assign end = _totalPage_/>
                            </#if>
                        <#else>
                            <#assign end = _totalPage_/>
                        </#if>
                        <#assign pages=start..end/>
                        <#list pages as page>
                            <#if page==pageNo>
                                <li class="paginate_button page-item active"><a
                                            class="page-link" href="javascript:${call+'('+page?c+')'};">${page?c}</a>
                                </li>
                            <#else>
                                <li class="paginate_button page-item "><a
                                            class="page-link" href="javascript:${call+'('+page?c+')'};">${page?c}</a>
                                </li>
                            </#if>
                        </#list>
                        <#if pageNo!=_totalPage_>
                            <li class="paginate_button page-item next"><a
                                        href="javascript:${call+'('+(pageNo+1)?c+')'};"
                                        class="page-link">下一页</a>
                            </li>
                        </#if>
                        <li class="paginate_button page-item next"><a href="javascript:${call+'('+_totalPage_?c+')'};"
                                                                      class="page-link">尾页</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>


</#macro>
