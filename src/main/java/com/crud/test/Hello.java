package com.crud.test;

import org.apache.commons.lang3.time.DateFormatUtils;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by fansen on 2018/1/23.
 */
public class Hello {
    public static void main(String[] args) throws Exception {

//        System.out.println("hell git from IDEA!");
//       test();
//       test3();
//        test4();
        test6();

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
        Date a = sdf.parse("2018-01-29 12:10:12");
        Date b = sdf.parse("2018-01-27 02:10:12");
//        Date d = sdf.parse("2018-01-25 22:10:12");



        Calendar c = Calendar.getInstance();
        c.set( Calendar.DATE, c.get( Calendar.DATE ) - 0 );
        Date today = c.getTime();
        SimpleDateFormat format = new SimpleDateFormat( "yyyy-MM-dd" );

        System.out.println(today);
        System.out.println(a);
        System.out.println(b);



        System.out.println( format.format( today ).equals( format.format( a ) ) );
        System.out.println( format.format( today ).equals( format.format( b ) ) );
//        System.out.println( format.format( today ).equals( format.format( d ) ) );

    }

    /**
     *  有 date 获取对应星期天数
     * @throws Exception
     */
    public static void test2()throws  Exception{
//        获得具体星期天数
        SimpleDateFormat aim = new SimpleDateFormat("EEEE");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Date a = sdf.parse("2018-01-28 12:10:12");

        String week = aim.format(a);
        System.out.println(week);
        System.out.println("--"+aim.format(new Date()));
    }

    public  static  void  test3() throws  Exception{
        // 利用Apache lang包快速获取凌晨0点0分0秒，23点59分59秒字符串
        System.out.println(DateFormatUtils.format(new Date(), "yyyy-MM-dd 00:00:00"));
        System.out.println(DateFormatUtils.format(new Date(), "yyyy-MM-dd 23:59:59"));


        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date a = sdf.parse(DateFormatUtils.format(new Date(), "yyyy-MM-dd 00:00:00"));
        System.out.println(a);


        Calendar c = Calendar.getInstance();
        c.set( Calendar.DATE, c.get( Calendar.DATE ) - 1 );
        Date day = c.getTime();
        System.out.println("   ----- "+DateFormatUtils.format(day, "yyyy-MM-dd 00:00:00"));

    }

    public static void test4()throws  Exception {
      String string[]={"","",""};
        System.out.println(string);
    }

    /**
     * 字符串  split()  测试
     */
    public static void  test5()throws  Exception{
        String one = "sdf|dsfdf|www";
        String two[]= one.split("\\|");
//        System.out.println(two);
        for (String temp: two
             ) {
            System.out.println(temp);
        }
    }
    /**
     *   list中通过迭代器移除元素
     */
    public  static  void  test6(){
        List<String> list=new ArrayList<String>();
        list.add("1");
        list.add("1");
        list.add("1");
        list.add("11");
        list.add("12");

        System.out.println(list);
        Iterator<String> iterator = list.iterator();
        while (iterator.hasNext()){
            String  temp = iterator.next();
            if (Integer.parseInt(temp)>10){
                iterator.remove();
            }
        }
        System.out.println(list);

    }
}
