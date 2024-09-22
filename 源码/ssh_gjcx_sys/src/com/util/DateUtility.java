/*
 * @(#)DateUtility.java
 * $Date: 2006/07/31 03:01:49 $
 */
package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtility {

	
	public static final String DateFormat1 = "yyyy-MM-dd";
	public static final String DateFormat = "yyyy-MM-dd-HH-mm-ss";
	public static final String DateFormat2 = "yyMMdd/HHmmss";
	public static final String DateFormat3 = "yyMMddHHmmss";
	

	public static Date getDateFromStr(String datestr, String format) {
		SimpleDateFormat dateformat = new SimpleDateFormat(format);
		Date result = null;
		try {
			result = dateformat.parse(datestr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	

	public static String getFormatDate(Date indate, String format) {
		SimpleDateFormat dateformat = new SimpleDateFormat(format);
		
		return dateformat.format(indate);
	}

	public static Date getCurrentTime() {
		return new Date();
	}
	
   
    public static Date addYearS(
        final Date inDate,
        final int addYear) {

        return addDateS(inDate, addYear, Calendar.YEAR);
    }

   
    public static Date addMonthS(
        final Date inDate,
        final int addMonth) {
        return addDateS(inDate, addMonth, Calendar.MONTH);
    }

 
    public static Date addDayS(
        final Date inDate,
        final int addDay) {

        return addDateS(inDate, addDay, Calendar.DAY_OF_MONTH);
    }
    

    public static Date addHourS(
        final Date inDate,
        final int addDay) {

        return addDateS(inDate, addDay, Calendar.HOUR_OF_DAY);
    }

    
    private static Date addDateS(
        final Date inDate,
        final int addDate,
        final int field) {

        Calendar calendar = GregorianCalendar.getInstance();
        calendar.setTime(inDate);

        calendar.add(field, addDate);
        
        return calendar.getTime();
    }

  
    public static int calcDays(Date fromDate, Date toDate, boolean blnAbs) {

        long miliSeconds1 = fromDate.getTime();
        long miliSeconds2 = toDate.getTime();
        
        if (fromDate.compareTo(toDate) > 0 && blnAbs == false) {
        	
            return (int) ((miliSeconds2 - miliSeconds1) / 86400000);
        } 
        
       
        return (int) (Math.abs(miliSeconds2 - miliSeconds1 - 1) / 86400000) + 1;
    }
    
   
    public static int calcDays(Date fromDate, Date toDate) {
    	long miliSeconds1 = DateUtility.getFirstTimeOfDay(fromDate).getTime();
        long miliSeconds2 = DateUtility.getFirstTimeOfDay(toDate).getTime();
        
        return (int) ((miliSeconds2 - miliSeconds1) / 86400000);
        
    }
    
    
    public static int calcYears(Date fromDate, Date toDate) {
        Calendar calendar = GregorianCalendar.getInstance();
        calendar.setTime(fromDate);
        int years = 0;
        Date temp = null;
        if (fromDate.before(toDate)) {
        	temp = DateUtility.addYearS(fromDate, 1);
        	while (!temp.after(toDate)) {
        		temp = DateUtility.addYearS(temp, 1);
        		years ++;
        	}
        } else {
        	temp = DateUtility.addYearS(fromDate, -1);
        	while (!temp.before(toDate)) {
        		temp = DateUtility.addYearS(temp, -1);
        		years --;
        	}
        }
        
        return years;
        
    }    

   
    public static Date getFirstDayOfYear(Date date) {
    	Calendar calendar = Calendar.getInstance();
    	
    	calendar.setTime(date);
    	calendar.set(Calendar.MONTH, 0);
    	calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		
		return calendar.getTime();
    }
    
    
    public static Date getFirstDayOfMonth(Date date) {
    	Calendar calendar = Calendar.getInstance();
    	
    	calendar.setTime(date);
    	calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		
		return calendar.getTime();
    }
    
    
    public static Date getFirstTimeOfDay(Date date) {
    	Calendar calendar = Calendar.getInstance();
    	
    	calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		
		return calendar.getTime();
    }
    
    public static String getCurrentTimeStr(){
    	return getFormatDate(new Date(), DateFormat);
    }
    
   
    public static String getCurrentDate() {
    	return getFormatDate(new Date(),DateFormat);
    }
    
    public static String getCurrentDate(String format) {
    	return getFormatDate(new Date(),format);
    }
    
    public static String getCurrentTimeOnPlain() {
    	return getFormatDate(new Date(),DateFormat3);
    }
}
