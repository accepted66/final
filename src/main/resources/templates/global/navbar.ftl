<nav class="navbar navbar-expand navbar-white navbar-light">
    <div class="image">
        <img src="${urls.getForLookupPath("/img/logo.png")}" width="150">
    </div>

    <!-- SEARCH FORM -->
<#--    <form class="form-inline ml-3">
        <div class="input-group input-group-sm">
            <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
            <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </form>-->

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
            xxx
        </li>
        <li class="nav-item dropdown">
            <div class="dropdown-menu-sm dropdown-menu-sm-right">
                <a href="${request.contextPath}/admin/logout?clientUrl=${clientUrl!}" class="btn btn-block btn-default btn-sm">退 出</a>
            </div>
        </li>
    </ul>
</nav>