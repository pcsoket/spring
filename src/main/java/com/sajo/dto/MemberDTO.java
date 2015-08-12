package com.sajo.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	
	private String userId,userName,userPwd,userAddr1,userAddr2,userAddr3,userTel,userEmail,userCreated,userPimg,userSelf;
	private MultipartFile file2;
	private int gno,userAuth;
	
	
	
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserAddr3() {
		return userAddr3;
	}
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserCreated() {
		return userCreated;
	}
	public void setUserCreated(String userCreated) {
		this.userCreated = userCreated;
	}
	public String getUserPimg() {
		return userPimg;
	}
	public void setUserPimg(String userPimg) {
		this.userPimg = userPimg;
	}
	public String getUserSelf() {
		return userSelf;
	}
	public void setUserSelf(String userSelf) {
		this.userSelf = userSelf;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getUserAuth() {
		return userAuth;
	}
	public void setUserAuth(int userAuth) {
		this.userAuth = userAuth;
	}
	
	
	

}
