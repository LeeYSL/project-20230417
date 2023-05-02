package model;

import java.util.Date;

public class Comment {
	private int boardNum;
	private int commentNum;
	private String commentContent;
	private Date commentTime;
	private String memId;
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	@Override
	public String toString() {
		return "Comment [boardNum=" + boardNum + ", commentNum=" + commentNum + ", commentContent=" + commentContent
				+ ", commentTime=" + commentTime + ", memId=" + memId + "]";
	}
	
}
