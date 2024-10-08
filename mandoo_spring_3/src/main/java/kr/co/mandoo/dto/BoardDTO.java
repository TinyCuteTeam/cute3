package kr.co.mandoo.dto;

import java.util.Date;

public class BoardDTO {
    private String boardId;
    private String userId;
    private String boardTitle;
    private String boardContents;
    private Date boardDate;
    private String userName;  // 작성자 이름 필드 추가

    // Getters and Setters
    public String getBoardId() {
        return boardId;
    }

    public void setBoardId(String boardId) {
        this.boardId = boardId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getBoardTitle() {
        return boardTitle;
    }

    public void setBoardTitle(String boardTitle) {
        this.boardTitle = boardTitle;
    }

    public String getBoardContents() {
        return boardContents;
    }

    public void setBoardContents(String boardContents) {
        this.boardContents = boardContents;
    }

    public Date getBoardDate() {
        return boardDate;
    }

    public void setBoardDate(Date boardDate) {
        this.boardDate = boardDate;
    }

    public String getUserName() {  // 작성자 이름 Getter
        return userName;
    }

    public void setUserName(String userName) {  // 작성자 이름 Setter
        this.userName = userName;
    }
}
