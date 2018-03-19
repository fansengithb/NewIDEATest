package com.crud.test;

import org.apache.commons.lang3.time.DateFormatUtils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by fansen on 2018/1/23.
 */
public class HelloTest {
    public static void main(String[] args) throws  Exception{
        System.out.println("test!");
        test1();
//        System.out.println("  hello,git!");
    }


    public  static void  test()throws  Exception {
        //            今天时间最后一秒
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            数据库查询的结束时间
        Date end_time = sdf.parse(DateFormatUtils.format(new Date(), "yyyy-MM-dd 23:59:59"));
        Calendar c = Calendar.getInstance();
        c.set( Calendar.DATE, c.get( Calendar.DATE ) - 7);
        Date day = c.getTime();
        //  数据库查询的开始时间
        Date start_time = sdf.parse(DateFormatUtils.format(day, "yyyy-MM-dd 00:00:00"));

        System.out.println("-- "+start_time);
        System.out.println("-- "+end_time);

    }
    public  static void  test1()throws  Exception {
        Calendar calendar = Calendar.getInstance();

        calendar.setTime(new Date());
        System.out.println(      calendar.get(Calendar.DAY_OF_WEEK)-1);

    }


}
