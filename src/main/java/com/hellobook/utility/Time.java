package com.hellobook.utility;

import java.util.Date;

public class Time {
	
	private static class TIME_MAXIMUM {
		public static final int SEC = 60;
		public static final int MIN = 60;
		public static final int HOUR = 24;
		public static final int DAY = 30;
		public static final int MONTH = 12;
	}
	
	public static String calculateTime(Date date) {
		long curTime = System.currentTimeMillis();
		long regTime = date.getTime();
		long diffTime = (curTime - regTime) / 1000;
		String msg = null;
		if (diffTime < TIME_MAXIMUM.SEC) {
			// sec
			msg = diffTime + "s"; // 초 전
		} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
			// min
			msg = diffTime + "m"; // 분 전
		} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
			// hour
			msg = (diffTime) + "h"; // 시간 전
		} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
			// day
			msg = (diffTime) + "d"; // 일 전
		} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
			// day
			msg = (diffTime) + "M"; // 달 전
		} else {
			msg = (diffTime) + "y"; // 년 전
		}
		return msg;
	}
	
	public static String calculateTime(Date date, String locale) {
		long curTime = System.currentTimeMillis();
		long regTime = date.getTime();
		long diffTime = (curTime - regTime) / 1000;
		String msg = null;
		if(locale.equals("en")) {
			if (diffTime < TIME_MAXIMUM.SEC) {
				// sec
				msg = diffTime + "s"; // 초 전
			} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
				// min
				msg = diffTime + "m"; // 분 전
			} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
				// hour
				msg = (diffTime) + "h"; // 시간 전
			} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
				// day
				msg = (diffTime) + "d"; // 일 전
			} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
				// day
				msg = (diffTime) + "M"; // 달 전
			} else {
				msg = (diffTime) + "y"; // 년 전
			}
		}else if(locale.equals("ko")){
			if (diffTime < TIME_MAXIMUM.SEC) {
				// sec
				msg = diffTime + "초 전"; // 초 전
			} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
				// min
				msg = diffTime + "분 전"; // 분 전
			} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
				// hour
				msg = (diffTime) + "시간 전"; // 시간 전
			} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
				// day
				msg = (diffTime) + "일 전"; // 일 전
			} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
				// day
				msg = (diffTime) + "달 전"; // 달 전
			} else {
				msg = (diffTime) + "년 전"; // 년 전
			}
		}else {
			if (diffTime < TIME_MAXIMUM.SEC) {
				// sec
				msg = diffTime + "秒前"; // 초 전
			} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
				// min
				msg = diffTime + "分前"; // 분 전
			} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
				// hour
				msg = (diffTime) + "時間前"; // 시간 전
			} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
				// day
				msg = (diffTime) + "日前"; // 일 전
			} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
				// day
				msg = (diffTime) + "月前"; // 달 전
			} else {
				msg = (diffTime) + "年前"; // 년 전
			}
		}
		return msg;
	}
	
	
}