package com.demo.admin.config;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

/******************************************
 * @author: 毛晖波 (maohuibo@aidata360.cn)
 * @createDate: 2018/12/10 18:14
 * @company: (C) Copyright 智数信通 2018
 * @since: JDK 1.8
 * @Description: 统一处理对输入文本trim操作
 ******************************************/
@ControllerAdvice
public class GlobalStrTrimmer {

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(false);
        binder.registerCustomEditor(String.class, stringtrimmer);
    }
}