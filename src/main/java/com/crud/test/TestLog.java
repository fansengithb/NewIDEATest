package com.crud.test;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Level;
import org.apache.log4j.PropertyConfigurator;

public class TestLog {
    static org.apache.log4j.Logger  logger = org.apache.log4j.Logger.getLogger(TestLog.class);
    public static void main(String[] args) throws  InterruptedException {


        test2();
    }

    static   void  test1() throws  InterruptedException{
        BasicConfigurator.configure();
        logger.setLevel(Level.INFO);
        logger.trace("跟踪信息!");
        logger.debug("调试信息!");
        logger.info("输出信息!");
        Thread.sleep(1000);
        logger.warn("警告信息!");
        Thread.sleep(1000);

        logger.error("错误信息!");
        logger.fatal("致命信息!");
        logger.info("wwww");
    }

    static  void  test2(){
        PropertyConfigurator.configure("D:\\www\\log4j\\src\\log4j.properties");
        for (int i = 0; i < 5000; i++) {
            logger.trace("跟踪信息");
            logger.debug("调试信息");
            logger.info("输出信息");
            logger.warn("警告信息");
            logger.error("错误信息");
            logger.fatal("致命信息");
        }
    }
}
