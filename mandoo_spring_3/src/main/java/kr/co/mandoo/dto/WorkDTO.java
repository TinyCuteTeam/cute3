package kr.co.mandoo.dto;

import java.util.Date;

public class WorkDTO {
	private String workId;
	private String userId;
	private String itemCode;
	private Date workWrite;
	private Date workEndate;
	private String workName;
	private String workDo;
	private int productionQty;
	private int productionCompletedQty;
	private String lineNo;

	// Getters and Setters
	public String getWorkId() {
		return workId;
	}

	public void setWorkId(String workId) {
		this.workId = workId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public Date getWorkWrite() {
		return workWrite;
	}

	public void setWorkWrite(Date workWrite) {
		this.workWrite = workWrite;
	}

	public Date getWorkEndate() {
		return workEndate;
	}

	public void setWorkEndate(Date workEndate) {
		this.workEndate = workEndate;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public String getWorkDo() {
		return workDo;
	}

	public void setWorkDo(String workDo) {
		this.workDo = workDo;
	}

	public int getProductionQty() {
		return productionQty;
	}

	public void setProductionQty(int productionQty) {
		this.productionQty = productionQty;
	}

	public int getProductionCompletedQty() {
		return productionCompletedQty;
	}

	public void setProductionCompletedQty(int productionCompletedQty) {
		this.productionCompletedQty = productionCompletedQty;
	}

	public String getLineNo() {
		return lineNo;
	}

	public void setLineNo(String lineNo) {
		this.lineNo = lineNo;
	}
}
