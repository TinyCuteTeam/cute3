package kr.co.mandoo.dto;

public class ItemDTO {
	private String itemCode;
	private String itemName;

	public ItemDTO(String itemCode, String itemName) {
		this.itemCode = itemCode;
		this.itemName = itemName;
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
}
