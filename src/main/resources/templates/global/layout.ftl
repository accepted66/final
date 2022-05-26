<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><#include "title.ftl"></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="${urls.getForLookupPath("/adminlte3/plugins/fontawesome-free/css/all.min.css")}">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${urls.getForLookupPath("/css/ionicons.min.css")}">
    <!-- DataTables -->
    <link rel="stylesheet" href="${urls.getForLookupPath("/adminlte3/plugins/datatables-bs4/css/dataTables.bootstrap4.css")}">
    <link rel="stylesheet" href="${urls.getForLookupPath("/adminlte3/plugins/datatables-fixedcolumns/css/fixedColumns.bootstrap4.css")}">
    <!-- DataTables select -->
    <link rel="stylesheet"
          href="${urls.getForLookupPath("/adminlte3/plugins/datatables-select/css/select.bootstrap4.min.css")}">
    <!-- daterange picker -->
    <link rel="stylesheet" href="${urls.getForLookupPath("/adminlte3/plugins/daterangepicker/daterangepicker.css")}">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="${urls.getForLookupPath("/adminlte3/plugins/icheck-bootstrap/icheck-bootstrap.min.css")}">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet"
          href="${urls.getForLookupPath("/adminlte3/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css")}">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet"
          href="${urls.getForLookupPath("/adminlte3/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css")}">
    <!-- Select2 -->
    <link rel="stylesheet" href="${urls.getForLookupPath("/adminlte3/plugins/select2/css/select2.min.css")}">
    <link rel="stylesheet"
          href="${urls.getForLookupPath("/adminlte3/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css")}">
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet"
          href="${urls.getForLookupPath("/adminlte3/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css")}">
    <!-- Theme style -->
    <link rel="stylesheet" href="${urls.getForLookupPath("/adminlte3/dist/css/adminlte.min.css")}">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="${urls.getForLookupPath("/css/google_font.css")}">
    <!-- Toastr -->
    <link rel="stylesheet" href="${urls.getForLookupPath("/adminlte3/plugins/toastr/toastr.min.css")}">
    <!-- aidata common -->
    <link rel="stylesheet" href="${urls.getForLookupPath("/css/common.css")}">
</head>
<body class="sidebar-mini text-sm">
<div class="wrapper">
    <!-- Navbar -->
    <#include "navbar.ftl">
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <#--<#include "main-sidebar.ftl">-->

    <!-- Content Wrapper. Contains page content -->
    <div class="content">
        <sitemesh:write property='body'/>
    </div>
    <!-- /.content-wrapper -->
    <#include "footer.ftl">

    <!-- Control Sidebar -->
    <#include "control-sidebar.ftl">
    <!-- /.control-sidebar -->

</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/jquery/jquery.min.js")}"></script>
<!-- Bootstrap 4 -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/bootstrap/js/bootstrap.bundle.min.js")}"></script>
<!-- Select2 -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/select2/js/select2.full.min.js")}"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js")}"></script>
<!-- InputMask -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/moment/moment.min.js")}"></script>
<script src="${urls.getForLookupPath("/adminlte3/plugins/inputmask/min/jquery.inputmask.bundle.min.js")}"></script>
<!-- date-range-picker -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/daterangepicker/daterangepicker.js")}"></script>
<!-- bootstrap color picker -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js")}"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js")}"></script>
<!-- Bootstrap Switch -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/bootstrap-switch/js/bootstrap-switch.min.js")}"></script>
<!-- AdminLTE App -->
<script src="${urls.getForLookupPath("/adminlte3/dist/js/adminlte.min.js")}"></script>
<!-- DataTables -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/datatables/jquery.dataTables.js")}"></script>
<script src="${urls.getForLookupPath("/adminlte3/plugins/datatables-bs4/js/dataTables.bootstrap4.js")}"></script>
<script src="${urls.getForLookupPath("/adminlte3/plugins/datatables-fixedcolumns/js/dataTables.fixedColumns.js")}"></script>
<script src="${urls.getForLookupPath("/adminlte3/plugins/datatables-fixedcolumns/js/fixedColumns.bootstrap4.js")}"></script>
<!-- DataTables select -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/datatables-select/js/dataTables.select.min.js")}"></script>
<!-- jquery-validation -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/jquery-validation/jquery.validate.min.js")}"></script>
<script src="${urls.getForLookupPath("/adminlte3/plugins/jquery-validation/additional-methods.min.js")}"></script>
<!-- Toastr -->
<script src="${urls.getForLookupPath("/adminlte3/plugins/toastr/toastr.min.js")}"></script>
<!-- AdminLTE for demo purposes -->
<#--<script src="${urls.getForLookupPath("/adminlte3/dist/js/demo.js")}"></script>-->
<!-- mathjs add 20200425 -->
<#--
<script src="${urls.getForLookupPath("https://unpkg.com/mathjs/dist/math.min.js")}"></script>
-->
<!-- sorttable add 2020.10.27 -->
<script src="${urls.getForLookupPath("/js/global/Sortable.min.js")}"></script>
<!-- aidata360.common.js.hidden -->
<script src="${urls.getForLookupPath("/js/global/common.js")}"></script>


<script type="text/javascript">
    $(document).ready(function () {
        <#if message??>
        toastr.success("${message!}");
        </#if>
    });
</script>
<!-- aidata360.page.js -->
<sitemesh:write property='aidata-script'/>
</body>
</html>
