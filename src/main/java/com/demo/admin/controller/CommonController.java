package com.demo.admin.controller;

import com.demo.admin.core.web.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/******************************************
 * @createDate: 2020/12/2 10:51
 * @since: JDK 1.8
 * @Description: TODO
 ******************************************/
@Controller
@Slf4j
@RequestMapping("common")
public class CommonController extends BaseController {

    @RequestMapping("/upload")
    public String upload(@RequestParam("app") String app, @RequestParam("path") String path, Model model) {
        model.addAttribute("app", app);
        model.addAttribute("path", path);

        return "com/upload";
    }

    protected HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }

    protected HttpSession getSession() {
        return getRequest().getSession();
    }


}
