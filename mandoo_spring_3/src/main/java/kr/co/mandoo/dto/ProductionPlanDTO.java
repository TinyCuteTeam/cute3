package kr.co.mandoo.dto;

import java.util.Date;

public class ProductionPlanDTO {
    private String planId;
    private String planContents;
    private Date planDate;
    private Date planEndDate;
    private int planCount;
    private String planName;

    // Getters and Setters
    public String getPlanId() {
        return planId;
    }
    public void setPlanId(String planId) {
        this.planId = planId;
    }
    public String getPlanContents() {
        return planContents;
    }
    public void setPlanContents(String planContents) {
        this.planContents = planContents;
    }
    public Date getPlanDate() {
        return planDate;
    }
    public void setPlanDate(Date planDate) {
        this.planDate = planDate;
    }
    public Date getPlanEndDate() {
        return planEndDate;
    }
    public void setPlanEndDate(Date planEndDate) {
        this.planEndDate = planEndDate;
    }
    public int getPlanCount() {
        return planCount;
    }
    public void setPlanCount(int planCount) {
        this.planCount = planCount;
    }
    public String getPlanName() {
        return planName;
    }
    public void setPlanName(String planName) {
        this.planName = planName;
    }
}
