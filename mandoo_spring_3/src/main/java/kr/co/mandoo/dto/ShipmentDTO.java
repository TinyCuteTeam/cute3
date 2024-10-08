package kr.co.mandoo.dto;

public class ShipmentDTO {
	private String shipmentId;
	private String orderId;
	private String clientId;
	private String productName; // 상품명 필드 추가
	private String shipmentDate;
	private int shipmentQuantity;

	// Getters and Setters
	public String getShipmentId() {
		return shipmentId;
	}

	public void setShipmentId(String shipmentId) {
		this.shipmentId = shipmentId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getProductName() { // 상품명 Getter
		return productName;
	}

	public void setProductName(String productName) { // 상품명 Setter
		this.productName = productName;
	}

	public String getShipmentDate() {
		return shipmentDate;
	}

	public void setShipmentDate(String shipmentDate) {
		this.shipmentDate = shipmentDate;
	}

	public int getShipmentQuantity() {
		return shipmentQuantity;
	}

	public void setShipmentQuantity(int shipmentQuantity) {
		this.shipmentQuantity = shipmentQuantity;
	}
}
