package com.demo.admin.core.exception;


import lombok.Data;

/**
 * 业务异常类
 */
@Data
public class BusinessException extends AbstractErrorCodeException {
    private static final long serialVersionUID = -4124349350102482904L;

    /**
     * @param errorCode 异常的代码
     */
    public BusinessException(ErrorCode errorCode) {
        super(errorCode);
    }

    /**
     * @param code    异常的代码
     * @param content 异常的文案，出现在JsonResult中。
     */
    public BusinessException(String code, String content) {
        super(ErrorCode.of(code, content));
    }

    /**
     * @param errorCode  异常的代码
     * @param cause 原始错误信息，异常链的上层。
     */
    public BusinessException(ErrorCode errorCode, Throwable cause) {
        super(errorCode, cause);
    }
}