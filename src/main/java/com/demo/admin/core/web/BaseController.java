package com.demo.admin.core.web;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.RandomUtil;
import freemarker.ext.beans.BeansWrapper;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModelException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.resource.ResourceUrlProvider;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/******************************************
 * @createDate: 2018/10/30
 * @company: (C) Copyright aidata360 2018
 * @since: JDK 1.8
 * @Description:
 ******************************************/
@Slf4j
public class BaseController {

    @Value("${spring.profiles.active}")
    private String profileActive;

    @Autowired
    ResourceUrlProvider resourceUrlProvider;

    private final static BeansWrapper wrapper = BeansWrapper.getDefaultInstance();
    private final static TemplateHashModel staticModels = wrapper.getStaticModels();

    protected static TemplateHashModel useStaticPacker(String packname) {
        TemplateHashModel fileStatics = null;
        try {
            fileStatics = (TemplateHashModel) staticModels.get(packname);
        } catch (TemplateModelException e) {
            e.printStackTrace();
        }
        return fileStatics;
    }

    public void checkParameters(BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            StringBuilder sb = new StringBuilder();
            for (Object object : bindingResult.getAllErrors()) {
                if (object instanceof FieldError) {
                    FieldError fieldError = (FieldError) object;
                    sb.append("[ " + fieldError.getField() + " : " + fieldError.getDefaultMessage() + " ]; ");
                }
            }
            throw new IllegalArgumentException(sb.toString());
        }
    }

    @ModelAttribute
    public void addAttributes(HttpServletRequest request, Model model) {
        model.addAttribute("clientUrl", "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath());
        model.addAttribute("controller", this);
        model.addAttribute("mathUtil", useStaticPacker("com.demo.admin.util.MathUtil"));
        model.addAttribute("referer", request.getHeader("Referer"));
    }

    protected String getBatchNo() {
        return DateUtil.format(DateUtil.date(), "yyyyMMddHHmmss") + RandomUtil.randomNumbers(6);
    }

    @ModelAttribute("urls")
    public ResourceUrlProvider urls() {
        return this.resourceUrlProvider;
    }

    @ModelAttribute("profileActive")
    protected String profileActive() {
        return profileActive;
    }

}