package com.kk.core.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.kk.core.vo.AcadVO;

public class DateUtils{
	
	private static SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	
	public static Boolean isValidDateRange(Integer startMonth, Integer startYear,
			Integer endMonth, Integer endYear){
		
		Calendar c1 = Calendar.getInstance();
		c1.set(startYear, startMonth, Calendar.DAY_OF_MONTH);
		
		Calendar c2 = Calendar.getInstance();
		c2.set(endYear, endMonth, Calendar.DAY_OF_MONTH);
		
		return c1.before(c2);
	}
	
	public static Boolean isValidDateRange(AcadVO vo){
		
		Calendar c1 = Calendar.getInstance();
		c1.set(vo.getStartYear(), vo.getStartMonth(), Calendar.DAY_OF_MONTH);
		
		Calendar c2 = Calendar.getInstance();
		c2.set(vo.getEndYear(), vo.getEndMonth(), Calendar.DAY_OF_MONTH);
		
		return c1.before(c2);
	}
	
	public static Date getDBDate(String dataString) throws ParseException{
		return df.parse(dataString);
	}
	
}