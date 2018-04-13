package com.crud.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ExceptionTest {
    public static void main(String[] args) {
        test3();
    }

    static  void test0(){
        File  f  =  new File("d:/lol.exe");
        try {
            System.out.println("试图打开文件!");
            new FileInputStream(f);

            System.out.println("成功打开文件!");
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date  date = simpleDateFormat.parse("2107-06-03");
        }catch (FileNotFoundException e) {

            System.out.println("文件不存在!");
            e.printStackTrace();
        }catch (ParseException e1){

            System.out.println("日期格式解析错误!");
            e1.printStackTrace();
        }finally {
            System.out.println("文件是否存在,都会执行的代码!");
        }
    }

    static void  test1(){
        try {
            test2();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    static void  test2()throws  FileNotFoundException{
        File  f  =  new File("d:/lol.exe");

            System.out.println("试图打开文件!");
            new FileInputStream(f);
            System.out.println("成功打开文件!");

    }

    static   void  test3(){
        StringBuffer  stringBuffer = new StringBuffer();
        for (int i = 0; i < Integer.MAX_VALUE; i++) {
            stringBuffer.append('a');
        }
    }



}
