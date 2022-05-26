package com.demo.admin.core.weblog;

import cn.hutool.core.date.DateUtil;
import cn.hutool.json.JSONUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/******************************************
 * @createDate: 2018/12/13
 * @company: (C) Copyright aidata360 2018
 * @since: JDK 1.8
 * @Description:
 ******************************************/
@Aspect
@Component
@Slf4j
public class ControllerLog {

    ThreadLocal<LogBean> threadLocal = new ThreadLocal<>();

    @Pointcut("execution(public * com.demo.admin.controller.*.*(..))")
    public void log() {
    }

    /**
     * @Before 在方法执行之前执行
     */
    @Before("log()")
    public void doBefore(JoinPoint joinPoint) {
        LogBean logBean = new LogBean();

        //记录http请求
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        logBean.setUser(getLoginUser(request));
        logBean.setDateTime(DateUtil.now());
        logBean.setClassName(joinPoint.getSignature().getDeclaringTypeName());
        logBean.setIp(request.getRemoteAddr());
        logBean.setMethod(joinPoint.getSignature().getName());
        logBean.setTime(System.currentTimeMillis());
        logBean.setPath(request.getRequestURI());

        threadLocal.set(logBean);
    }

    /**
     * @After 在方法执行之后执行
     */
    @After("log()")
    public void doAfter() {
    }

    @AfterReturning(returning = "object", pointcut = "log()")
    public void doAfterReturning(Object object) {
        LogBean logBean = threadLocal.get();
        threadLocal.remove();
        logBean.setTime(System.currentTimeMillis() - logBean.getTime());

        log.info(JSONUtil.toJsonStr(logBean));
    }

    private String getLoginUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session == null) {
            return "unknown";
        }
        return (String) session.getAttribute("username");
    }
}