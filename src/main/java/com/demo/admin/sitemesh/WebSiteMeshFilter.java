package com.demo.admin.sitemesh;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.sitemesh.content.tagrules.html.DivExtractingTagRuleBundle;

/******************************************
 * @author: 毛晖波 (maohuibo@aidata360.cn)
 * @createDate: 2018/10/29 18:20
 * @company: (C) Copyright 智数信通 2018
 * @since: JDK 1.8
 * @Description: Tsitemash过滤器
 ******************************************/
public class WebSiteMeshFilter extends ConfigurableSiteMeshFilter {

    public static final String DECORATOR_URL = "/layout";
    public static final String DECORATOR_URL2 = "/layout_nojs";
    public static final String DECORATOR_URL3 = "/layout_vue";
    public static final String DECORATOR_URL4 = "/layout_body";
    public static final String DECORATOR_URL5 = "/mini_layout";

    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder.addDecoratorPath("/roll/edit", DECORATOR_URL2)
                .addDecoratorPath("/roll/save_or_update", DECORATOR_URL2)
                .addDecoratorPath("/ad/space/edit", DECORATOR_URL2)
                .addDecoratorPath("/ad/space/save_or_update", DECORATOR_URL2)
                .addDecoratorPath("/push/**", DECORATOR_URL3)
                .addDecoratorPath("/voice/**", DECORATOR_URL3)
                .addDecoratorPath("/tronscan/**", DECORATOR_URL4)
                .addDecoratorPath("/common/upload", DECORATOR_URL5)
                .addDecoratorPath("*/**", DECORATOR_URL)
                .addExcludedPath("/login")
                .addExcludedPath("/admin/login");


        builder.addTagRuleBundles(new DivExtractingTagRuleBundle());
        builder.addTagRuleBundle(new AidataTagRuleBundle());
    }

}

