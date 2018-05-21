package com.crud.test;

import java.util.Timer;
import java.util.TimerTask;

public class TimerTashTest {
//    定时任务测试类

  TimerTask task = new TimerTask() {
      @Override
      public void run() {
          System.out.println("hello  timerTest !!!");
      }
  };
  Timer timer = new Timer();
  long delay = 0;
  long  intevalPeriod = 1*1000;
}

