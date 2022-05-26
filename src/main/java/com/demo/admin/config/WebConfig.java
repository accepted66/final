package com.demo.admin.config;

import com.demo.admin.filter.SecurityFilter;
import com.demo.admin.sitemesh.WebSiteMeshFilter;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/******************************************
 * @author: 毛晖波 (maohuibo@aidata360.cn)
 * @createDate: 2018/10/29 18:17
 * @company: (C) Copyright 智数信通 2018
 * @since: JDK 1.8
 * @Description: web配置，包括sitemash，sso过滤器等
 ******************************************/
@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Bean(value = "sitemesh3")
    public WebSiteMeshFilter webSiteMeshFilter() {
        return new WebSiteMeshFilter();
    }

    @Bean
    public FilterRegistrationBean filterRegistrationBean(@Qualifier("sitemesh3") WebSiteMeshFilter webSiteMeshFilter) {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(webSiteMeshFilter);
        filterRegistrationBean.setEnabled(true);
        filterRegistrationBean.addUrlPatterns("/*");
        return filterRegistrationBean;
    }

    @Bean
    public FilterRegistrationBean filterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(new SecurityFilter());
        registration.addUrlPatterns("/*");
        registration.setName("SecurityFilter");
        registration.setOrder(1);
        return registration;
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        //registry.addRedirectViewController("/cpadmin", "/");
    }

    @Bean
    public TaskScheduler taskScheduler() {
        ThreadPoolTaskScheduler taskScheduler = new ThreadPoolTaskScheduler();
        taskScheduler.setPoolSize(5);
        return taskScheduler;
    }

}
