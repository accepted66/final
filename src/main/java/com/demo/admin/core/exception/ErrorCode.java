package com.demo.admin.core.exception;

import java.io.Serializable;

/**
 * @author: 飞鸟 (feiniao@51huxin.com)
 * @createDate: 2017/5/10
 * @company: (C) Copyright 阳光互信 2017
 * @since: JDK 1.8
 * @description: 异常信息描述
 */
public class ErrorCode implements Serializable {

    private String errorCode;
    private String errorMsg;
    private String errorDesc;

    public ErrorCode(String errorCode, String errorMsg) {
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
    }

    public ErrorCode(String errorCode, String errorMsg, String errorDesc) {
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
        this.errorDesc = errorDesc;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public String getErrorDesc() {
        return errorDesc;
    }

    public ErrorCode withErrorMsg(String errorMsg) {
        return new ErrorCode(this.errorCode, errorMsg);
    }

    public ErrorCode withErrorDesc(String errorDesc) {
        return new ErrorCode(this.errorCode, this.errorMsg, errorDesc);
    }


    public ErrorCode() {
    }

    @Override
    public String toString() {
        return "ErrorCode{" +
                "errorCode='" + errorCode +
                "', errorMsg='" + errorMsg +
                "', errorDesc='" + errorDesc +
                "'}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ErrorCode error = (ErrorCode) o;

        if (!this.errorCode.equals(error.errorCode)) return false;
        return errorMsg.equals(error.errorMsg);

    }

    @Override
    public int hashCode() {
        int result = errorCode.hashCode();
        result = 31 * result + errorMsg.hashCode();
        return result;
    }

    public static ErrorCode of(String errorCode, String errorMsg) {
        return new ErrorCode(errorCode, errorMsg);
    }
}
