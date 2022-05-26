package com.demo.admin.util;

import java.math.BigDecimal;

/******************************************
 * @author: 大鹏 (dapeng@51huxin.com)
 * @createDate: 2016/8/24
 * @company: (C) Copyright 阳光互信 2016
 * @since: JDK 1.8
 * @Description:数学计算类（精度）
 ******************************************/
public class MathUtil {

    /**
     * 减法
     *
     * @param v1 被减数
     * @param v2 减数
     * @return 结果
     */
    public static double sub(double v1, double v2) {
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.subtract(b2).doubleValue();
    }

    /**
     * @param v1 乘数
     * @param v2 被乘数
     * @return 2个参数的积
     */
    public static double mul(double v1, double v2) {
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.multiply(b2).doubleValue();
    }

    /**
     * 求两个数的商，保留0位小数
     *
     * @param v1
     * @param v2
     * @return
     */
    public static double div(double v1, double v2) {
        return div(v1, v2, 0);
    }

    /**
     * @param v1    被除数
     * @param v2    除数
     * @param scale 表示需要精确到小数点以后几位。
     * @return 2个参数的商
     */
    public static double div(double v1, double v2, int scale) {
        if (scale < 0) {
            throw new IllegalArgumentException("The scale must be a positive integer or zero");
        }
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 求和
     *
     * @param v
     * @return
     */
    public static double add(double... v) {
        BigDecimal decimal = new BigDecimal(0);
        for (double d : v) {
            BigDecimal decimal1 = new BigDecimal(d);
            decimal = decimal.add(decimal1);
        }
        return decimal.doubleValue();
    }

    /**
     * @param v     需要四舍五入的数字
     * @param scale 小数点后保留几位
     * @return 四舍五入后的结果
     */
    public static Double round(double v, int scale) {
        if (scale < 0) {
            throw new IllegalArgumentException("The scale must be a positive integer or zero");
        }
        BigDecimal b = new BigDecimal(Double.toString(v));
        BigDecimal one = new BigDecimal("1");
        return b.divide(one, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * @param v     不需要四舍五入的数字
     * @param scale 小数点后保留几位
     * @return 直接舍弃小数点后两位之后的结果
     */
    public static Double roundNoUp(double v, int scale) {
        if (scale < 0) {
            throw new IllegalArgumentException("The scale must be a positive integer or zero");
        }
        BigDecimal b = new BigDecimal(Double.toString(v));
        BigDecimal one = new BigDecimal("1");
        return b.divide(one, scale, BigDecimal.ROUND_FLOOR).doubleValue();
    }

    /**
     * 计算利息
     *
     * @param money
     * @return
     */
    public static Double calcInterest(double money) {
        BigDecimal b1 = new BigDecimal(Math.ceil(money));
        BigDecimal one = new BigDecimal(1);
        return b1.divide(one, 0, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 获取较小的值
     * @param first
     * @param second
     * @return　first大于等于second 返回 true;否则返回false.
     */
    public static int min(int first, int second) {
        if (first >= second) {
            return second;
        } else {
            return first;
        }
    }
}
