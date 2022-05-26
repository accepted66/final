<div id="app">
    <Card>
        <p slot="title">
            保存push任务
        </p>
        <button-group slot="extra">
            <i-button @click="goback">
                返回上级
            </i-button>
            <i-button type="success" @click="save">
                保存任务
            </i-button>
        </button-group>


        <i-form :model="formItem" :label-width="80">
            <form-item label="任务名" prop="taskName">
                <i-input v-model="formItem.taskName" placeholder="任务名"></i-input>
            </form-item>

            <form-item label="push标题" prop="pushTitle">
                <i-input v-model="formItem.pushTitle" placeholder="push标题"></i-input>
            </form-item>

            <form-item label="push内容" prop="pushContent">
                <i-input v-model="formItem.pushContent" placeholder="push内容"></i-input>
            </form-item>

            <form-item label="推送时间" prop="sendType">
                <radio-group v-model="formItem.sendType" @on-change="sendTimeRadioChange">
                    <radio label="now">立即发送</radio>
                    <radio label="later">定时发送</radio>
                </radio-group>
                <date-picker ref="datetime" type="datetime" v-model="formItem.sendTime"
                             placeholder="推送时间"></date-picker>
            </form-item>

            <form-item label="目标人群">
                <radio-group v-model="formItem.allUserRadio">
                    <radio label="1">全部用户</radio>
                    <radio label="0">自定义用户</radio>
                </radio-group>
            </form-item>


            <form-item label="图标分类" v-if="formItem.app=='icon'">
                <radio-group v-model="formItem.iconCatIdRadio" @on-change="iconCatIdRadioChange">
                    <radio label="1">全部用户</radio>
                    <radio label="0">自定义用户</radio>
                </radio-group>

                <checkbox-group v-model="formItem.iconCatId">
                    <checkbox v-for="(item,index) in iconGroup" :label="item.id">{{item.name}}</checkbox>
                </checkbox-group>
            </form-item>

            <form-item label="动效分类" v-if="formItem.app=='icon'">
                <radio-group v-model="formItem.animCatIdRadio" @on-change="animCatIdRadioChange">
                    <radio label="1">全部用户</radio>
                    <radio label="0">自定义用户</radio>
                </radio-group>

                <checkbox-group v-model="formItem.animCatId">
                    <checkbox v-for="(item,index) in diconGroup" :label="item.id">{{item.name}}</checkbox>
                </checkbox-group>
            </form-item>

            <form-item label="音效分类" v-if="formItem.app=='icon'">
                <radio-group v-model="formItem.soundCatIdRadio" @on-change="soundCatIdRadioChange">
                    <radio label="1">全部用户</radio>
                    <radio label="0">自定义用户</radio>
                </radio-group>

                <checkbox-group v-model="formItem.soundCatId">
                    <checkbox v-for="(item,index) in soundGroup" :label="item.id">{{item.name}}</checkbox>
                </checkbox-group>
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
                    iconGroup: [],
                    diconGroup: [],
                    soundGroup: [],

                    formItem: {
                        id: '',
                        app: '',
                        taskName: '',
                        pushTitle: '',
                        pushContent: '',

                        sendType: 'now',
                        sendTime: '',

                        allUserRadio: '1',
                        iconCatIdRadio: '0',
                        animCatIdRadio: '0',
                        soundCatIdRadio: '0',

                        iconCatId: [],
                        animCatId: [],
                        soundCatId: [],
                    }
                }
            },
            methods:
                {
                    goback: function () {
                        history.go(-1);
                    },

                    sendTimeRadioChange: function (select) {
                        if (select == 'now') {
                            this.$refs.datetime.disabled = true;
                        } else {
                            this.$refs.datetime.disabled = false;
                        }
                    },

                    iconCatIdRadioChange: function (select) {
                        this.$set(this.formItem, 'iconCatId', []);
                        if (select == 1) {
                            this.iconGroup.forEach(v => {
                                this.formItem.iconCatId.push(v.id)
                            })
                        }
                    },

                    animCatIdRadioChange: function (select) {
                        this.$set(this.formItem, 'animCatId', []);
                        if (select == 1) {
                            this.diconGroup.forEach(v => {
                                this.formItem.animCatId.push(v.id)
                            })
                        }
                    },

                    soundCatIdRadioChange: function (select) {
                        this.$set(this.formItem, 'soundCatId', []);
                        if (select == 1) {
                            this.soundGroup.forEach(v => {
                                this.formItem.soundCatId.push(v.id)
                            })
                        }
                    },
                    save: function () {
                        if (this.formItem.taskName == '') {
                            alert("任务名不能为空");
                            return false;
                        }
                        if (this.formItem.pushTitle == '') {
                            alert("push标题不能为空");
                            return false;
                        }
                        if (this.formItem.pushContent == '') {
                            alert("push内容不能为空");
                            return false;
                        }
                        if (this.formItem.sendType == 'later' && this.formItem.sendTime == '') {
                            alert("定时发送时间不能为空");
                            return false;
                        }
                        if (this.formItem.allUserRadio == '0' && this.formItem.iconCatId.length == 0 && this.formItem.animCatId.length == 0 && this.formItem.soundCatId.length == 0) {
                            alert("目标人群不能为空");
                            return false;
                        }

                        if (this.formItem.sendTime) {
                            var day = moment(this.formItem.sendTime);
                            this.formItem.sendTime = day.format("YYYY-MM-DD HH:mm:ss")
                        }

                        $.ajax({
                            type: 'POST',
                            url: '${request.contextPath}/push/postadd',
                            data: JSON.stringify(this.formItem),
                            success: (data, status) => {
                                if (data.code == "OK") {
                                    this.formItem.id = data.data.id;
                                    alert("保持push任务成功");
                                } else {
                                    alert("新增push失败");
                                }
                            },
                            dataType: "json",
                            contentType: 'application/json',
                        });
                    }
                },
            mounted() {
                var id = ${(req.id)!0};
                var app = '${(req.app)}';
                this.formItem.app = app;

                //修改
                if (id > 0) {
                    $.ajax({
                        type: 'GET',
                        url: '${request.contextPath}/push/getPushTask?id=' + id,
                        success: (data, status) => {
                            if (data.code == "OK") {
                                var pushTask = data.data.pushTask;

                                this.formItem.id = pushTask.id;
                                this.formItem.taskName = pushTask.taskName;
                                this.formItem.pushTitle = pushTask.pushTitle;
                                this.formItem.pushContent = pushTask.pushContent;
                                this.formItem.sendType = pushTask.sendType;
                                this.formItem.sendTime = pushTask.sendTime;

                                var condition = JSON.parse(pushTask.condition);
                                this.formItem.allUserRadio = String(condition[app].all);
                                this.formItem.iconCatId = condition[app].iconCatId;
                                this.formItem.animCatId = condition[app].animCatId;
                                this.formItem.soundCatId = condition[app].soundCatId;

                                // console.log(JSON.stringify(this.formItem));
                                this.sendTimeRadioChange(this.formItem.sendType);
                            } else {
                                alert("系统错误,请稍后再试");
                            }
                        },
                    });
                }

                this.sendTimeRadioChange(this.formItem.sendType);

                //获取radioGroup
                for (let type of ['iconGroup', 'diconGroup', 'soundGroup']) {
                    $.ajax({
                        type: 'GET',
                        url: '${request.contextPath}/push/getIconRadioList?type=' + type,
                        success: (data, status) => {
                            if (data.code == "OK") {
                                this[type] = data.data.radioList;
                            } else {
                                alert("系统错误,请稍后再试");
                            }
                        },
                    });
                }
            }
        })
    </script>
</aidata-script>