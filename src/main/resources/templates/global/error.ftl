<div class="content-header">
    <div class="content-header">
        <div class="row mb-2">
            <div class="col-sm-6">
            </div>
        </div>
    </div><!-- /.container-fluid -->
</div>

<section class="content">
    <div class="content-header">
        <!-- COLOR PALETTE -->

        <div class="row">
            <div class="col-md-12">
                <div class="card card-default">
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="alert alert-danger alert-dismissible">
                            <h5><i class="icon fas fa-ban"></i> 提 示!</h5>
                            <p>${errorMessage!}</p>
                        </div>
                        <div class="card-footer">
                            <#if referer?? >
                                <a href="${(referer)!}">
                                    <button type="button" class="btn btn-primary float-right">返回上级</button>
                                </a>
                            <#else >
                                <button type="button" class="btn btn-primary float-right" id="btn-back">返回上级</button>
                            </#if>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
        <!-- END TYPOGRAPHY -->
    </div><!-- /.container-fluid -->
</section>

<aidata-script>
    <script src="${request.contextPath}/js/global/common.js"></script>
</aidata-script>