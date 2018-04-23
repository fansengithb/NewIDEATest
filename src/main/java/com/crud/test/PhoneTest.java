package com.crud.test;

import com.crud.utils.PhoneFormatCheckUtils;


/**
 *  手机号码测试
 */
public class PhoneTest {
    public static void main(String[] args) {
        String telephone = "17621829059";
        System.out.println(PhoneFormatCheckUtils.isPhoneLegal("1762182905"));
        System.out.println("eeeeeee");
//        if ( PhoneFormatCheckUtils.isPhoneLegal(telephone)){
//            telephone =  telephone.substring(0,7)+"****";
//        }
//        System.out.println(telephone);

//        System.out.println(PhoneFormatCheckUtils.changePhone(telephone));
    }
}
