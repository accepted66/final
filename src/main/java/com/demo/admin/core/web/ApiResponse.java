package com.demo.admin.core.web;


import com.demo.admin.core.exception.BaseErrorCode;
import com.demo.admin.core.exception.ErrorCode;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/******************************************
 * @createDate: 2018/10/30
 * @company: (C) Copyright aidata360 2018
 * @since: JDK 1.8
 * @Description:
 ******************************************/
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class ApiResponse implements Serializable {
    /**
     * 返回数据对象
     */
    private Map<String, Object> data;

    /**
     * 错误码
     */
    private String code;

    /**
     * 错误原因
     */
    private String msg;

    /**
     * 错误原因详细描述
     */
    private String desc;

    /**
     * 处理时间
     */
    private Long time;

    public void setErrorCode(ErrorCode errorCode) {
        this.code = errorCode.getErrorCode();
        this.msg = errorCode.getErrorMsg();
    }

    public void put(String key, Object value) {
        data.put(key, value);
    }

    /**
     * 构造函数
     */
    public ApiResponse() {
        data = new HashMap();
        time = new Date().getTime();
    }

    public ApiResponse(ErrorCode error) {
        this(error.getErrorCode(), error.getErrorMsg());
    }

    public ApiResponse(String code, String msg) {
        this();
        this.code = code;
        this.msg = msg;
    }

    public ApiResponse(String code, String msg, String desc) {
        this();
        this.code = code;
        this.msg = msg;
        this.desc = desc;
    }

    @SuppressWarnings("unchecked")
    public static ApiResponse buildFail(String code, String msg, String desc) {
        return new ApiResponse(code, msg, desc);
    }

    @SuppressWarnings("unchecked")
    public static ApiResponse buildFail(ErrorCode error) {
        return buildFail(error.getErrorCode(), error.getErrorMsg(), error.getErrorDesc());
    }

    @SuppressWarnings("unchecked")
    public static ApiResponse buildFail() {
        return new ApiResponse(BaseErrorCode.ERR_SYSTEM_ERROR);
    }

    @SuppressWarnings("unchecked")
    public static ApiResponse buildSuccess() {
        return new ApiResponse(BaseErrorCode.SUCCESS);
    }
}