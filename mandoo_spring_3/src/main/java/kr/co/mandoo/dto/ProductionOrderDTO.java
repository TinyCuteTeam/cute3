package kr.co.mandoo.dto;

import java.util.Date;

public class ProductionOrderDTO {
	private String orderId; // 작업지시서 번호
	private Date orderEndate; // 작업 종료일
	private String orderName; // 작업 내용
	private int productionQty; // 생산량
	private String orderMonth; // 월별 데이터 (월별 생산량을 위해 추가)

	// Getters and Setters

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Date getOrderEndate() {
		return orderEndate;
	}

	public void setOrderEndate(Date orderEndate) {
		this.orderEndate = orderEndate;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public int getProductionQty() {
		return productionQty;
	}

	public void setProductionQty(int productionQty) {
		this.productionQty = productionQty;
	}

	public String getOrderMonth() {
		return orderMonth;
	}

	public void setOrderMonth(String orderMonth) {
		this.orderMonth = orderMonth;
	}
}
