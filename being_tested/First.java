package org.beeing_tested;

import java.io.*;
import java.lang.UnsupportedOperationException;
import java.util.Date;

public class First {

  public void say_hi () {
    System.out.println("Hello, World!");
  }

  public String name () {
    return "i'm First";
  }

  public void boom () {
    throw new UnsupportedOperationException("boom");
  }

  public int[] an_array () {
    int[] result = {0, 9, 8, 7, 6};
    return result;
  }

  public double a_float () {
    return 1.2345;
  }

  public Date a_date () {
    Date now = new Date();
    return now;
  }
}