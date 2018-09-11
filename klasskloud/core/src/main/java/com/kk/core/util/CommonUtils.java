package com.kk.core.util;

import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kk.core.vo.LabelValueVO;

public class CommonUtils {

	/**
	 * Return the list of months 
	 * @return
	 */
	static List<LabelValueVO> monthsList =null;
	public static Map<Integer,String> monthMap =null;
	static{
		
			 monthsList = new ArrayList<LabelValueVO>();
			 monthMap = new HashMap<Integer, String>();

			String[] months = new DateFormatSymbols().getMonths();

			int monthKey = 1;
			for (int i = 0; i < months.length - 1; i++) {
				monthsList.add(new LabelValueVO(months[i], monthKey));
				monthMap .put(monthKey, months[i]);
				monthKey++;

			}


	}
	public static List<LabelValueVO> getMonths() {
		return monthsList;

	}
	/**
	 * Return the list of the year
	 * @return
	 */
	public static List<LabelValueVO> getYears() {
		List<LabelValueVO> yearList = new ArrayList<LabelValueVO>();

		for (int i = 2010; i <= 2020; i++) {
			yearList.add(new LabelValueVO(String.valueOf(i), i));

		}

		return yearList;

	}

}
