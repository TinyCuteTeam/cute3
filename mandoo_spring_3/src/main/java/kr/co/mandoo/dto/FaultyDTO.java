package kr.co.mandoo.dto;

import java.sql.Date;

public class FaultyDTO {
    private String faulty_id;      // 날짜 또는 식별자
    private String item_code;      // 품목 코드
    private String error_id;       // 에러 코드
    private String work_id;        // 작업 지시 번호
    private String faulty_count;   // 불량 수량
    private Date month;
    private int defect_rate;
    
    
    public Date getMonth() {
		return month;
	}
	public void setMonth(Date month) {
		this.month = month;
	}
	public int getDefect_rate() {
		return defect_rate;
	}
	public void setDefect_rate(int defect_rate) {
		this.defect_rate = defect_rate;
	}
	
    
    
	public String getFaulty_id() {
		return faulty_id;
	}
	public void setFaulty_id(String faulty_id) {
		this.faulty_id = faulty_id;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getError_id() {
		return error_id;
	}
	public void setError_id(String error_id) {
		this.error_id = error_id;
	}
	public String getWork_id() {
		return work_id;
	}
	public void setWork_id(String work_id) {
		this.work_id = work_id;
	}
	public String getFaulty_count() {
		return faulty_count;
	}
	public void setFaulty_count(String faulty_count) {
		this.faulty_count = faulty_count;
	}
    
  
}
