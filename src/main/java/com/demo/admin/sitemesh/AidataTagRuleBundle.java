package com.demo.admin.sitemesh;

import org.sitemesh.SiteMeshContext;
import org.sitemesh.content.ContentProperty;
import org.sitemesh.content.tagrules.TagRuleBundle;
import org.sitemesh.content.tagrules.html.ExportTagToContentRule;
import org.sitemesh.tagprocessor.State;

/******************************************
 * @author: 毛晖波 (maohuibo@aidata360.cn)
 * @createDate: 2018/10/30 18:29
 * @company: (C) Copyright 智数信通 2018
 * @since: JDK 1.8
 * @Description: sitemesh自定义脚本tag
 ******************************************/
public class AidataTagRuleBundle implements TagRuleBundle {

    @Override
    public void install(State defaultState, ContentProperty contentProperty, SiteMeshContext siteMeshContext) {
        defaultState.addRule("aidata-css", new ExportTagToContentRule(siteMeshContext, contentProperty.getChild("aidata-css"), false));
        defaultState.addRule("aidata-script", new ExportTagToContentRule(siteMeshContext, contentProperty.getChild("aidata-script"), false));
    }

    @Override
    public void cleanUp(State defaultState, ContentProperty contentProperty, SiteMeshContext siteMeshContext) {
    }

}
