package com.demo.admin.core.weblog;

import lombok.Data;

/******************************************
 * @createDate: 2018/12/13
 * @company: (C) Copyright aidata360 2018
 * @since: JDK 1.8
 * @Description:
 ******************************************/
@Data
public class LogBean {

    private String user;
    private String traceId;
    private String dateTime;
    private String className;
    private String method;
    private String path;
    private String ip;
    private long time;

    private String request;
    private String response;
}