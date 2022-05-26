<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><#include "title.ftl"></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
    <!-- DataTables select -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/datatables-select/css/select.bootstrap4.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/daterangepicker/daterangepicker.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="sidebar-mini control-sidebar-slide-open text-sm">
<div class="wrapper">
    <!-- Navbar -->
    <#include "navbar.ftl">
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <#include "main-sidebar.ftl">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <#if info??>
            <section class="content-header" id="alter-success" style="display:none">
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h5><i class="icon fas fa-check"></i> 提示!</h5>
                    <span>${(message)!}</span>
                </div>
            </section>
        </#if>
        <sitemesh:write property='body'/>
    </div>
    <!-- /.content-wrapper -->
    <#include "footer.ftl">

    <!-- /.control-sidebar -->
    <#include "control-sidebar.ftl">

    <!-- Control Sidebar -->
    <#--    <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here &ndash;&gt;
        </aside>-->
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->


<!-- jQuery -->
<script src="/adminlte3/plugins/jquery/jquery.min.js"></script>
<!-- Select2 -->
<script src="/adminlte3/plugins/select2/js/select2.full.min.js"></script>
<!-- AdminLTE App -->
<script src="/adminlte3/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<#--
<script src="/adminlte3/dist/js/demo.js"></script>
-->
<!-- mathjs add 20200425 -->
<#--
<script src="https://unpkg.com/mathjs/dist/math.min.js"></script>
-->
<!-- aidata360.page.js -->
<sitemesh:write property='aidata-script'/>
</body>
</html>

<script>
    function getUrlPath() {
        var url = document.location.toString();
        var arrUrl = url.split("//");
        var start = arrUrl[1].indexOf("/");
        var relUrl = arrUrl[1].substring(start);
        if (relUrl.indexOf("?") != -1) {
            relUrl = relUrl.split("?")[0];
        }
        return relUrl;
    }

    $(function () {
        $(".nav-item").each(
            function () {
                var reqUrl = getUrlPath();
                var navUrl = $(this).children("a").attr("href");
                reqUrl = reqUrl.substring(0, reqUrl.lastIndexOf("/") + 1);
                navUrl = navUrl.substring(0, navUrl.lastIndexOf("/") + 1);
                if (reqUrl == navUrl) {
                    $(this).children("a").addClass("active");
                    $(this).parent("ul").parent("li").addClass("menu-open");
                    $(this).parent("ul").prev("a").addClass("active");
                }
            }
        );
    });
</script>
