<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>当日付费收入</h1>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">5分钟更新一次</h3>
                <div class="card-tools">
                </div>
            </div>

            <div class="card-body table-responsive ">
                <table id="topapp_table" class="table table-hover ">
                    <thead>
                    <tr>
                        <th>产品</th>
                        <th>微信收入</th>
                        <th>支付宝收入</th>
                        <th>QQ收入</th>
                        <th>合计</th>
                    </tr>
                    </thead>

                    <tbody>
                    <#assign totalWxpay = 0 />
                    <#assign totalAlipay = 0 />
                    <#assign totalQqpay = 0 />
                    <#assign totalAllPay = 0 />
                    <#list list as item>
                        <tr>
                            <#assign app=controller.enum2name("global.app",(item.app)?string)>
                            <td>${(app)!}</td>
                            <td>${(mathUtil.div(item.wxpayMoney, 100, 4))?string(',##0.00')!'-'}</td>
                            <td>${(mathUtil.div(item.alipayMoney, 100, 4))?string(',##0.00')!'-'}</td>
                            <td>${(mathUtil.div(item.qqpayMoney, 100, 4))?string(',##0.00')!'-'}</td>
                            <td>${(mathUtil.div((item.wxpayMoney+item.alipayMoney+item.qqpayMoney), 100, 4))?string(',##0.00')!'-'}</td>
                        </tr>
                        <#assign totalWxpay = totalWxpay +item.wxpayMoney  />
                        <#assign totalAlipay = totalAlipay+item.alipayMoney />
                        <#assign totalQqpay = totalQqpay+item.qqpayMoney />
                        <#assign totalAllPay = totalAllPay+item.wxpayMoney+item.alipayMoney+item.qqpayMoney />
                    </#list>
                    </tbody>
                    <tr>
                        <th>合计</th>
                        <th>${(mathUtil.div(totalWxpay, 100, 4))?string(',##0.00')!'-'}</th>
                        <th>${(mathUtil.div(totalAlipay, 100, 4))?string(',##0.00')!'-'}</th>
                        <th>${(mathUtil.div(totalQqpay, 100, 4))?string(',##0.00')!'-'}</th>
                        <th>${(mathUtil.div(totalAllPay, 100, 4))?string(',##0.00')!'-'}</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</section>

<aidata-script>
    <script>
        $(document).ready(function () {
            $('#topapp_table').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "order": [[0, "asc"]],
                "info": true,
                "autoWidth": false,
                "responsive": true
            });
        });
    </script>
</aidata-script>