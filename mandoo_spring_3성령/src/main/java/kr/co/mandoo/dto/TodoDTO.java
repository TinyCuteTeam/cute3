package kr.co.mandoo.dto;

import java.sql.Date;

public class TodoDTO {
    private Integer todo_Id;
    private String user_Id;
    private Date todo_Date;
    private String todo_Title;
    private String todo_Contents;
	public Integer getTodo_Id() {
		return todo_Id;
	}
	public void setTodo_Id(Integer todo_Id) {
		this.todo_Id = todo_Id;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public Date getTodo_Date() {
		return todo_Date;
	}
	public void setTodo_Date(Date todo_Date) {
		this.todo_Date = todo_Date;
	}
	public String getTodo_Title() {
		return todo_Title;
	}
	public void setTodo_Title(String todo_Title) {
		this.todo_Title = todo_Title;
	}
	public String getTodo_Contents() {
		return todo_Contents;
	}
	public void setTodo_Contents(String todo_Contents) {
		this.todo_Contents = todo_Contents;
	}
	@Override
	public String toString() {
		return "TodoDTO [todo_Id=" + todo_Id + ", user_Id=" + user_Id + ", todo_Date=" + todo_Date + ", todo_Title="
				+ todo_Title + ", todo_Contents=" + todo_Contents + "]";
	}
    
    

	}
