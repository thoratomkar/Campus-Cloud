package com.kk.core.vo;

public class LabelValueVO {

	private String label;
	private Integer value;
	
	
	public LabelValueVO(){
		
	}
	public LabelValueVO(String label, Integer value) {
		super();
		this.label = label;
		this.value = value;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "LabelValueVO [label=" + label + ", value=" + value + "]\n";
	}
	
	
	
}
