<#import "../global/spring.ftl" as spring>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>广告收入 [ ${(item.reportDate)!} ]</h1>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <!-- form start -->
            <form class="form-horizontal" id="form2" action="${request.contextPath}/stat/ad/save_or_update"
                  method="post">
                <input type="hidden" value="${(item.id)!}" name="id"/>
                <input type="hidden" value="${(item.reportDate)!}" name="reportDate" />
                <div class="card-body">
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">换图标 广点通广告收入</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="iconGdtMoney" value="${((item.iconGdtMoney)?c)!}">
                            <#if item?? ><@spring.bind "item.iconGdtMoney" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">换图标 穿山甲广告收入</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="iconCsjMoney" value="${((item.iconCsjMoney)?c)!}">
                            <#if item?? ><@spring.bind "item.iconCsjMoney" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">隐身精灵 广点通广告收入</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="hmGdtMoney" value="${((item.hmGdtMoney)?c)!}">
                            <#if item?? ><@spring.bind "item.hmGdtMoney" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">隐身精灵 穿山甲广告收入</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="hmCsjMoney" value="${((item.hmCsjMoney)?c)!}">
                            <#if item?? ><@spring.bind "item.hmCsjMoney" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">变声器 穿山甲广告收入</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="voCsjMoney" value="${((item.voCsjMoney)?c)!}">
                            <#if item?? ><@spring.bind "item.voCsjMoney" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">一键换图标 穿山甲广告收入</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="iosiconCsjMoney" value="${((item.iosiconCsjMoney)?c)!}">
                            <#if item?? ><@spring.bind "item.iosiconCsjMoney" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary float-right" id="smsSaveSumbit">提 交</button>
                    <button type="button" class="btn btn-default float-right" id="btn-back">取 消</button>
                </div>
                <!-- /.box-footer -->
            </form>
        </div>
    </div>
</section>