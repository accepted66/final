<section class="content-header">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header d-flex p-0">
                <ul class="nav nav-pills mr-auto p-2">
                    <li class="nav-item"><a class="nav-link <#if req?? && req.type==1>active</#if>" href="?type=1">语音分类</a></li>
                    <li class="nav-item"><a class="nav-link <#if req?? && req.type==2>active</#if>" href="?type=2">语音包</a></li>
                    <!-- 目前的需求不统计语音的收听次数, 2021.02.07 -->
                </ul>
            </div>
        </div>
    </div>
</section>