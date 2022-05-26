<div id="app">
    <Card>
        <p slot="title">
            语音包信息
        </p>
        <button-group slot="extra">
            <i-button type="success" @click="addPackge">
                保存
            </i-button>
            <i-button type="primary" @click="goBack">
                返回
            </i-button>
        </button-group>

        <i-form :model="formItem" :label-width="100">

            <form-item label="分类*">
                <i-select v-model="formItem.alidList" style="width:500px" multiple>
                    <i-option v-for="item in allAlbums" :value="item.id" :key="item.id">{{item.name}}</i-option>
                </i-select>
            </form-item>

            <form-item label="配图*">
                <upload action="/voice/uploadImage"
                        :on-success="handleSuccess"
                        :format="['jpg','jpeg','png']"
                        :max-size="2048">
                    <i-button icon="ios-cloud-upload-outline">选择图片</i-button>
                </upload>
                <img :src="formItem.pkImage" width="150px" height="100px">
            </form-item>

            <form-item label="语音包名称*">
                <i-input v-model="formItem.pkName" placeholder="语音包名称"></i-input>
            </form-item>

            <form-item label="语音包介绍">
                <i-input v-model="formItem.pkDesc" placeholder="语音包介绍"></i-input>
            </form-item>

            <form-item label="发布时间*" prop="sendType">
                <radio-group v-model="formItem.sendType" @on-change="sendTypeRadioChange">
                    <radio label="now">立即发送</radio>
                    <radio label="later">定时发送</radio>
                </radio-group>
                <date-picker ref="datetime" type="datetime" v-model="formItem.publishTime"
                             placeholder="发布时间"></date-picker>
            </form-item>

            <form-item label="语音包价格*">
                <i-input v-model="formItem.pkPrice" placeholder="语音包价格"></i-input>
            </form-item>
            <form-item label="价格修改历史">
                <i-card style="width:420px;">
                    <div style="text-align:left">
                        <ul>
                            <li v-for="item in priceHistorys">
                                <span> 修改时间: {{item.changeTime}} , 修改前价格: {{item.price/100}} </span>
                            </li>
                        </ul>
                    </div>
                </i-card>
            </form-item>
            <form-item label="标示">
                <checkbox v-model="formItem.pkIconCheck">NEW</checkbox>
            </form-item>

            <#--            <form-item label="显示顺序">
                            <i-input v-model="formItem.seq" placeholder="1"></i-input>
                        </form-item>-->

            <form-item label="初始播放量">
                <i-input v-model="formItem.listenCountInit" placeholder="0"></i-input>
            </form-item>

            <form-item label="初始点赞量">
                <i-input v-model="formItem.favourCountInit" placeholder="0"></i-input>
            </form-item>

            <form-item label="初始收藏量">
                <i-input v-model="formItem.collectCountInit" placeholder="0"></i-input>
            </form-item>

        </i-form>
    </Card>

    <Card>
        <p slot="title">
            语音文件
        </p>
        <button-group slot="extra">
            <i-button type="success" @click="showAddVoice" v-if="pkid > 0">
                新增
            </i-button>
        </button-group>

        <i-table :row-class-name="rowClassName" :columns="columns" :data="dataList">
            <slot name="header" slot="header"></slot>
            <slot name="footer" slot="footer">
                <Page :total="page.total" :page-size="page.pageSize" :current="page.pageIndex"
                      @on-change="pageChange"/>
            </slot>
            <slot name="loading" slot="loading"></slot>
            <template slot-scope="{ row }" slot="status">
                <span v-if="row.status==1">显示</span>
                <span v-if="row.status==0">隐藏</span>
            </template>
            <template slot-scope="{ row }" slot="voPrice">
                {{row.voPrice/100}}
            </template>
            <template slot-scope="{ row }" slot="voUrl">
                <audio :src="row.voUrl" controls="controls"/>
            </template>
            <template slot-scope="{ row , index }" slot="action">
                <Row style="margin-top:3px">
                    <i-button type="error" size="small" v-if="row.status==1" @click="changeStatus(row,0)">
                        隐藏
                    </i-button>
                    <i-button type="primary" size="small" v-if="row.status==0" @click="changeStatus(row,1)">
                        显示
                    </i-button>
                    <i-button @click="top(index)" size="small" type="primary" v-if="index!=0">
                        置顶
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
                    pkid: null,
                    allAlbums: [],
                    formItem: {},
                    page: {
                        total: 0,
                        pageIndex: 1,
                        pageSize: 20
                    },
                    priceHistorys: [],
                    dataList: [],
                    columns: [
                        {
                            title: 'ID',
                            key: 'id',
                            width: 80
                        },
                        {
                            title: '语音文件名',
                            key: 'voName',
                        },
                        {
                            title: '价格',
                            slot: 'voPrice',
                            width: 80
                        },
                        {
                            title: '资源',
                            slot: 'voUrl',
                            width: 330
                        },
                        {
                            title: '播放量',
                            key: 'listenCount',
                            width: 100
                        },
                        {
                            title: '收藏量',
                            key: 'collectCount',
                            width: 100
                        },
                        {
                            title: '购买量',
                            key: 'voiceBuyCount',
                            width: 100,
                            sortable: true
                        },
                        /*                        {
                                                    title: '创建时间',
                                                    key: 'createTime',
                                                    width: 180,
                                                    sortable: true
                                                },*/
                        {
                            title: '操作',
                            slot: 'action',
                            width: 140
                        },
                    ],
                }
            },
            methods:
                {
                    rowClassName(row, index) {
                        if (row.status == 0) {
                            return 'table-hidden-row';
                        }
                        return '';
                    },
                    handleSuccess(data, file) {
                        if (data.code == "OK") {
                            this.formItem.pkImage = data.data.url
                        }
                    },
                    play(row) {
                        window.location = row.voUrl;
                    },
                    goBack() {
                        window.location = '/voice/pk/index';
                    },
                    sendTypeRadioChange() {

                    },
                    showAddVoice() {
                        if (this.pkid > 0) {
                            window.location = "/voice/vo/add?id=" + this.pkid;
                        }
                    },
                    changeStatus(row, status) {
                        axios.post('/voice/switchVo', {
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
                    addPackge() {

                        if (this.formItem.pkIconCheck) {
                            this.formItem.pkIcon = 'new'
                        } else {
                            this.formItem.pkIcon = ''
                        }
                        if (!((this.formItem.pkPrice) >= 0)) {
                            this.$Message.error("价格错误");
                            return false;
                        }
                        if (this.formItem.publishTime) {
                            var day = moment(this.formItem.publishTime);
                            this.formItem.publishTime = day.format("YYYY-MM-DD HH:mm:ss")
                        }

                        //修改价格
                        var formItem = $.extend(true, {}, this.formItem);
                        console.info(formItem.pkPrice);
                        var r = new BigDecimal(formItem.pkPrice + '').multiply(new BigDecimal('100'));
                        formItem.pkPrice = r.setScale(0).toString()
                        console.info(formItem.pkPrice);
                        $.ajax({
                            type: 'POST',
                            url: '/voice/addPkg',
                            data: JSON.stringify(formItem),
                            success: (data, status) => {
                                if (data.code == "OK") {
                                    this.pkid = data.data.pkid;
                                    this.$Message.success({
                                        content: '语音包保存成功!',
                                        duration: 1,
                                        onClose: function () {
                                            window.location.href = '/voice/pk/index';
                                        }
                                    });
                                    // console.log(JSON.stringify(data.data.pageInfo.list))
                                } else {
                                    this.$Message.error("系统错误");
                                }
                            },
                            contentType: 'application/json',
                        });
                    },
                    top(index) {
                        var self = this
                        let row = this.dataList[index]
                        let query = {
                            id: row.id
                        }
                        axios.post('/voice/topVo', query)
                            .then(response => {
                                self.show()
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
                        axios.post('/voice/changeSeqVo', query)
                            .then(response => {
                                self.show()
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
                        axios.post('/voice/changeSeqVo', query)
                            .then(response => {
                                self.show()
                            })
                            .catch(error => {
                                console.log(error)
                            });
                    },
                    pageChange(p) {
                        this.page.pageIndex = p
                        this.show()
                    },
                    show() {
                        $.ajax({
                            type: 'POST',
                            url: '/voice/getAllAlbum',
                            success: (data, status) => {
                                if (data.code == "OK") {
                                    this.allAlbums = data.data.allAlbums
                                } else {
                                    this.$Message.error("系统错误");
                                }
                            },
                            contentType: 'application/json',
                        });

                        //入参
                        var pkid = ${(req.id)!0};
                        if (pkid > 0) {
                            this.pkid = pkid;

                            $.ajax({
                                type: 'POST',
                                url: '/voice/getPkgVoices',
                                data: JSON.stringify({
                                    id: pkid,
                                    pageIndex: this.page.pageIndex,
                                    pageSize: this.page.pageSize
                                }),
                                success: (data, status) => {
                                    if (data.code == "OK") {
                                        this.dataList = data.data.pageInfo.list
                                        this.page.pageIndex = data.data.pageInfo.pageNum
                                        this.page.total = data.data.pageInfo.total
                                    } else {
                                        this.$Message.error("系统错误");
                                    }
                                },
                                contentType: 'application/json',
                            });

                            $.ajax({
                                type: 'POST',
                                url: '/voice/getPkg',
                                data: JSON.stringify({id: pkid}),
                                success: (data, status) => {
                                    if (data.code == "OK") {
                                        this.formItem = data.data.pkg
                                        this.priceHistorys = JSON.parse(data.data.priceHistorys)
                                        for (var i = 0; i < this.priceHistorys.length; i++) {
                                            this.priceHistorys[i].changeTime = Bee.DateUtils.formt(this.priceHistorys[i].changeTime, "yyyy-MM-dd HH:mm:ss");
                                        }
                                        if (this.formItem.pkIcon == 'new') {
                                            this.formItem.pkIconCheck = true;
                                        }

                                        if (parseFloat(this.formItem.pkPrice) > 0) {
                                            this.formItem.pkPrice = this.formItem.pkPrice / 100
                                        }

                                        if (this.formItem.status == -1) {
                                            this.formItem.sendType = 'later'
                                        } else {
                                            this.formItem.sendType = 'now'
                                        }

                                    } else {
                                        this.$Message.error("系统错误");
                                    }
                                },
                                contentType: 'application/json',
                            });
                        }
                    }
                },
            mounted() {
                this.$Message.config({
                    top: 100,
                    duration: 3
                });
                this.show()
            }

        })
    </script>
</aidata-script>