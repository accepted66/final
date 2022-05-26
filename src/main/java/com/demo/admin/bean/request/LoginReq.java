package com.demo.admin.bean.request;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/******************************************
 * @author: 毛晖波 (maohuibo@aidata360.cn)
 * @createDate: 2018/12/20 18:28
 * @company: (C) Copyright 智数信通 2018
 * @since: JDK 1.8
 * @Description: TODO
 ******************************************/
@Data
public class LoginReq {

    @NotBlank
    private String username;
    @NotBlank
    private String password;

}
