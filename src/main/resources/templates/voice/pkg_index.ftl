<div id="app">
    <Card>
        <p slot="title">
            语音包列表
        </p>
        <button-group slot="extra">
            <i-button type="success" @click="doAdd">
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
                    <i-option value="-1">定时</i-option>
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
            <slot name="header" slot="header"></slot>
            <slot name="footer" slot="footer">
                <Page :total="formItem.total" :page-size="formItem.pageSize" :current="formItem.pageIndex"
                      @on-change="pageChange"/>
            </slot>
            <slot name="loading" slot="loading"></slot>
            <template slot-scope="{ row }" slot="alNameList">
                {{row.alNameList.join(',')}}
            </template>
            <template slot-scope="{ row }" slot="pkImage">
                <img :src="row.pkImage" width="150" height="100"/>
            </template>
            <template slot-scope="{ row }" slot="pkPrice">
                {{row.pkPrice/100}}
            </template>
            <template slot-scope="{ row }" slot="status">
                <span v-if="row.status==1">显示</span>
                <span v-if="row.status==0">隐藏</span>
                <span v-if="row.status==-1">定时</span>
            </template>
            <template slot-scope="{ row }" slot="action">
                <i-button type="success" size="small" @click="doMod(row)">
                    编辑
                </i-button>
                <i-button type="error" size="small" v-if="row.status==1" @click="changeStatus(row,0)">
                    隐藏
                </i-button>
                <i-button type="primary" size="small" v-if="row.status==0" @click="changeStatus(row,1)">
                    显示
                </i-button>
            </template>
        </i-table>
    </Card>
</div>

<aidata-script>
    <script>
        new Vue({
            el: '#app',
            data() {
                return {
                    formItem: {
                        total: 0,
                        pageIndex: 1,
                        pageSize: 20
                    },
                    dataList: [],
                    columns: [
                        {
                            title: 'ID',
                            key: 'id',
                            width: 80,
                            fixed: 'left'
                        },
                        {
                            title: '语音包名称',
                            key: 'pkName',
                            width: 150,
                            fixed: 'left'
                        },
                        {
                            title: '配图',
                            slot: 'pkImage',
                            width: 200,

                        },
                        {
                            title: '分类',
                            slot: 'alNameList',
                            width: 150
                        },
                        {
                            title: '标识',
                            key: 'pkIcon',
                            width: 80
                        },
                        {
                            title: '价格',
                            slot: 'pkPrice',
                            width: 100
                        },
                        {
                            title: '播放量',
                            key: 'listenCount',
                            width: 100,
                            sortable: true
                        },
                        {
                            title: '点赞量',
                            key: 'favourCount',
                            width: 100,
                            sortable: true
                        },
                        {
                            title: '收藏量',
                            key: 'collectCount',
                            width: 100,
                            sortable: true
                        },
                        {
                            title: '语音包购买量',
                            key: 'pkgBuyCount',
                            width: 140,
                            sortable: true
                        },
                        {
                            title: '语音购买量',
                            key: 'pkgVoiceBuyCount',
                            width: 130,
                            sortable: true
                        },
                        {
                            title: '状态',
                            slot: 'status',
                            width: 100
                        },
                        {
                            title: '发布时间',
                            key: 'publishTime',
                            width: 200,
                            sortable: true
                        },
                        {
                            title: '操作',
                            slot: 'action',
                            width: 150,
                            fixed: 'right'
                        },
                    ]
                }
            },
            methods:
                {
                    rowClassName(row, index) {
                        if (row.status === 0) {
                            return 'table-hidden-row';
                        } else if (row.status === -1) {
                            return 'table-period-row'
                        }
                        return '';
                    },
                    doMod(row) {
                        window.location = "/voice/pk/add?id=" + row.id
                    },
                    changeStatus(row, status) {
                        axios.post('/voice/switchPk', {
                            "id": row.id,
                            "status": status
                        })
                            .then(response => {
                                if (response.data.code == 'OK') {
                                    row.status = status
                                }
                            })
                            .catch(error => {
                                console.log(error)
                            });
                    },
                    pageChange(p) {
                        this.formItem.pageIndex = p
                        this.doSearch()
                    },
                    doSearch() {
                        $.ajax({
                            type: 'POST',
                            url: '${request.contextPath}/voice/searchPk',
                            data: JSON.stringify(this.formItem),
                            success: (data, status) => {
                                if (data.code == "OK") {
                                    this.dataList = data.data.pageInfo.list
                                    this.formItem.pageIndex = data.data.pageInfo.pageNum
                                    this.formItem.total = data.data.pageInfo.total
                                    // console.log(JSON.stringify(data.data.pageInfo.list))
                                } else {
                                    alert("系统错误");
                                }
                            },
                            contentType: 'application/json',
                        });
                    },
                    doAdd() {
                        window.location = "/voice/pk/add"
                    }
                },
            mounted() {
                this.doSearch();
            }

        })
    </script>
</aidata-script>