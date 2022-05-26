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
    <link rel="stylesheet"
          href="${request.contextPath}/adminlte3/plugins/datatables-fixedcolumns/css/fixedColumns.bootstrap4.css">
    <!-- DataTables select -->
    <link rel="stylesheet"
          href="${request.contextPath}/adminlte3/plugins/datatables-select/css/select.bootstrap4.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/daterangepicker/daterangepicker.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet"
          href="${request.contextPath}/adminlte3/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet"
          href="${request.contextPath}/adminlte3/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/select2/css/select2.min.css">
    <link rel="stylesheet"
          href="${request.contextPath}/adminlte3/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet"
          href="${request.contextPath}/adminlte3/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="${request.contextPath}/css/google_font.css" rel="stylesheet">
    <!-- Toastr -->
    <link rel="stylesheet" href="${request.contextPath}/adminlte3/plugins/toastr/toastr.min.css">
    <!-- aidata common -->
    <link rel="stylesheet" href="${request.contextPath}/css/common.css">
</head>
<body class="sidebar-mini text-sm">
<div class="wrapper">
    <sitemesh:write property='body'/>
</div>
<!-- ./wrapper -->


<!-- jQuery -->
<script src="/adminlte3/plugins/jquery/jquery.min.js"></script>
<!-- Select2 -->
<script src="/adminlte3/plugins/select2/js/select2.full.min.js"></script>
<!-- AdminLTE App -->
<script src="/adminlte3/dist/js/adminlte.min.js"></script>

<!-- aidata360.page.js -->
<sitemesh:write property='aidata-script'/>
</body>
</html>
