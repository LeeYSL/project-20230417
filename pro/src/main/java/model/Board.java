package model;

import java.util.Date;

public class Board {
	private int boardNum; //게시글번호
	private String boardContent; //글내용
	private String boardFile; //첨부파일명
	private String boardTitle; //글제목
	private Date boardTime; //게시글등록일시
	private int boardReadCnt; //조회수. 상세보기 시 1씩 증가
	private String boardId; //게시판종류
	private int boardGrp; //답글 작성시 원글의 게시글번호
	private int boardGrpLevel; //답글의 레벨
	private int boardGrpStep; //그룹의 출력 순서
	private String memId; //작성자 이름
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
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public int getBoardGrp() {
		return boardGrp;
	}
	public void setBoardGrp(int boardGrp) {
		this.boardGrp = boardGrp;
	}
	public int getBoardGrpLevel() {
		return boardGrpLevel;
	}
	public void setBoardGrpLevel(int boardGrpLevel) {
		this.boardGrpLevel = boardGrpLevel;
	}
	public int getBoardGrpStep() {
		return boardGrpStep;
	}
	public void setBoardGrpStep(int boardGrpStep) {
		this.boardGrpStep = boardGrpStep;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	@Override
	public String toString() {
		return "Board [boardNum=" + boardNum + ", boardContent=" + boardContent + ", boardFile=" + boardFile
				+ ", boardTitle=" + boardTitle + ", boardTime=" + boardTime + ", boardReadCnt=" + boardReadCnt
				+ ", boardId=" + boardId + ", boardGrp=" + boardGrp + ", boardGrpLevel=" + boardGrpLevel
				+ ", boardGrpStep=" + boardGrpStep + ", memId=" + memId + "]";
	}

	
	


}
