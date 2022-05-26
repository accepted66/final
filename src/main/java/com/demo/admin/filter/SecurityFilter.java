package com.demo.admin.filter;

import cn.hutool.core.util.StrUtil;
import com.demo.admin.bean.response.LoginUserDto;
import com.demo.admin.common.Const;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@Slf4j
public class SecurityFilter implements Filter {

    private static Set<String> GreenUrlSet = new HashSet<String>();

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        GreenUrlSet.add("/date_time");
        GreenUrlSet.add("/login");
        GreenUrlSet.add("/layout");
        GreenUrlSet.add("/admin/login");
        GreenUrlSet.add("/admin/logout");
        GreenUrlSet.add("/captcha/code");
    }

    @Override
    public void doFilter(ServletRequest srequest, ServletResponse sresponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) srequest;
        String uri = request.getRequestURI();
        if (request.getSession().getAttribute(Const.LOGIN_SESSION_KEY) == null) {
            Cookie[] cookies = request.getCookies();
            if (containsSuffix(uri) || GreenUrlSet.contains(uri)) {
                log.debug("don't check  url , " + request.getRequestURI());
                filterChain.doFilter(srequest, sresponse);
                return;
            } else if (cookies != null) {
                boolean flag = true;
                for (int i = 0; i < cookies.length; i++) {
                    Cookie cookie = cookies[i];
                    if (cookie.getName().equals(Const.LOGIN_SESSION_KEY)) {
                        if (StrUtil.isNotBlank(cookie.getValue())) {
                            flag = false;
                        } else {
                            break;
                        }
                        String value = getUserId(cookie.getValue());
                        Long userId = 0L;
                        if (StrUtil.isNotBlank(value)) {
                            userId = Long.parseLong(value);
                        }
                        //PartAdmin admin = partAdminMapper.selectByPrimaryKey(userId);
                        LoginUserDto user = new LoginUserDto(userId, "demo");
                        String html = "";
                        if (null == user) {
                            html = "<script type=\"text/javascript\">window.location.href=\"/login\"</script>";
                        } else {
                            request.getSession().setAttribute(Const.LOGIN_SESSION_KEY, user);
                            html = "<script type=\"text/javascript\">window.location.href=\"/\"</script>";
                        }
                        sresponse.getWriter().write(html);
                    }
                }
                if (flag) {
                    //跳转到登陆页面
                    String referer = this.getRef(request);
                    log.debug("security filter, deney, " + request.getRequestURI());
                    String html = "<script type=\"text/javascript\">window.location.href=\"/login\"</script>";
                    sresponse.getWriter().write(html);
                }
            } else {
                //跳转到登陆页面
                String referer = this.getRef(request);
                log.debug("security filter, deney, " + request.getRequestURI());
                String html = "<script type=\"text/javascript\">window.location.href=\"/login\"</script>";
                sresponse.getWriter().write(html);
            }
        } else {
            filterChain.doFilter(srequest, sresponse);
        }
    }


    /**
     * @param url
     * @return
     * @author neo
     * @date 2016-5-4
     */
    private boolean containsSuffix(String url) {
        if (url.endsWith(".js")
                || url.endsWith(".css")
                || url.endsWith(".jpg")
                || url.endsWith(".gif")
                || url.endsWith(".png")
                || url.endsWith(".html")
                || url.endsWith(".eot")
                || url.endsWith(".svg")
                || url.endsWith(".ttf")
                || url.endsWith(".woff")
                || url.endsWith(".ico")
                || url.endsWith(".woff2")) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void destroy() {
    }

    public String codeToString(String str) {
        String strString = str;
        try {
            byte tempB[] = strString.getBytes("ISO-8859-1");
            strString = new String(tempB);
            return strString;
        } catch (Exception e) {
            return strString;
        }
    }

    public String getRef(HttpServletRequest request) {
        String referer = "";
        String param = this.codeToString(request.getQueryString());
        if (StrUtil.isNotBlank(request.getContextPath())) {
            referer = referer + request.getContextPath();
        }
        if (StrUtil.isNotBlank(request.getServletPath())) {
            referer = referer + request.getServletPath();
        }
        if (StrUtil.isNotBlank(param)) {
            referer = referer + "?" + param;
        }
        request.getSession().setAttribute(Const.LAST_REFERER, referer);
        return referer;
    }

    public String getUserId(String value) {
        try {
            //String userId = Des3EncryptionUtil.decode(Const.DES3_KEY, value);
            return value;
        } catch (Exception e) {
            log.error("解析cookie异常：", e);
        }
        return null;
    }
}