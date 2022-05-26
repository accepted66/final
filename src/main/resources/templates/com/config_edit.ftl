<#import "../global/spring.ftl" as spring>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>编辑</h1>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <!-- form start -->
            <form class="form-horizontal" id="form2" action="${request.contextPath}/config/save_or_update"
                  method="post">
                <input type="hidden" value="${(item.id)!}" name="id"/>
                <div class="card-body">
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">配置key</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="key" value="${(item.key)!}" readonly="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">配置内容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="20" name="content">${(item.content)!}</textarea>
                            <#if item?? ><@spring.bind "item.content" /><@spring.showErrors ""/></#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">是否校验json格式</label>
                        <div class="col-sm-10">
                            <input type="radio" name="isValidJson" value="0" checked=""> 否 &nbsp;&nbsp;
                            <input type="radio" name="isValidJson" value="1"> 是
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