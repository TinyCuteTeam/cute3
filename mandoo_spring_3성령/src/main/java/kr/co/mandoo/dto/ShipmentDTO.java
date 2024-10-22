package kr.co.mandoo.dto;

public class ShipmentDTO {
	private String shipment_Id;
	private String order_Id;
	private String client_Id;
	private String product_Name; // 상품명 필드 추가
	private String order_Enddate;
	private int order_Count;
	private int order_Price;
	public int getOrder_Price() {
		return order_Price;
	}
	public void setOrder_Price(int order_Price) {
		this.order_Price = order_Price;
	}
	public String getShipment_Id() {
		return shipment_Id;
	}
	public void setShipment_Id(String shipment_Id) {
		this.shipment_Id = shipment_Id;
	}
	public String getOrder_Id() {
		return order_Id;
	}
	public void setOrder_Id(String order_Id) {
		this.order_Id = order_Id;
	}
	public String getClient_Id() {
		return client_Id;
	}
	public void setClient_Id(String client_Id) {
		this.client_Id = client_Id;
	}
	public String getProduct_Name() {
		return product_Name;
	}
	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}
	public String getOrder_Enddate() {
		return order_Enddate;
	}
	public void setOrder_Enddate(String order_Enddate) {
		this.order_Enddate = order_Enddate;
	}
	public int getorder_Count() {
		return order_Count;
	}
	public void setorder_Count(int order_Count) {
		this.order_Count = order_Count;
	}
	@Override
	public String toString() {
		return "ShipmentDTO [shipment_Id=" + shipment_Id + ", order_Id=" + order_Id + ", client_Id=" + client_Id
				+ ", product_Name=" + product_Name + ", order_Enddate=" + order_Enddate + ", order_Count="
				+ order_Count + "]";
	}
	
	

}
