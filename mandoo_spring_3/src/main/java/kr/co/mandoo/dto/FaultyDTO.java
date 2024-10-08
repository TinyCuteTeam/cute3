package kr.co.mandoo.dto;

public class FaultyDTO {
    private String faultyid;      // 날짜 또는 식별자
    private String itemcode;      // 품목 코드
    private String errorid;       // 에러 코드
    private String workid;        // 작업 지시 번호
    private String faultycount;   // 불량 수량
    
    public String getFaultyid() {
        return faultyid;
    }

    public void setFaultyid(String faultyid) {
        this.faultyid = faultyid;
    }

    public String getItemcode() {
        return itemcode;
    }

    public void setItemcode(String itemcode) {
        this.itemcode = itemcode;
    }

    public String getErrorid() {
        return errorid;
    }

    public void setErrorid(String errorid) {
        this.errorid = errorid;
    }

    public String getWorkid() {
        return workid;
    }

    public void setWorkid(String workid) {
        this.workid = workid;
    }

    public String getFaultycount() {
        return faultycount;
    }

    public void setFaultycount(String faultycount) {
        this.faultycount = faultycount;
    }
}
