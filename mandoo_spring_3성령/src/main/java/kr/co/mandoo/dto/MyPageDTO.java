package kr.co.mandoo.dto;

public class MyPageDTO {
    private String mypage_Id;
    private String user_Id;
    private String mypage_Name;
    private String mypage_Affiliation;
    private String mypage_Intel;
    private String mypage_Phone;
    private String mypage_Position;
    private String mypage_Mainnum;
    public String getMypage_Id() {
		return mypage_Id;
	}
	public void setMypage_Id(String mypage_Id) {
		this.mypage_Id = mypage_Id;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getMypage_Name() {
		return mypage_Name;
	}
	public void setMypage_Name(String mypage_Name) {
		this.mypage_Name = mypage_Name;
	}
	public String getMypage_Affiliation() {
		return mypage_Affiliation;
	}
	public void setMypage_Affiliation(String mypage_Affiliation) {
		this.mypage_Affiliation = mypage_Affiliation;
	}
	@Override
	public String toString() {
		return "MyPageDTO [mypage_Id=" + mypage_Id + ", user_Id=" + user_Id + ", mypage_Name=" + mypage_Name
				+ ", mypage_Affiliation=" + mypage_Affiliation + ", mypage_Intel=" + mypage_Intel + ", mypage_Phone="
				+ mypage_Phone + ", mypage_Position=" + mypage_Position + ", mypage_Mainnum=" + mypage_Mainnum
				+ ", mypage_Address=" + mypage_Address + ", mypage_Birth=" + mypage_Birth + ", mypage_Log=" + mypage_Log
				+ "]";
	}
	public String getMypage_Intel() {
		return mypage_Intel;
	}
	public void setMypage_Intel(String mypage_Intel) {
		this.mypage_Intel = mypage_Intel;
	}
	public String getMypage_Phone() {
		return mypage_Phone;
	}
	public void setMypage_Phone(String mypage_Phone) {
		this.mypage_Phone = mypage_Phone;
	}
	public String getMypage_Position() {
		return mypage_Position;
	}
	public void setMypage_Position(String mypage_Position) {
		this.mypage_Position = mypage_Position;
	}
	public String getMypage_Mainnum() {
		return mypage_Mainnum;
	}
	public void setMypage_Mainnum(String mypage_Mainnum) {
		this.mypage_Mainnum = mypage_Mainnum;
	}
	public String getMypage_Address() {
		return mypage_Address;
	}
	public void setMypage_Address(String mypage_Address) {
		this.mypage_Address = mypage_Address;
	}
	public String getMypage_Birth() {
		return mypage_Birth;
	}
	public void setMypage_Birth(String mypage_Birth) {
		this.mypage_Birth = mypage_Birth;
	}
	public String getMypage_Log() {
		return mypage_Log;
	}
	public void setMypage_Log(String mypage_Log) {
		this.mypage_Log = mypage_Log;
	}
	private String mypage_Address;
    private String mypage_Birth;
    private String mypage_Log;


   }
