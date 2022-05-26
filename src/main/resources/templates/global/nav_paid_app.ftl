<section class="content-header">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header d-flex p-0">
                <ul class="nav nav-pills mr-auto p-2">
                    <#list paidApps?keys as key>
                        <#assign active=""/>
                        <#if req?? && req.app == key >
                            <#assign active="active"/>
                        </#if>
                        <li class="nav-item"><a class="nav-link ${active!}" href="?app=${key}">${apps[key]}</a></li>
                    </#list>
                </ul>
            </div>
        </div>
    </div>
</section>