package com.example.demo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;// ��ʽ��
import java.util.Date;//������

//���ڶ������ַ������໥ת��
//��ʽһ
public class DateUtil {
	// Date����ת�ַ��� ��yyyy-MM-dd hh:mm:ss��
	public static String dateString1(Date date) {
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		String str = null;
		if (date != null) {
			str = s.format(date);

		}
		return str;
	}
//��ʽ��
	public static String dateString2(Date date) {
		SimpleDateFormat s = new SimpleDateFormat("yyyy/MM/dd");
		String str = null;
		if (date != null) {
			str = s.format(date);

		}
		return str;
	}
	//
	public static String dateString3(Date date) {
		SimpleDateFormat s = new SimpleDateFormat("w");
		String str = null;
		if (date != null) {
			str = s.format(date);

		}
		return str;
	}
	//�ַ���תDate����
	//ץȡ�쳣����ֹģʽ��ƥ��
	
	public static Date stringToDate(String str) {
		Date date =null;
		SimpleDateFormat s = new SimpleDateFormat("yyyy/MM/dd");
		try{
		date = s.parse(str);}
		catch(ParseException e){
			e.printStackTrace();
		}
		return date;
		
	}
	
}
