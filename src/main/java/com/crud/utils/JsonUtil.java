package com.crud.utils;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;
import java.util.Map;

public class JsonUtil {

	private JsonUtil(){}

	public static <T> T parseObject(String json, Class<T> clazz){
		return JSON.parseObject(json, clazz);
	}

	public static String toJSONString(Object object){
		return JSON.toJSONString(object);
	}
	public static HashMap<String, Object> StringtoMap(String json)
	{
		 Map<String, Object> map = new HashMap<String, Object>();
	     ObjectMapper mapper = new ObjectMapper();
	     try{
	    	 map=mapper.readValue(json,new TypeReference<HashMap<String,Object>>() {});
	    	 return (HashMap<String, Object>) map;
	     }catch (Exception e) {
			// TODO: handle exception
	    	 e.printStackTrace();
	    	 return null;
		}
	}
	
	public static String MaptoString(@SuppressWarnings("rawtypes") Map map)
	{
		String json="";
		try {
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
}
