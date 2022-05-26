<section class="content-header">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header d-flex p-0">
                <ul class="nav nav-pills mr-auto p-2">
                    <li class="nav-item"><a class="nav-link <#if req?? && req.type==1>active</#if>" href="?type=1">图标分类</a></li>
<#--
                    <li class="nav-item"><a class="nav-link <#if req?? && req.type==2>active</#if>" href="?type=2">图标</a></li>
-->
                    <li class="nav-item"><a class="nav-link <#if req?? && req.type==3>active</#if>" href="?type=3">音效分类</a></li>
                    <li class="nav-item"><a class="nav-link <#if req?? && req.type==4>active</#if>" href="?type=4">音效</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>