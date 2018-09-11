package com.kk.core.vo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.kk.core.kkenum.OrderEnum;

public class QueryFilterVO {

	@SuppressWarnings("serial")
	private Map<String, String> whereClause = new HashMap<String, String>() {
		{
			put("isDeleted", "false");
		}
	};
	private List<String> orderByList;
	private String orderByClause = "createdAt";
	private String order = OrderEnum.DESC.toString();

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getOrderByClause() {
		return orderByClause;
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	public Map<String, String> getWhereClause() {
		return whereClause;
	}

	public void setWhereClause(Map<String, String> whereClause) {
		this.whereClause = whereClause;
	}

	public List<String> getOrderByList() {
		return orderByList;
	}

	public void setOrderByList(List<String> orderByList) {
		this.orderByList = orderByList;
	}

	@SuppressWarnings("unused")
	public void clear() {
		whereClause.clear();
		orderByClause = StringUtils.EMPTY;
		order = StringUtils.EMPTY;

	}
}