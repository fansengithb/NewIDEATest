package com.crud.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by fansen on 2018/1/23.
 */
public class Hello {
    public static void main(String[] args) throws Exception {

//        System.out.println("hell git from IDEA!");
       test();
    }

    /**
     * 检测给定时间是否是昨天的
     */
    public static void test() throws  Exception{
        //        Date date=new Date();//取时间
//        Calendar calendar = new GregorianCalendar();
//        calendar.setTime(date);
//        calendar.add(calendar.DATE,-1);//把日期往前减少一天，若想把日期向后推一天则将负数改为正数
//        date=calendar.getTime();
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        String dateString = formatter.format(date);
//        System.out.println(dateString);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date a = sdf.parse("2018-01-26 12:10:12");
        Date b = sdf.parse("2018-01-25 02:10:12");
//        Date d = sdf.parse("2018-01-25 22:10:12");



        Calendar c = Calendar.getInstance();
        c.set( Calendar.DATE, c.get( Calendar.DATE ) - 1 );
        Date today = c.getTime();
        SimpleDateFormat format = new SimpleDateFormat( "yyyy-MM-dd" );
        System.out.println(today);
        System.out.println(a);
        System.out.println(b);



        System.out.println( format.format( today ).equals( format.format( a ) ) );
        System.out.println( format.format( today ).equals( format.format( b ) ) );
//        System.out.println( format.format( today ).equals( format.format( d ) ) );

    }

}
