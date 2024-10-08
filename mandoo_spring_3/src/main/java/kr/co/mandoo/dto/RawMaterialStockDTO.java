package kr.co.mandoo.dto;

public class RawMaterialStockDTO {
	private String stockId;
	private String itemCode;
	private String stockName;
	private int stockCount;
	private String stockLocation;
	private String stockSort;

	// Getters and Setters
	public String getStockId() {
		return stockId;
	}

	public void setStockId(String stockId) {
		this.stockId = stockId;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getStockName() {
		return stockName;
	}

	public void setStockName(String stockName) {
		this.stockName = stockName;
	}

	public int getStockCount() {
		return stockCount;
	}

	public void setStockCount(int stockCount) {
		this.stockCount = stockCount;
	}

	public String getStockLocation() {
		return stockLocation;
	}

	public void setStockLocation(String stockLocation) {
		this.stockLocation = stockLocation;
	}

	public String getStockSort() {
		return stockSort;
	}

	public void setStockSort(String stockSort) {
		this.stockSort = stockSort;
	}
}
