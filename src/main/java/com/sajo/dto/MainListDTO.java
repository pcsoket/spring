package com.sajo.dto;

public class MainListDTO {
	
	private String gcontent,imgNum,userId,gsubject,imageoriginalFile,boardName;
	private int ghitCount,gnum;
	
	
	public String getImageoriginalFile() {
		return imageoriginalFile;
	}
	public void setImageoriginalFile(String imageoriginalFile) {
		this.imageoriginalFile = imageoriginalFile;
	}
	public int getGnum() {
		return gnum;
	}
	public void setGnum(int gnum) {
		this.gnum = gnum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGsubject() {
		return gsubject;
	}
	public void setGsubject(String gsubject) {
		this.gsubject = gsubject;
	}
	public String getGcontent() {
		return gcontent;
	}
	public void setGcontent(String gcontent) {
		this.gcontent = gcontent;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public int getGhitCount() {
		return ghitCount;
	}
	public void setGhitCount(int ghitCount) {
		this.ghitCount = ghitCount;
	}
	public String getImgNum() {
		return imgNum;
	}
	public void setImgNum(String imgNum) {
		this.imgNum = imgNum;
	}
	
	

}
