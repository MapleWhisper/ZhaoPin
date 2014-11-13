package com.zhaopin.utils;

import java.io.IOException;
import java.util.Properties;

import org.springframework.stereotype.Component;

@Component()
public class SystemProperties {
	public static Properties properties = null;
	static{
		properties = new Properties();
		try {
			properties.load(SystemProperties.class.getClassLoader().getResourceAsStream("system.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("系统配置文件加载完成:");
		for(Object key :properties.keySet()){
			System.out.println(key.toString()+":"+properties.get(key).toString());
		}
	}
}
