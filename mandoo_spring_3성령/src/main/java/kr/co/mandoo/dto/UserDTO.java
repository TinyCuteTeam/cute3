package kr.co.mandoo.dto;

public class UserDTO {
    private String user_Id;
    private String user_Pw;
    private int user_Access;
    private String user_Name;
    private String user_Email;
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getUser_Pw() {
		return user_Pw;
	}
	public void setUser_Pw(String user_Pw) {
		this.user_Pw = user_Pw;
	}
	public int getUser_Access() {
		return user_Access;
	}
	public void setUser_Access(int user_Access) {
		this.user_Access = user_Access;
	}
	public String getUser_Name() {
		return user_Name;
	}
	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	public String getUser_Email() {
		return user_Email;
	}
	public void setUser_Email(String user_Email) {
		this.user_Email = user_Email;
	}
	@Override
	public String toString() {
		return "UserDTO [user_Id=" + user_Id + ", user_Pw=" + user_Pw + ", user_Access=" + user_Access + ", user_Name="
				+ user_Name + ", user_Email=" + user_Email + "]";
	}

    
}

