<div id="app">
    <Card>
        <p slot="title">
            修改语音文件
        </p>
        <button-group slot="extra">
            <i-button type="success" @click="modVoice">
                保存
            </i-button>
            <i-button type="primary" @click="goBack">
                返回
            </i-button>
        </button-group>

        <i-form :model="formItem" :label-width="120">

            <form-item label="展示顺序*">
                <i-input v-model="formItem.seq" placeholder="顺序"></i-input>
            </form-item>

            <form-item label="音频文件名*">
                <i-input v-model="formItem.voName" placeholder="名称"></i-input>
            </form-item>

            <form-item label="语音价格*">
                <i-input v-model="formItem.voPrice" placeholder="价格"></i-input>
            </form-item>

            <form-item label="上传资源文件*">
                <upload action="#">
                    <i-button icon="ios-cloud-upload-outline">选择文件</i-button>
                </upload>
            </form-item>
        </i-form>

    </Card>

</div>

<aidata-script>
    <script>
        new Vue({
            el: '#app',
            data() {
                return {
                    formItem: {},
                }
            },
            methods:
                {
                    goBack() {
                        history.go(-1)
                    },
                    modVoice() {
                        $.ajax({
                            type: 'POST',
                            url: '${request.contextPath}/voice/searchPk',
                            data: JSON.stringify(this.formItem),
                            success: (data, status) => {
                                if (data.code == "OK") {
                                    this.dataList = data.data.pageInfo.list
                                    // console.log(JSON.stringify(data.data.pageInfo.list))
                                } else {
                                    alert("系统错误");
                                }
                            },
                            contentType: 'application/json',
                        });
                    },
                },
            mounted() {

            }

        })
    </script>
</aidata-script>