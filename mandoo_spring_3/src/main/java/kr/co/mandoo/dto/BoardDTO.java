package kr.co.mandoo.dto;

import java.util.Date;

public class BoardDTO {
    private String bord_Id;
    private String user_Id;
    private String board_Title;
    private String board_Contents;
    private Date board_Date;
    private String user_Name;  // 작성자 이름 필드 추가
	public String getBord_Id() {
		return bord_Id;
	}
	public void setBord_Id(String bord_Id) {
		this.bord_Id = bord_Id;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getBoard_Title() {
		return board_Title;
	}
	public void setBoard_Title(String board_Title) {
		this.board_Title = board_Title;
	}
	public String getBoard_Contents() {
		return board_Contents;
	}
	public void setBoard_Contents(String board_Contents) {
		this.board_Contents = board_Contents;
	}
	public Date getBoard_Date() {
		return board_Date;
	}
	public void setBoard_Date(Date board_Date) {
		this.board_Date = board_Date;
	}
	public String getUser_Name() {
		return user_Name;
	}
	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	    
}
