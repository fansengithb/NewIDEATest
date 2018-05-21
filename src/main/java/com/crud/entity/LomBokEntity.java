package com.crud.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter   //添加注解可以自动获取  get  set tostring 方法
@Getter
@ToString
public class LomBokEntity {
        private  String name;
        private  String password;

    public static void main(String[] args) {
        LomBokEntity lomBokEntity = new LomBokEntity();
        lomBokEntity.setName("www");
        lomBokEntity.setPassword("123456");
        System.out.println("lombok插件的测试使用:");
        System.out.println(lomBokEntity);
    }
}

