package com.zhaopin.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class ZhaoPinUtils {
	
	/**
	 * 伪Md5 加密,不能逆转
	 * 连长度都不是32位,呵呵呵呵
	 * @param key
	 * @return
	 */
	public static String MD5String(String key){
		StringBuffer md5 = new StringBuffer();
		byte[] results = null;
		MessageDigest digest = null;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.reset();
			digest.update(key.getBytes());
			results = digest.digest();
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		for (int i = 0; i < results.length; i++) {
			 int val = ((int) results[i]) & 1234;	//不可逆转
			 if(val<16){
				 md5.append("1");		//
			 }
			 md5.append(Integer.toHexString(val));
		}
		
		return md5.toString();
	}
	
	/**
	 * 真Md5 加密
	 * @param key
	 * @return
	 */
	public static String MD5StringReal(String key){
		StringBuffer md5 = new StringBuffer();
		byte[] results = null;
		MessageDigest digest = null;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.reset();
			digest.update(key.getBytes());
			results = digest.digest();
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
			 
		
		for (int i = 0; i < results.length; i++) {
			 int val = ((int) results[i]) & 0xff;
			 if(val<16){
				 md5.append("0");
			 }
			 md5.append(Integer.toHexString(val));
		}
		
		return md5.toString();
	}
	public static String[] spiltString(String str){
		String s[] = new String[5];
		s = str.split("&");
		for(String s1:s){
			if(s1==null){
				s1=" ";
			}
		}
		return s;
	}
}
