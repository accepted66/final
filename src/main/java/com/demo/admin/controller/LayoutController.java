package com.demo.admin.controller;

import com.demo.admin.core.web.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/******************************************
 * @author: 毛晖波 (maohuibo@aidata360.cn)
 * @createDate: 2018/10/30 15:24
 * @company: (C) Copyright 智数信通 2018
 * @since: JDK 1.8
 * @Description: sitemesh渲染框架控制器
 ******************************************/
@Controller
@Slf4j
public class LayoutController extends BaseController {

    @RequestMapping("/login")
    public String t16() {
        return "login";
    }

    @RequestMapping("/")
    public String index(HttpServletRequest request, Model model) {

        return "redirect:/demo/list";
    }

    @RequestMapping("/layout")
    public String layout(HttpServletRequest request, Model model) {
        return "global/layout";
    }

    @RequestMapping("/mini_layout")
    public String mini_layout(HttpServletRequest request, Model model) {
        return "global/mini_layout";
    }

    @RequestMapping("/layout_nojs")
    public String layoutNojs(HttpServletRequest request, Model model) {
        return "global/layout_nojs";
    }

    @RequestMapping("/layout_body")
    public String layoutbody(HttpServletRequest request, Model model) {
        return "global/layout_body";
    }

    @RequestMapping("/layout_vue")
    public String layoutVue(HttpServletRequest request, Model model) {
        return "global/layout_vue";
    }

    @RequestMapping("/layout_none")
    public String layoutNone(HttpServletRequest request, Model model) {
        return "global/layout_none";
    }


    @RequestMapping("/error_message")
    public String error(@ModelAttribute("errorMessage") String message, Model model, RedirectAttributes redirectAttributes,HttpServletRequest request) {
        redirectAttributes.addFlashAttribute("errorMessage", message);

        return "global/error";
    }

    @RequestMapping("/info_message")
    public String info(@ModelAttribute("infoMessage") String message, Model model, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("infoMessage", message);

        return "global/info";
    }

}
