package com.newshare.web.model.vo;

public class PaperPagesVO {
	private int page;
	private int paperNum;
	private String frameInform;
	
	public PaperPagesVO() {}
	
	public PaperPagesVO(int page, int paperNum, String frameInform) {
		super();
		this.page = page;
		this.paperNum = paperNum;
		this.frameInform = frameInform;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPaperNum() {
		return paperNum;
	}
	
	public void setPaperNum(int paperNum) {
		this.paperNum = paperNum;
	}
	
	public String getFrameInform() {
		return frameInform;
	}
	
	public void setFrameInform(String frameInform) {
		this.frameInform = frameInform;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PaperPagesVO [page=");
		builder.append(page);
		builder.append(", paperNum=");
		builder.append(paperNum);
		builder.append(", frameInform=");
		builder.append(frameInform);
		builder.append("]");
		return builder.toString();
	}
}
