package com.jxt.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;

/**
 * 日期格式化
 * 
 */
public class DateUtil {
	private static Logger logger = Logger.getLogger(DateUtil.class);

	public static final String DATE_FORMATTER = "yyyy-MM-dd HH:mm:ss";

	public static final String SDF_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss.SSS";
	public static final String YMD_DATE_FORMAT = "yyyy-MM-dd";

	public static java.util.Date parseDate(String dateStr, String format) {
		if (StringUtil.isEmpty(dateStr))
			return null;
		java.util.Date date = null;
		try {
			java.text.DateFormat df = new java.text.SimpleDateFormat(format);
			String dt = dateStr;
			if ((!dt.equals("")) && (dt.length() < format.length())) {
				dt += format.substring(dt.length()).replaceAll("[YyMmDdHhSs]",
						"0");
			}
			date = (java.util.Date) df.parse(dt);
		} catch (Exception e) {
			logger.error("parseDate data error!", e);
		}
		return date;
	}

	public static java.util.Date parseDate(String dateStr,
			SimpleDateFormat format) {
		if (StringUtil.isEmpty(dateStr))
			return null;
		java.util.Date date = null;
		try {
			date = format.parse(dateStr);
		} catch (Exception e) {
			logger.error("parseDate data error:" + dateStr + "!", e);
		}
		return date;
	}

	public static java.util.Date parseDate(String dateStr) {
		return parseDate(dateStr, DATE_FORMATTER);
	}

	public static String todayStr() {
		return formatDateToStr(new Date(), DATE_FORMATTER);
	}

	public static Date today() {
		return parseDate(todayStr(), DATE_FORMATTER);
	}

	/**
	 * @param date
	 *            需要格式化的日期對像
	 * @param formatter
	 *            格式化的字符串形式
	 * @return 按照formatter指定的格式的日期字符串
	 * @throws ParseException
	 *             無法解析的字符串格式時拋出
	 */
	public static String formatDateToStr(Date date, String formatter) {
		if (date == null)
			return "";
		try {
			return new java.text.SimpleDateFormat(formatter).format(date);
		} catch (Exception e) {
			logger.error("formatDateToStr error!", e);
		}
		return "";
	}

	/**
	 * 生成默认格式的日期
	 * 
	 * @param date
	 * @return
	 */
	public static String formatDateToStr(Date date) {
		return formatDateToStr(date, DATE_FORMATTER);
	}

	/**
	 * 將日期按照指定的模式格式化
	 * 
	 * @param date
	 *            {@link Date}
	 * @param format
	 *            如：yyyy/MM/dd
	 * @return 返回空表示格式化產生異常
	 */
	public static String format(java.util.Date date, String format) {
		String result = "";
		try {
			if (date != null) {
				java.text.DateFormat df = new java.text.SimpleDateFormat(format);
				result = df.format(date);
			}
		} catch (Exception e) {
			logger.error("format error!", e);
		}
		return result;
	}

	/**
	 * 将一种字符日期转化成另外一种日期格式
	 * 
	 * @param date
	 * @param fmtSrc
	 * @param fmtTag
	 * @return
	 */
	public static String format(String date, String fmtSrc, String fmtTag) {
		if (null == fmtSrc)
			return null;
		if (fmtSrc.equals(fmtTag)) {
			return date;
		}
		String year, month, daty;
		int Y, M, D;
		fmtSrc = fmtSrc.toUpperCase();
		Y = fmtSrc.indexOf("YYYY");
		M = fmtSrc.indexOf("MM");
		D = fmtSrc.indexOf("DD");
		if (Y < 0 || M < 0 || D < 0) {
			return date;
		}
		year = date.substring(Y, Y + 4);
		month = date.substring(M, M + 2);
		daty = date.substring(D, D + 2);
		fmtTag = fmtTag.toUpperCase();
		fmtTag = fmtTag.replaceAll("YYYY", year);
		fmtTag = fmtTag.replaceAll("MM", month);
		fmtTag = fmtTag.replaceAll("DD", daty);
		return fmtTag;
	}

	/**
	 * 計算指定年月的日期數
	 * 
	 * @param year
	 * @param month
	 * @return
	 */
	public static int maxDayOfMonth(int year, int month) {
		switch (month) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			return 31;
		case 4:
		case 6:
		case 9:
		case 11:
			return 30;
		case 2:
			boolean isRunYear = (year % 400 == 0)
					|| (year % 4 == 0 && year % 100 != 0);
			return isRunYear ? 29 : 28;
		default:
			return 31;
		}
	}

	/**
	 * 获取指定年月的日期數
	 * 
	 * @param year
	 * @param month
	 * @return
	 */
	public static int maxDayOfMonth(String year, String month) {
		return maxDayOfMonth(Integer.parseInt(year), Integer.parseInt(month));
	}

	/**
	 * 获取指定年月上月月末日期
	 * 
	 * @param year
	 * @param month
	 * @return
	 */
	public static String getLastMonthDate(String year, String month) {
		return getLastMonthDate(Integer.parseInt(year), Integer.parseInt(month));
	}

	/**
	 * 获取指定年月上月月末日期
	 * 
	 * @param year
	 * @param month
	 * @return
	 */
	public static String getLastMonthDate(int year, int month) {
		if (month <= 1) {
			year -= 1;
			month = 12;
		} else {
			month -= 1;
		}
		StringBuffer bfDate = new StringBuffer();
		bfDate.append(year);
		if (month < 10)
			bfDate.append("0");
		bfDate.append(month);
		bfDate.append(maxDayOfMonth(year, month));
		return bfDate.toString();
	}

	/**
	 * 提前N天的日期
	 * 
	 * @param date
	 * @param days
	 * @return
	 */
	public static Date beforeDate(Date date, int days) {
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		c.add(java.util.Calendar.DAY_OF_YEAR, -days);
		return c.getTime();

	}

	/**
	 * 一周前的日期
	 * 
	 * @return
	 */
	public static Date getLastWeek() {
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.add(java.util.Calendar.DAY_OF_YEAR, -7);
		return c.getTime();

	}

	public static int curHour(Calendar cal) {
		return cal.get(Calendar.HOUR_OF_DAY);
	}

	public static int curMinute(Calendar cal) {
		return cal.get(Calendar.MINUTE);
	}

	public static int curSecond(Calendar cal) {
		return cal.get(Calendar.SECOND);
	}

	public static String curTimeStr() {
		Calendar cal = Calendar.getInstance();
		// 分别取得当前日期的年、月、日
		StringBuffer bf = new StringBuffer(10);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		if (hour < 10)
			bf.append("0");
		bf.append(hour);
		bf.append(":");
		int minite = cal.get(Calendar.MINUTE);
		if (minite < 10)
			bf.append("0");
		bf.append(minite);
		bf.append(":");
		int second = cal.get(Calendar.SECOND);
		if (second < 10)
			bf.append("0");
		bf.append(second);
		return bf.toString();
	}

	/***************************************************************************
	 * @功能 计算当前日期某年的第几周
	 * @return interger
	 * @throws ParseException
	 **************************************************************************/
	public static int getWeekNumOfYear() {
		Calendar calendar = Calendar.getInstance();
		int iWeekNum = calendar.get(Calendar.WEEK_OF_YEAR);
		return iWeekNum;
	}

	/***************************************************************************
	 * @功能 计算指定日期某年的第几周
	 * @return interger
	 * @throws ParseException
	 **************************************************************************/
	public static int getWeekNumOfYearDay(String strDate) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(parseDate(strDate));
		int iWeekNum = calendar.get(Calendar.WEEK_OF_YEAR);
		return iWeekNum;
	}

	/***************************************************************************
	 * @功能 计算某年某周的开始日期
	 * @return interger
	 * @throws ParseException
	 **************************************************************************/
	public static String getWeekFirstDay(int yearNum, int weekNum) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, yearNum);
		cal.set(Calendar.WEEK_OF_YEAR, weekNum);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		// 分别取得当前日期的年、月、日
		String tempYear = Integer.toString(yearNum);
		String tempMonth = Integer.toString(cal.get(Calendar.MONTH) + 1);
		String tempDay = Integer.toString(cal.get(Calendar.DATE));
		return tempYear + "-" + tempMonth + "-" + tempDay;
	}

	public static String getWeekFirstDay(int weekNum) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.WEEK_OF_YEAR, weekNum);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		// 分别取得当前日期的年、月、日
		String tempMonth = Integer.toString(cal.get(Calendar.MONTH) + 1);
		String tempDay = Integer.toString(cal.get(Calendar.DATE));
		return cal.get(Calendar.YEAR) + "-" + tempMonth + "-" + tempDay;
	}

	/***************************************************************************
	 * @功能 计算某年某周的结束日期
	 * @return interger
	 * @throws ParseException
	 **************************************************************************/
	public static String getWeekEndDay(int yearNum, int weekNum) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, yearNum);
		cal.set(Calendar.WEEK_OF_YEAR, weekNum + 1);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		// 分别取得当前日期的年、月、日
		String tempMonth = Integer.toString(cal.get(Calendar.MONTH) + 1);
		String tempDay = Integer.toString(cal.get(Calendar.DATE));
		return cal.get(Calendar.YEAR) + "-" + tempMonth + "-" + tempDay;
	}

	public static String getWeekEndDay(int weekNum) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.WEEK_OF_YEAR, weekNum + 1);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		// 分别取得当前日期的年、月、日
		String tempMonth = Integer.toString(cal.get(Calendar.MONTH) + 1);
		String tempDay = Integer.toString(cal.get(Calendar.DATE));
		return cal.get(Calendar.YEAR) + "-" + tempMonth + "-" + tempDay;
	}

	public static String getDatePreHours(int preHours) {
		// 当前日期
		Date date = new Date();
		// 格式化对象
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMATTER
				+ " HH:mm:ss");
		// 日历对象
		Calendar calendar = Calendar.getInstance();
		// 设置当前日期
		calendar.setTime(date);
		// 小时增减
		calendar.add(Calendar.HOUR_OF_DAY, preHours);

		return sdf.format(calendar.getTime());
	}

	public static String getDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());
	}

	public static String getTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		return sdf.format(new Date());
	}

	public static String logTime() {
		return new SimpleDateFormat(SDF_DATE_FORMAT).format(new Date());
	}
}
