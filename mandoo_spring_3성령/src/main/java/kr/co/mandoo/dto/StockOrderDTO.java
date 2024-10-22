package kr.co.mandoo.dto;

import java.sql.Date;

public class StockOrderDTO {
	
	private int order_num;
	private String order_supply;
	private Date order_time;
	private int order_count;
	private String order_name;
	
	// 증감률 추가
    private double growthRate;
	
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getOrder_supply() {
		return order_supply;
	}
	public void setOrder_supply(String order_supply) {
		this.order_supply = order_supply;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	
	public double getGrowthRate() {
		return growthRate;
	}
	public void setGrowthRate(double growthRate) {
		this.growthRate = growthRate;
	}
	
	@Override
    public String toString() {
        return "StockOrderDTO [order_num=" + order_num + ", order_supply=" + order_supply + ", order_time=" + order_time
                + ", order_count=" + order_count + ", order_name=" + order_name + "]";
    }

}
