<div id="app">
    <Card>
        <p slot="title">
            语音包分类列表
        </p>
        <button-group slot="extra">
            <i-button type="success" @click="cleanCache">
                更新缓存
            </i-button>
            <i-button type="success" @click="modal = true">
                新增
            </i-button>
        </button-group>

        <i-form :model="formItem" inline>
            <form-item>
                <i-input v-model="formItem.search" placeholder="关键词"></i-input>
            </form-item>

            <form-item>
                <i-select v-model="formItem.status" style="width:200px" placeholder="状态">
                    <i-option value="">全部</i-option>
                    <i-option value="1">显示</i-option>
                    <i-option value="0">隐藏</i-option>
                </i-select>
            </form-item>

            <form-item>
                <i-button type="primary" @click="doSearch">
                    搜索
                </i-button>
            </form-item>
        </i-form>

        <i-table :row-class-name="rowClassName" :columns="columns" :data="dataList">
            <template slot-scope="{ row }" slot="status">
                <span v-if="row.status==1">显示</span>
                <span v-if="row.status==0">隐藏</span>
            </template>
            <template slot-scope="{ row, index }" slot="action">
                <Row style="margin-top:3px">
                    <i-button type="success" size="small" @click="showMod(row)">
                        编辑
                    </i-button>
                    <i-button type="error" size="small" v-if="row.status==1" @click="changeStatus(row,0)">
                        隐藏
                    </i-button>
                    <i-button type="primary" size="small" v-if="row.status==0" @click="changeStatus(row,1)">
                        显示
                    </i-button>
                </Row>
                <Row style="margin-top:3px">
                    <i-button @click="down(index)" size="small" type="primary" v-if="index<(dataList.length-1)">
                        下移
                    </i-button>
                    <i-button @click="up(index)" size="small" type="primary" v-if="index>0">
                        上移
                    </i-button>
                </Row>
                <Row style="margin-top:3px">
                    <i-button @click="top(index)" size="small" type="primary" v-if="index!=0">
                        置顶
                    </i-button>
                </Row>
            </template>
        </i-table>

        <Modal v-model="modal" title="新建语音分类" @on-ok="addAlbum">
            <i-form :model="formItem" :label-width="100">
                <form-item label="分类名称*">
                    <i-input v-model="formItem.alName" placeholder="名称"></i-input>
                </form-item>

<#--                <form-item label="显示顺序">
                    <i-input v-model="formItem.seq" placeholder="不填默认第一位"></i-input>
                </form-item>-->

            </i-form>

        </Modal>
    </Card>
</div>

<aidata-script>
    <script>
        new Vue({
            el: '#app',
            data() {
                return {
                    modal: false,
                    formItem: {},
                    dataList: [],
                    columns: [
                        {
                            title: 'ID',
                            key: 'id'
                        },
                        {
                            title: '分类名称',
                            key: 'alName'
                        },
                        {
                            title: '语音包数量',
                            key: 'pkCount'
                        },
                        {
                            title: '语音包购买量',
                            key: 'pkSales',
                            sortable: true
                        },
                        {
                            title: '语音购买量',
                            key: 'voSales',
                            sortable: true
                        },
                        {
                            title: '状态',
                            slot: 'status'
                        },
                        {
                            title: '发布时间',
                            key: 'createTime',
                            sortable: true
                        },
                        {
                            title: '操作',
                            slot: 'action'
                        },
                    ]
                }
            },
            methods:
                {
                    rowClassName(row, index) {
                        if (row.status === 0) {
                            return 'table-hidden-row';
                        }
                        return '';
                    },
                    addAlbum() {
                        var self = this
                        axios.post('/voice/addAl', {
                            "alName": this.formItem.alName
                        })
                            .then(response => {
                                if (response.data.code == 'OK') {
                                    self.doSearch()
                                    this.$Message.success('保存成功');
                                }
                            })
                            .catch(error => {
                                console.log(error)
                            });

                    },
                    cleanCache() {
                        window.location = "/cache/clean?keyPrefix=voice:album";
                    },
                    showMod(row) {
                        window.location = "/voice/al/mod?id=" + row.id
                    },
                    changeStatus(row, alStatus) {
                        axios.post('/voice/switchAl', {
                            "id": row.id,
                            "status": alStatus
                        })
                            .then(response => {
                                if (response.data.code == 'OK') {
                                    row.status = alStatus
                                }
                            })
                            .catch(error => {
                                console.log(error)
                            });
                    },
                    doSearch() {
                        axios.post('${request.contextPath}/voice/searchAl', this.formItem)
                            .then(response => {
                                if (response.data.code == 'OK') {
                                    this.dataList = response.data.data.pageInfo.list
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
                            id: row.id
                        }
                        axios.post('/voice/topAl', query)
                            .then(response => {
                                self.doSearch()
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
                            downId: downRow.id,
                            downSeq: upRow.seq,
                            upId: upRow.id,
                            upSeq: downRow.seq
                        }
                        axios.post('/voice/changeSeqAl', query)
                            .then(response => {
                                self.doSearch()
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
                            downId: downRow.id,
                            downSeq: upRow.seq,
                            upId: upRow.id,
                            upSeq: downRow.seq
                        }
                        axios.post('/voice/changeSeqAl', query)
                            .then(response => {
                                self.doSearch()
                            })
                            .catch(error => {
                                console.log(error)
                            });
                    }
                },
            mounted() {
                this.$Message.config({
                    top: 100,
                    duration: 3
                });
                this.doSearch();
            }

        })
    </script>
</aidata-script>