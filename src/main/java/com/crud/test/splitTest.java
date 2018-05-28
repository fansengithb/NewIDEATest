package com.crud.test;

public class splitTest {
    public static void main(String[] args) {

        test5();
    }
    /**
     * 字符串  split()  测试
     */
    public static void  test5(){
        String one = "sdf|dsfdf|www";
        String two[]= one.split("\\|");
        System.out.println(two);
        System.out.println("---------------------");
        for (String temp: two) {
            System.out.println(temp);
        }
    }

    public static void  test6(){
        String one = "sdf|dsfdf|www";
        String[] two={"","",""};
               two = one.split("\\|");
        System.out.println(two);

    }
    public static  void  test7(){
        String[] two={"","",""};
        System.out.println(two);
        test8(two);
    }

    public static  void  test8(String[] temp) {
        System.out.println(temp);
    }
    public static  void  test9() {
        String[] aim = "123-321".split("\\-");
        for (String temp: aim){
            System.out.println(temp);
        }

    }
}

