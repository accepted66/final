package com.demo.admin.controller;

import com.demo.admin.bean.request.LoginReq;
import com.demo.admin.bean.response.LoginUserDto;
import com.demo.admin.common.Const;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

/******************************************
 * @author: 毛晖波 (maohuibo@aidata360.cn)
 * @createDate: 2018/11/5 10:23
 * @company: (C) Copyright 智数信通 2018
 * @since: JDK 1.8
 * @Description: TODO
 ******************************************/
@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController extends CommonController {

    @Autowired
    private MongoTemplate mongoTemplate;

    @RequestMapping(value = "/login")
    public String login(@Valid @ModelAttribute("item") LoginReq req, BindingResult result, Model model, HttpServletResponse response) throws Exception {
        if (result.hasErrors()) {
            model.addAttribute("error", "请输入登录各项");
            return "login";
        }
        //验证密码错误
/*      Query query=new Query(Criteria.where("username").is(req.getUsername()).and("password").is(req.getPassword()));
        User user2 = mongoTemplate.findOne(query, User.class);
        log.info(user2.toString());*/
        if (!req.getUsername().equals("demo") && !req.getPassword().equals("demo")) {
            model.addAttribute("error", "用户名或密码错误");
            return "login";
        }
        LoginUserDto user = new LoginUserDto(1L, "demo");
        Cookie cookie = new Cookie(Const.LOGIN_SESSION_KEY, String.valueOf(user.getUserId()));
        cookie.setMaxAge(Const.COOKIE_TIMEOUT);
        cookie.setPath("/");
        response.addCookie(cookie);
        getSession().setAttribute(Const.LOGIN_SESSION_KEY, user);
        return "redirect:/";
    }

    @RequestMapping(value = "/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        getSession().setAttribute(Const.LOGIN_SESSION_KEY, null);
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals(Const.LOGIN_SESSION_KEY)) {
                    cookie.setValue("");
                    cookie.setPath("/");
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
        }
        response.sendRedirect("/login");
    }

}
