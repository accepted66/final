package com.demo.admin.core.exception;

import lombok.Data;

/**
 * @author: 飞鸟 (feiniao@51huxin.com)
 * @createDate: 2017/7/24
 * @company: (C) Copyright 阳光互信 2017
 * @since: JDK 1.8
 * @description:
 */
@Data
public abstract class AbstractErrorCodeException extends RuntimeException {
    private static final long serialVersionUID = -239271176553209759L;

    /**
     * 异常信息对象,包含
     */
    protected ErrorCode errorCode;

    /**
     * @param errorCode 异常的代码
     */
    public AbstractErrorCodeException(ErrorCode errorCode) {
        this.errorCode = errorCode;
    }

    /**
     * @param errorCode  异常的代码
     * @param cause 原始错误信息，异常链的上层。
     */
    public AbstractErrorCodeException(ErrorCode errorCode, Throwable cause) {
        super(cause);
        this.errorCode = errorCode;
    }
}
