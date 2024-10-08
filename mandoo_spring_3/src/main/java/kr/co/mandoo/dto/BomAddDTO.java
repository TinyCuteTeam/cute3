package kr.co.mandoo.dto;

public class BomAddDTO {
	private String bomId;
	private String itemCode;
	private int bomCount;
	private String bomUnit;

	// Getters and Setters
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
