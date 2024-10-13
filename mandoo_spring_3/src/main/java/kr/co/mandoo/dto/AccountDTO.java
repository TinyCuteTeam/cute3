package kr.co.mandoo.dto;

public class AccountDTO {
    private String account_Id;
    private String account_Pw;
    private String account_Email;
    private String account_Name;
	public String getAccount_Id() {
		return account_Id;
	}
	public void setAccount_Id(String account_Id) {
		this.account_Id = account_Id;
	}
	public String getAccount_Pw() {
		return account_Pw;
	}
	public void setAccount_Pw(String account_Pw) {
		this.account_Pw = account_Pw;
	}
	public String getAccount_Email() {
		return account_Email;
	}
	public void setAccount_Email(String account_Email) {
		this.account_Email = account_Email;
	}
	public String getAccount_Name() {
		return account_Name;
	}
	public void setAccount_Name(String account_Name) {
		this.account_Name = account_Name;
	}
	@Override
	public String toString() {
		return "AccountDTO [account_Id=" + account_Id + ", account_Pw=" + account_Pw + ", account_Email="
				+ account_Email + ", account_Name=" + account_Name + "]";
	}

}
