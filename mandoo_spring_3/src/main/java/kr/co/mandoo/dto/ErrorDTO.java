package kr.co.mandoo.dto;

public class ErrorDTO {
    private String error_Id;
    private String error_Name;
    private String error_Contents;
    
	public String getError_Id() {
		return error_Id;
	}
	public void setError_Id(String error_Id) {
		this.error_Id = error_Id;
	}
	public String getError_Name() {
		return error_Name;
	}
	public void setError_Name(String error_Name) {
		this.error_Name = error_Name;
	}
	public String getError_Contents() {
		return error_Contents;
	}
	public void setError_Contents(String error_Contents) {
		this.error_Contents = error_Contents;
	}
    
}
