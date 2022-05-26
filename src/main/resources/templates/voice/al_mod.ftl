<div id="app">
    <Card>
        <p slot="title">
            修改语音分类
        </p>
        <button-group slot="extra">
            <i-button type="success" @click="addAlbum">
                保存
            </i-button>
            <i-button type="primary" @click="goBack">
                返回
            </i-button>
        </button-group>

        <i-form :model="formItem" :label-width="120">

            <form-item label="分类名称*">
                <i-input v-model="formItem.alName" placeholder="名称"></i-input>
            </form-item>

<#--            <form-item label="展示顺序*">
                <i-input v-model="formItem.seq" placeholder="顺序"></i-input>
            </form-item>-->

        </i-form>


        <Card>
            <p slot="title">
                语音包
            </p>

            <i-table :columns="columns" :data="dataList">
                <template slot-scope="{ row, index }" slot="action">
                    <i-button @click="top(index)" size="small" type="primary" v-if="index!=0">
                        置顶
                    </i-button>
                    <i-button @click="down(index)" size="small" type="primary" v-if="index<(dataList.length-1)">
                        下移
                    </i-button>
                    <i-button @click="up(index)" size="small" type="primary" v-if="index>0">
                        上移
                    </i-button>
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
                    alId: ${req.id},
                    formItem: {},
                    dataList: [],
                    columns: [
                        {
                            title: '序号',
                            key: 'id'
                        },
                        {
                            title: '语音包名称',
                            key: 'pkName'
                        },
                        {
                            title: '操作',
                            slot: 'action'
                        },
                    ],
                }
            },
            methods:
                {
                    changeSeq(row, seq) {

                    },
                    goBack() {
                        history.go(-1)
                    },
                    addAlbum() {
                        var self = this
                        axios.post('/voice/addAl', {
                            "alName": this.formItem.alName,
                            "seq": this.formItem.seq,
                            "id": this.alId
                        })
                            .then(response => {
                                if (response.data.code == 'OK') {
                                    self.showAlbum()
                                    this.$Message.success('保存成功');
                                }
                            })
                            .catch(error => {
                                console.log(error)
                            });
                    },
                    showAlbum() {
                        var self = this
                        axios.post('/voice/getAl', {
                            "id": this.alId
                        })
                            .then(response => {
                                if (response.data.code == 'OK') {
                                    self.formItem = response.data.data.al;
                                }
                            })
                            .catch(error => {
                                console.log(error)
                            });
                        axios.post('/voice/searchAlPk', {
                            "alId": this.alId
                        })
                            .then(response => {
                                if (response.data.code == 'OK') {
                                    self.dataList = response.data.data.list
                                }
                            })
                            .catch(error => {
                                console.log(error)
                            });
                    },
                    top(index) {
                        var self = this
                        let row = this.dataList[index]
                        let query = {
                            id: row.apId
                        }
                        axios.post('/voice/topPk', query)
                            .then(response => {
                                self.showAlbum()
                            })
                            .catch(error => {
                                console.log(error)
                            });
                    },
                    down(index) {
                        var self = this
                        let downRow = this.dataList[index]
                        let upRow = this.dataList[index + 1]
                        let query = {
                            downId: downRow.apId,
                            downSeq: upRow.seq,
                            upId: upRow.apId,
                            upSeq: downRow.seq
                        }
                        axios.post('/voice/changeSeqPk', query)
                            .then(response => {
                                self.showAlbum()
                            })
                            .catch(error => {
                                console.log(error)
                            });
                    },
                    up(index) {
                        var self = this
                        let downRow = this.dataList[index - 1]
                        let upRow = this.dataList[index]
                        let query = {
                            downId: downRow.apId,
                            downSeq: upRow.seq,
                            upId: upRow.apId,
                            upSeq: downRow.seq
                        }
                        axios.post('/voice/changeSeqPk', query)
                            .then(response => {
                                self.showAlbum()
                            })
                            .catch(error => {
                                console.log(error)
                            });
                    }
                },
            mounted() {
                this.showAlbum();
                this.$Message.config({
                    top: 100,
                    duration: 3
                });
            }
        })
    </script>
</aidata-script>