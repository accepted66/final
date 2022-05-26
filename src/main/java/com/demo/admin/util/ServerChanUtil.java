package com.demo.admin.util;

import cn.hutool.http.HttpUtil;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;

/******************************************
 * @author: hb.mao
 * @createDate: 2020/1/13 11:00
 * @since: JDK 1.8
 * @Description: TODO
 ******************************************/
@Slf4j
public class ServerChanUtil {

    //参考，http://sc.ftqq.com/
    public static void send2wechat(String title, String body) {
        //发送到huibo.mao的微信号
        String url = "https://sc.ftqq.com/SCU43735T9894d813ece0b20f0ca7614a2fcbb30e5c515b47e2cb0.send";
        Map<String, Object> params = new HashMap<>();
        params.put("text", title);
        params.put("desp", body);
        HttpUtil.post(url, params);
    }

    public static void main(String[] args) {
        send2wechat("1233231", " - 456\r\n - 555");
    }

}
