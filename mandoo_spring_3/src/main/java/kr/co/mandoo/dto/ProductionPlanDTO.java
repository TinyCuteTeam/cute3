package kr.co.mandoo.dto;

import java.sql.Date;

public class ProductionPlanDTO {
	private String plan_id;
	private String plan_contents;
	private Date plan_date;
	private Date plan_end_date;
	private int plan_count;
	private String plan_name;

	public String getPlan_id() {
		return plan_id;
	}

	public void setPlan_id(String plan_id) {
		this.plan_id = plan_id;
	}

	public String getPlan_contents() {
		return plan_contents;
	}

	public void setPlan_contents(String plan_contents) {
		this.plan_contents = plan_contents;
	}

	public Date getPlan_date() {
		return plan_date;
	}

	public void setPlan_date(Date plan_date) {
		this.plan_date = plan_date;
	}

	public Date getPlan_end_date() {
		return plan_end_date;
	}

	public void setPlan_end_date(Date plan_end_date) {
		this.plan_end_date = plan_end_date;
	}

	public int getPlan_count() {
		return plan_count;
	}

	public void setPlan_count(int plan_count) {
		this.plan_count = plan_count;
	}

	public String getPlan_name() {
		return plan_name;
	}

	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}

	@Override
	public String toString() {
		return "ProductionPlanDTO [plan_id=" + plan_id + ", plan_contents=" + plan_contents + ", plan_date=" + plan_date
				+ ", plan_end_date=" + plan_end_date + ", plan_count=" + plan_count + ", plan_name=" + plan_name + "]";
	}

}
