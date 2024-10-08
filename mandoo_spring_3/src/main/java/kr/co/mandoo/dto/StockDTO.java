package kr.co.mandoo.dto;


public class StockDTO {
	private String stock_Id;
	private String item_Code;
	private String stock_Name;
	private int stock_Count;
	private String stock_Location;
	private String stock_Sort;
	
	public String getStock_Id() {
		return stock_Id;
	}
	public void setStock_Id(String stock_Id) {
		this.stock_Id = stock_Id;
	}
	public String getItem_Code() {
		return item_Code;
	}
	public void setItem_Code(String item_Code) {
		this.item_Code = item_Code;
	}
	public String getStock_Name() {
		return stock_Name;
	}
	public void setStock_Name(String stock_Name) {
		this.stock_Name = stock_Name;
	}
	public int getStock_Count() {
		return stock_Count;
	}
	public void setStock_Count(int stock_Count) {
		this.stock_Count = stock_Count;
	}
	public String getStock_Location() {
		return stock_Location;
	}
	public void setStock_Location(String stock_Location) {
		this.stock_Location = stock_Location;
	}
	public String getStock_Sort() {
		return stock_Sort;
	}
	public void setStock_Sort(String stock_Sort) {
		this.stock_Sort = stock_Sort;
	}
	
	@Override
	public String toString() {
		return "StockDTO [stock_Id=" + stock_Id + ", item_Code=" + item_Code + ", stock_Name=" + stock_Name
				+ ", stock_Count=" + stock_Count + ", stock_Location=" + stock_Location + ", stock_Sort=" + stock_Sort
				+ "]";
	}

	
	
}
