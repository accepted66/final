package com.demo.admin.core.web;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

/******************************************
 * @createDate: 2018/10/30
 * @company: (C) Copyright aidata360 2018
 * @since: JDK 1.8
 * @Description:
 ******************************************/
@ControllerAdvice
public class ApiResponseHandler implements ResponseBodyAdvice<Object> {

    @Value("${spring.profiles.active}")
    private String profileActive;

    @Override
    public boolean supports(MethodParameter methodParameter, Class<? extends HttpMessageConverter<?>> aClass) {
        return "release".equalsIgnoreCase(profileActive);
    }

    @Override
    public Object beforeBodyWrite(Object o, MethodParameter methodParameter, MediaType mediaType, Class<? extends HttpMessageConverter<?>> aClass, ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
        if (o instanceof ApiResponse) {
            ApiResponse result = (ApiResponse) o;
            result.setDesc(null);
            return result;
        }
        return o;
    }

}
