package com.demo.admin.core.exception;


/**
 * @author: 飞鸟 (feiniao@51huxin.com)
 * @createDate: 2017/5/10
 * @company: (C) Copyright 阳光互信 2017
 * @since: JDK 1.8
 * @description: 系统基础异常类,业务异常继承此类
 */
public class BaseErrorCode {

    //处理成功
    public static final ErrorCode SUCCESS = ErrorCode.of("OK", "调用成功");

    //通用错误
    public static final ErrorCode ERR_SYSTEM_ERROR = ErrorCode.of("ERR_SYSTEM_ERROR", "系统繁忙,请稍后再试");
    //未定义错误
    public static final ErrorCode ERR_SYSTEM_UNKNOW = ErrorCode.of("ERR_SYSTEM_UNKNOW", "未知错误");

    //鉴权失败错误
    public static final ErrorCode ERR_SYSTEM_UNAUTHENTICATED = ErrorCode.of("ERR_SYSTEM_UNAUTHENTICATED", "未登陆");
    public static final ErrorCode ERR_SYSTEM_AUTH_REJECT = ErrorCode.of("ERR_SYSTEM_AUTH_REJECT", "非法请求");

    //参数校验相关错误码
    public static final ErrorCode ERR_SYSTEM_PARAM_MISSING = ErrorCode.of("ERR_SYSTEM_PARAM_MISSING", "缺少关键参数");
    public static final ErrorCode ERR_SYSTEM_PARAM_CHECK = ErrorCode.of("ERR_SYSTEM_PARAM_CHECK", "参数校验失败");


    //分层通用错误码
    public static final ErrorCode ERR_SYSTEM_API_ERROR = ErrorCode.of("ERR_SYSTEM_API_ERROR", "请求的接口异常");
    public static final ErrorCode ERR_SYSTEM_SERVICE_ERROR = ErrorCode.of("ERR_SYSTEM_SERVICE_ERROR", "请求的服务异常");
    public static final ErrorCode ERR_SYSTEM_DAO_ERROR = ErrorCode.of("ERR_SYSTEM_DAO_ERROR", "请求的数据异常");
}