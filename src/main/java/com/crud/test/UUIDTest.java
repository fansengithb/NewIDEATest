package com.crud.test;

import java.util.UUID;

public class UUIDTest {
    public static void main(String[] args) {
        for(int i=0;i<10;i++){
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            System.out.println(uuid);
        }
    }
}
