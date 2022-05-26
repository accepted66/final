<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link text-lg">
<#--        <img src="https://adminlte.io/themes/dev/AdminLTE/dist/img/AdminLTELogo.png"
             alt="AdminLTE Logo"
             class="brand-image img-circle elevation-3"
             style="opacity: .8">-->
        <span class="brand-text font-weight-light"><#include "title.ftl"></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="https://adminlte.io/themes/dev/AdminLTE/dist/img/user2-160x160.jpg"
                     class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block"> ${username!} </a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column " data-widget="treeview" role="menu" data-accordion="false">

                <li class="nav-item has-treeview ">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>运营配置<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="${request.contextPath}/icon/category/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>图标管理</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/dicon/category/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>动效管理</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/resource/category/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>音效管理</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/applist/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>换图标应用</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/demo/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>demo</p></a></li>
                    </ul>
                </li>

                <li class="nav-item has-treeview ">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>资源管理<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="${request.contextPath}/voice/al/index" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>语音包分类</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/voice/pk/index" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>语音包</p></a></li>
                    </ul>
                </li>

                <li class="nav-item has-treeview ">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>数据统计<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="${request.contextPath}/stat/today/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>当日付费收入</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/stat/profit/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>收入统计</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/stat/overview/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>数据日报</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/stat/csj/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>穿山甲收入</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/stat/order/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>订单统计</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/stat/icon/pay/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>图标购买统计</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/stat/icon/use/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>图标使用统计</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/stat/vo/pay/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>语音购买统计</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/stat/vo/use/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>语音使用统计</p></a></li>
                    </ul>
                </li>

                <li class="nav-item has-treeview ">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>公共配置<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="${request.contextPath}/feedback/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>意见反馈</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/push/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>消息推送</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/pay/vip_price/edit" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>VIP价格设置</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/ad/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>自有广告管理</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/ad/space/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>平台广告管理</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/update/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>升级管理</p></a></li>
                        <li class="nav-item"><a href="${request.contextPath}/config/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>配置管理</p></a></li>
                    </ul>
                </li>

                <li class="nav-item has-treeview ">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>用户管理<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="${request.contextPath}/user/list" class="nav-link">
                                <!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>用户列表</p></a></li>
                    </ul>
                </li>

                <li class="nav-item has-treeview ">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>系统管理<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="${request.contextPath}/logout?clientUrl=${clientUrl!}"
                                                class="nav-link"><!--<i  class="far fa-circle nav-icon"></i> -->
                                <p>退出登录</p></a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>