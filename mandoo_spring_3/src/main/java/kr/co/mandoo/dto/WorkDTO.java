package kr.co.mandoo.dto;

import java.sql.Date;

public class WorkDTO {
	private String work_id;
	private String user_id;
	private String item_code;
	private Date work_write;
	private Date work_endate;
	private String work_name;
	private String work_do;
	private int production_qty;
	private int production_completed_qty;
	private String line_no;

	public String getWork_id() {
		return work_id;
	}

	public void setWork_id(String work_id) {
		this.work_id = work_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public Date getWork_write() {
		return work_write;
	}

	public void setWork_write(Date work_write) {
		this.work_write = work_write;
	}

	public Date getWork_endate() {
		return work_endate;
	}

	public void setWork_endate(Date work_endate) {
		this.work_endate = work_endate;
	}

	public String getWork_name() {
		return work_name;
	}

	public void setWork_name(String work_name) {
		this.work_name = work_name;
	}

	public String getWork_do() {
		return work_do;
	}

	public void setWork_do(String work_do) {
		this.work_do = work_do;
	}

	public int getProduction_qty() {
		return production_qty;
	}

	public void setProduction_qty(int production_qty) {
		this.production_qty = production_qty;
	}

	public int getProduction_completed_qty() {
		return production_completed_qty;
	}

	public void setProduction_completed_qty(int production_completed_qty) {
		this.production_completed_qty = production_completed_qty;
	}

	public String getLine_no() {
		return line_no;
	}

	public void setLine_no(String line_no) {
		this.line_no = line_no;
	}

	@Override
	public String toString() {
		return "WorkDTO [work_id=" + work_id + ", user_id=" + user_id + ", item_code=" + item_code + ", work_write="
				+ work_write + ", work_endate=" + work_endate + ", work_name=" + work_name + ", work_do=" + work_do
				+ ", production_qty=" + production_qty + ", production_completed_qty=" + production_completed_qty
				+ ", line_no=" + line_no + "]";
	}

}
