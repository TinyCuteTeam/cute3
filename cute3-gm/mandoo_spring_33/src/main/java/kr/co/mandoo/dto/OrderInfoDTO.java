package kr.co.mandoo.dto;

public class OrderInfoDTO {

	private String order_Id;
	private String client_Id;
	private String order_Date;
	private String order_EndDate;
	private String order_Box;
	private int order_Count;
	private String order_Price;
	private String product_Name; // 추가된 부분
	
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
	public String getOrder_Date() {
		return order_Date;
	}
	public void setOrder_Date(String order_Date) {
		this.order_Date = order_Date;
	}
	public String getOrder_EndDate() {
		return order_EndDate;
	}
	public void setOrder_EndDate(String order_EndDate) {
		this.order_EndDate = order_EndDate;
	}
	public String getOrder_Box() {
		return order_Box;
	}
	public void setOrder_Box(String order_Box) {
		this.order_Box = order_Box;
	}
	public int getOrder_Count() {
		return order_Count;
	}
	public void setOrder_Count(int order_Count) {
		this.order_Count = order_Count;
	}
	public String getOrder_Price() {
		return order_Price;
	}
	public void setOrder_Price(String order_Price) {
		this.order_Price = order_Price;
	}
	public String getProduct_Name() {
		return product_Name;
	}
	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}
	
	@Override
	public String toString() {
		return "OrderInfoDTO [order_Id=" + order_Id + ", client_Id=" + client_Id + ", order_Date=" + order_Date
				+ ", order_EndDate=" + order_EndDate + ", order_Box=" + order_Box + ", order_Count=" + order_Count
				+ ", order_Price=" + order_Price + ", product_Name=" + product_Name + "]";
	}

}
