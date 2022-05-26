package com.demo.admin.core.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.ContentCachingRequestWrapper;

import javax.servlet.http.HttpServletRequest;

/******************************************
 * @author: 毛晖波 (maohuibo@aidata360.cn)
 * @createDate: 2018/12/10 18:14
 * @company: (C) Copyright 智数信通 2018
 * @since: JDK 1.8
 * @Description: 统一异常处理advice
 ******************************************/
@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(value = Exception.class)
    public String defaultErrorHandler(Exception ex, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) throws Exception {
        log.info("请求地址：{} " , request.getRequestURL());
        if (request instanceof ContentCachingRequestWrapper) {
            log.error("请求内容：{} ", new String(((ContentCachingRequestWrapper) request).getContentAsByteArray()));
        }
        log.error("异常信息：", ex);

        String message = ex.getMessage();
        if (ex instanceof AbstractErrorCodeException) {
            message = ((AbstractErrorCodeException) ex).getErrorCode().getErrorMsg();
        }
        //直接模板渲染会因为minipage原因造成左侧导航消失
        redirectAttributes.addFlashAttribute("errorMessage", message);

        return "redirect:/error_message";
    }
}
