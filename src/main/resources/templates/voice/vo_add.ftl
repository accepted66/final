<div id="app">
    <Card>
        <p slot="title">
            新建语音文件
        </p>
        <button-group slot="extra">
            <i-button type="success" @click="addVoices">
                保存
            </i-button>
            <i-button type="primary" @click="goBack">
                返回
            </i-button>
        </button-group>

        <i-form :model="formItem" :label-width="120">

            <form-item label="免费语音条数">
                <i-input v-model="formItem.freeCount" placeholder="数量"></i-input>
            </form-item>

            <form-item label="单条语音价格*">
                <i-input v-model="formItem.voPrice" placeholder="价格"></i-input>
            </form-item>

            <form-item label="语音文件包*">
                <Alert>待上传完成,语音文件显示列表后再保存</Alert>
                <upload action="/voice/uploadZip"
                        :on-success="handleSuccess"
                        :before-upload="beforeUpload"
                        :format="['zip']">
                    <i-button icon="ios-cloud-upload-outline">选择zip文件</i-button>
                </upload>
            </form-item>
        </i-form>


        <Card>
            <p slot="title">
                语音文件预览
            </p>

            <i-table :columns="columns" :data="dataList">
                <template slot-scope="{row,index}" slot="voUrl">
                    <audio :src="row.voUrl" controls="controls"/>
                </template>
            </i-table>
        </Card>

    </Card>

</div>

<aidata-script>
    <script>
        new Vue({
            el: '#app',
            data() {
                return {
                    pkid: null,
                    formItem: {},
                    dataList: [],
                    columns: [
                        {
                            title: '序号',
                            key: 'seq'
                        },
                        {
                            title: '语音文件名',
                            key: 'voName'
                        },
                        {
                            title: '价格',
                            key: 'voPrice'
                        },
                        {
                            title: '资源',
                            slot: 'voUrl',
                            width: 330

                        },
                    ],
                }
            },
            methods:
                {
                    beforeUpload() {
                        var freeCount = this.formItem.freeCount;
                        var voPrice = this.formItem.voPrice;

                        if (Bee.StringUtils.isNumeric(freeCount) && freeCount >= 0
                            && Bee.StringUtils.isNumeric(voPrice) && voPrice >= 0) {
                            return true;
                        } else {
                            this.$Message.error('请确定免费条数和价格');
                            return false;
                        }

                    },
                    handleSuccess(data, file) {
                        var freeCount = this.formItem.freeCount;
                        var voPrice = this.formItem.voPrice;
                        var pkid = this.pkid;

                        if (data.code == "OK") {
                            this.dataList = data.data.voiceList;
                            this.dataList.forEach(function (voice, index) {
                                voice.seq  = index + 1;
                                voice.pkid = pkid;

                                if (index < freeCount) {
                                    voice.voFree = 1;
                                    voice.voPrice = 0;
                                } else {
                                    voice.voFree = 0;
                                    voice.voPrice = voPrice
                                }
                            });

                            console.log(JSON.stringify(this.dataList))
                        } else {
                            this.$Message.error("上传失败")
                        }
                    },
                    goBack() {
                        history.go(-1)
                    },
                    addVoices() {
                        //克隆数组,变换价格
                        var dataList = this.dataList.slice(0);
                        dataList.forEach(function (voice, index) {
                            voice.voPrice = voice.voPrice * 100;
                        });
                        if (dataList.length == 0) {
                            this.$Message.error("语音文件尚未上传完成");
                            return;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '${request.contextPath}/voice/addVoices',
                            data: JSON.stringify(dataList),
                            success: (data, status) => {
                                if (data.code == "OK") {
                                    window.location = "/voice/pk/add?id=" + this.pkid;
                                } else {
                                    this.$Message.error("系统错误");
                                }
                            },
                            contentType: 'application/json',
                        });
                    },
                },
            mounted() {
                this.$Message.config({
                    top: 100,
                    duration: 3
                });

                var pkid = ${(req.id)!0};
                if (pkid > 0) {
                    this.pkid = pkid;
                    this.formItem.pkid = pkid;
                } else {
                    this.$Message.error('系统错误:请先创建语音包');
                }

            }

        })
    </script>
</aidata-script>