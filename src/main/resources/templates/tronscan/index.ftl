<section class="content-header">
    <div class="container-fluid">
        <h1>tronscan</h1>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    从https://tronscan.io网站爬取数据<br>
                    TRC20转账列表, 示例: https://tronscan.io/#/address/TQjRSckvLgtL1mB68kYdJDyMnamTPx6rRq/transfers<br>
                    交易列表, 示例: https://tronscan.io/#/contract/TBCBWjyKBsmN74f4BWY3PKoDSLQpo7xs7q/transactions<br>
                    内部交易列表, 示例:
                    https://tronscan.io/#/contract/TBCBWjyKBsmN74f4BWY3PKoDSLQpo7xs7q/internal-transactions<br>
                    目前支持1000页以内
                </h3>
            </div>
            <!-- form start -->
            <form class="form-horizontal" id="form2"
                  action="${request.contextPath}/tronscan/csv" method="post">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>地址</label>
                                <input type="text" class="form-control" name="address" value="" required>
                            </div>
                        </div>
                    </div>
                    <#if qiniuUrl?? >
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>导出成功 : </label>
                                    <a href="${qiniuUrl!}">${qiniuUrl!}</a>
                                </div>
                            </div>
                        </div>
                    </#if>
                    <#if errorMsg?? >
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>导出失败,错误信息 : </label>
                                    ${errorMsg!}
                                </div>
                            </div>
                        </div>
                    </#if>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary float-right" id="smsSaveSumbit">提 交</button>
                    <button type="button" class="btn btn-default float-right" id="btn-back">取 消</button>
                </div>
                <!-- /.box-footer -->
            </form>
        </div>
    </div>
</section>

