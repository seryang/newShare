package com.newshare.web.model.vo;

public class WallBoardVO {
	private int boardNum;
	private int paperNum;
	private String comment;
	private String writingDate;
	
	public WallBoardVO(){}
	
	public WallBoardVO(int boardNum, int paperNum, String comment,
			String writingDate) {
		super();
		this.boardNum = boardNum;
		this.paperNum = paperNum;
		this.comment = comment;
		this.writingDate = writingDate;
	}
	
	public WallBoardVO(int paperNum, String comment) {
		this.paperNum = paperNum;
		this.comment = comment;
	}

	public int getBoardNum() {
		return boardNum;
	}
	
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	
	public int getPaperNum() {
		return paperNum;
	}
	
	public void setPaperNum(int paperNum) {
		this.paperNum = paperNum;
	}
	
	public String getComment() {
		return comment;
	}
	
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public String getWritingDate() {
		return writingDate;
	}
	
	public void setWritingDate(String writingDate) {
		this.writingDate = writingDate;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("WallBoardVO [boardNum=").append(boardNum)
				.append(", paperNum=").append(paperNum).append(", comment=")
				.append(comment).append(", writingDate=").append(writingDate)
				.append("]");
		return builder.toString();
	}
}
