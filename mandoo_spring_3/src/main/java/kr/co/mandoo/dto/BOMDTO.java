package kr.co.mandoo.dto;

public class BOMDTO {
	private String bomId;
	private String itemCode;
	private String itemName; // 아이템 이름 추가
	private int bomCount;
	private String bomUnit;

	public String getBomId() {
		return bomId;
	}

	public void setBomId(String bomId) {
		this.bomId = bomId;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getBomCount() {
		return bomCount;
	}

	public void setBomCount(int bomCount) {
		this.bomCount = bomCount;
	}

	public String getBomUnit() {
		return bomUnit;
	}

	public void setBomUnit(String bomUnit) {
		this.bomUnit = bomUnit;
	}

}
