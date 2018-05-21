package com.crud.utils;

public class IllegalCharacterUtils {


    public static void main(String[] args) {

    }

    //	对数据库中的数字进行非法检测.
    /**
     *   数据库中插入数据时,对非法字符过滤
     * @param str
     * @return
     */
    public static String removeNonBmpUnicode(String str) {
        if (str == null) {
            return null;
        }
        str = str.replaceAll("[^\\u0000-\\uFFFF]", "");
        return str;
    }
}
