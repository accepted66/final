package com.demo.admin.core.exception;

import cn.hutool.core.io.IoUtil;
import freemarker.core.Environment;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.io.Writer;

@Slf4j
public class FreemarkerExceptionHandler implements TemplateExceptionHandler {

    @Override
    public void handleTemplateException(TemplateException te, Environment env, Writer out) throws TemplateException {

        log.error("[Freemarker Error: " + te.getMessage() + "]");
        try {
            String[] tmp = te.getMessageWithoutStackTop().split("\n");

            log.error("FreemarkerError", te);
            String html = "<script type=\"text/javascript\">window.location.href=\"/error_message?errorMessage=FreemarkerError\"</script>";
            out.write(html);
        } catch (IOException e) {
            throw new TemplateException("Failed to print error message. Cause: " + e, env);
        } finally {
            IoUtil.close(out);
        }
    }
}
