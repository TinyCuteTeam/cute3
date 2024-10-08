package kr.co.mandoo.dto;

public class ErrorDTO {
    private String errorId;
    private String errorName;
    private String errorContents;

    public String getErrorId() {
        return errorId;
    }

    public void setErrorId(String errorId) {
        this.errorId = errorId;
    }

    public String getErrorName() {
        return errorName;
    }

    public void setErrorName(String errorName) {
        this.errorName = errorName;
    }

    public String getErrorContents() {
        return errorContents;
    }

    public void setErrorContents(String errorContents) {
        this.errorContents = errorContents;
    }
}
