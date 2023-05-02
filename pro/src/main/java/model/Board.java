package model;

import java.util.Date;

public class Board {
	private int boardNum;
	private String boardContent;
	private String boardFile;
	private String boardTitle;
	private Date boardTime;
	private int boardReadCnt;
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardFile() {
		return boardFile;
	}
	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public Date getBoardTime() {
		return boardTime;
	}
	public void setBoardTime(Date boardTime) {
		this.boardTime = boardTime;
	}
	public int getBoardReadCnt() {
		return boardReadCnt;
	}
	public void setBoardReadCnt(int boardReadCnt) {
		this.boardReadCnt = boardReadCnt;
	}
	@Override
	public String toString() {
		return "Board [boardNum=" + boardNum + ", boardContent=" + boardContent + ", boardFile=" + boardFile
				+ ", boardTitle=" + boardTitle + ", boardReadCnt=" + boardReadCnt + "]";
	}
	
}
