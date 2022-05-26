package com.demo.admin.core.web;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.io.Serializable;


/******************************************
 * @createDate: 2018/10/30
 * @company: (C) Copyright aidata360 2018
 * @since: JDK 1.8
 * @Description:
 ******************************************/
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ApiRequest<T> implements Serializable {
    /**
     * 应用名称
     */
    private String app;
    /**
     * 接口名称
     */
    private String api;
    /**
     * 接口版本
     */
    private String v;
    /**
     * 接口签名
     */
    private String sig;
    /**
     * 请求时间
     */
    private String t;


    /**
     * 请求参数
     */
    @Valid
    @NotNull
    protected T data;


    public static <T> ApiRequest<T> build(T data) {
        ApiRequest<T> request = new ApiRequest<>();
        request.setData(data);
        return request;
    }
}