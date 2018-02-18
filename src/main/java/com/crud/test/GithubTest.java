package com.crud.test;

import org.apache.commons.lang3.time.DateFormatUtils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by fansen on 2018/1/23.
 */
public class GithubTest  {
    public static void main(String[] args) throws  Exception {
//        System.out.println("---------wwwweee----------");

//        test();
         test1();
    }



    public  static  void  test9() {
        System.out.println("$$$$$");
        System.out.println(new Date().getTime());
        System.out.println(new Date().getTime() % 100000000);
        System.out.println((int) new Date().getTime() % 100000000);
    }


    /**
     *    获取本周周一  00:00:00
     */

    public static void test()throws  Exception{
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        int day1 = calendar.get(Calendar.DAY_OF_WEEK)-1;
        System.out.println("today:"+day1);



        Calendar c = Calendar.getInstance();
        c.set( Calendar.DATE, c.get( Calendar.DATE ) -(calendar.get(Calendar.DAY_OF_WEEK)-1-1 ));
        Date day = c.getTime();
        //  数据库查询的开始时间
        Date start_time = sdf.parse(DateFormatUtils.format(day, "yyyy-MM-dd 00:00:00"));
        System.out.println("monday---"+start_time);


        c.set( Calendar.DATE, c.get( Calendar.DATE ) -5);
        day = c.getTime();
//        过去6天
        System.out.println("last--day:"+sdf.parse(DateFormatUtils.format(day, "yyyy-MM-dd 00:00:00")));


    }

    /**
     *    github更改用户名！
     */
    public static void  test1(){
        System.out.println("make the change!");
    }
}


