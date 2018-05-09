package com.crud.test;

public class RandomTest {
    public static void main(String[] args) {
        int num = 1+(int)(Math.random()*24);
        for (int i = 0; i <50 ; i++) {
            num = 1+(int)(Math.random()*24);
            System.out.println(num);
            String headUrl = "icon_"+num+"_png";
            System.out.println(headUrl);
        }
    }
}
