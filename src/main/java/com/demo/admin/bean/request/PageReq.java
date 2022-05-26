package com.demo.admin.bean.request;

import lombok.Data;

/******************************************
 * @author: 毛晖波 (maohuibo@aidata360.cn)
 * @createDate: 2018/11/8 17:19
 * @company: (C) Copyright 智数信通 2018
 * @since: JDK 1.8
 * @Description: TODO
 ******************************************/
@Data
public class PageReq {

    private Integer pageIndex = 1;
    private Integer pageSize = 20;

}
