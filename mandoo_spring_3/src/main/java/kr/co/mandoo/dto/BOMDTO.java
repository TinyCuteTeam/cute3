package kr.co.mandoo.dto;

public class BOMDTO {
	private String bom_Id;
	private String item_Code;
	private String item_Name; // 아이템 이름 추가
	private int bom_Count;
	private String bom_Unit;
	
	public String getBom_Id() {
		return bom_Id;
	}
	public void setBom_Id(String bom_Id) {
		this.bom_Id = bom_Id;
	}
	public String getItem_Code() {
		return item_Code;
	}
	public void setItem_Code(String item_Code) {
		this.item_Code = item_Code;
	}
	public String getItem_Name() {
		return item_Name;
	}
	public void setItem_Name(String item_Name) {
		this.item_Name = item_Name;
	}
	public int getBom_Count() {
		return bom_Count;
	}
	public void setBom_Count(int bom_Count) {
		this.bom_Count = bom_Count;
	}
	public String getBom_Unit() {
		return bom_Unit;
	}
	public void setBom_Unit(String bom_Unit) {
		this.bom_Unit = bom_Unit;
	}

	

}
