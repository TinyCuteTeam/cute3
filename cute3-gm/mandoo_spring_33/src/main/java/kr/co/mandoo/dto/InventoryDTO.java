package kr.co.mandoo.dto;

public class InventoryDTO {

	private String inventoryId;
	private String itemCode;
	private String inventoryName;
	private String inventoryCount;
	private String inventoryDocount;
	private String inventoryLocation;
	private String inventorySort;

	public String getInventoryId() {
		return inventoryId;
	}

	public void setInventoryId(String inventoryId) {
		this.inventoryId = inventoryId;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getInventoryName() {
		return inventoryName;
	}

	public void setInventoryName(String inventoryName) {
		this.inventoryName = inventoryName;
	}

	public String getInventoryCount() {
		return inventoryCount;
	}

	public void setInventoryCount(String inventoryCount) {
		this.inventoryCount = inventoryCount;
	}

	public String getInventoryDocount() {
		return inventoryDocount;
	}

	public void setInventoryDocount(String inventoryDocount) {
		this.inventoryDocount = inventoryDocount;
	}

	public String getInventoryLocation() {
		return inventoryLocation;
	}

	public void setInventoryLocation(String inventoryLocation) {
		this.inventoryLocation = inventoryLocation;
	}

	public String getInventorySort() {
		return inventorySort;
	}

	public void setInventorySort(String inventorySort) {
		this.inventorySort = inventorySort;
	}

	public String toString() {
		return "InventoryDTO{" + "inventoryId='" + inventoryId + '\'' + ", itemCode='" + itemCode + '\''
				+ ", inventoryName='" + inventoryName + '\'' + ", inventoryCount='" + inventoryCount + '\''
				+ ", inventoryDocount='" + inventoryDocount + '\'' + ", inventoryLocation='" + inventoryLocation + '\''
				+ ", inventorySort='" + inventorySort + '\'' + '}';
	}

}
