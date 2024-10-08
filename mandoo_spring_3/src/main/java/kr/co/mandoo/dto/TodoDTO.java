package kr.co.mandoo.dto;

public class TodoDTO {
	private int todoId;
	private String userId;
	private String date;
	private String title;
	private String contents;

	public TodoDTO() {
	}

	public TodoDTO(int todoId, String userId, String date, String title, String contents) {
		this.todoId = todoId;
		this.userId = userId;
		this.date = date;
		this.title = title;
		this.contents = contents;
	}

	public int getTodoId() {
		return todoId;
	}

	public void setTodoId(int todoId) {
		this.todoId = todoId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
}
