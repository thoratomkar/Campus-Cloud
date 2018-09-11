package com.kk.core.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonUtils{
	
	public static void main(String[] args) {
		Gson gson = new GsonBuilder().create();
		List<List<String>> list = new ArrayList<List<String>>();
		List<String> l = new ArrayList<String>();
		l.add("test1");
		l.add("test2");
		list.add(l);
		list.add(l);
		Map<String, List<List<String>>> map = new HashMap<String, List<List<String>>>();
		map.put("data",list);
        System.out.println(gson.toJson(map));
	}
}