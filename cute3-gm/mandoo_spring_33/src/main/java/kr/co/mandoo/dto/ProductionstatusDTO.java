package kr.co.mandoo.dto;

import java.util.List;

public class ProductionstatusDTO {
	private String lineNo; // 라인 번호
	private int productionQty; // 작업해야 할 수량
	private int productionCompletedQty; // 완료된 수량
	private String workDo; // 작업 상태
	private String workName; // 작업 이름
	private String workId; // 작업 ID
	private List<WorkDTO> works; // 작업 목록

	// Getters and Setters for existing fields
	public String getLineNo() {
		return lineNo;
	}

	public void setLineNo(String lineNo) {
		this.lineNo = lineNo;
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

	public String getWorkDo() {
		return workDo;
	}

	public void setWorkDo(String workDo) {
		this.workDo = workDo;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public String getWorkId() {
		return workId;
	}

	public void setWorkId(String workId) {
		this.workId = workId;
	}

	// Getters and Setters for works
	public List<WorkDTO> getWorks() {
		return works;
	}

	public void setWorks(List<WorkDTO> works) {
		this.works = works;
	}
}
