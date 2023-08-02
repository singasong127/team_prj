package com.team.app.infra.member;

public class Member {

//	컬럼
	private String seq;
	private String memType;
	private String nickname;
	private String email;
	private String pwd;
	private String gender;
	private String dob;
	private String location;
	private String memDesc;
	private String delNy;
	private String signUpDt;
	private String uptProfileDt;
	
	public String getSignUpDt() {
		return signUpDt;
	}
	public void setSignUpDt(String signUpDt) {
		this.signUpDt = signUpDt;
	}
	public String getUptProfileDt() {
		return uptProfileDt;
	}
	public void setUptProfileDt(String uptProfileDt) {
		this.uptProfileDt = uptProfileDt;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMemDesc() {
		return memDesc;
	}
	public void setMemDesc(String memDesc) {
		this.memDesc = memDesc;
	}
	public String getDelNy() {
		return delNy;
	}
	public void setDelNy(String delNy) {
		this.delNy = delNy;
	}

	

}

//	member 테이블 컬럼
//CREATE TABLE IF NOT EXISTS `mydb`.`member` (
//		  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
//		  `memType` TINYINT NULL,
//		  `nickname` VARCHAR(45) NULL,
//		  `email` VARCHAR(45) NULL,
//		  `pwd` VARCHAR(45) NULL,
//		  `gender` TINYINT NULL,
//		  `dob` DATE NULL,	(생년월일)
//		  `location` VARCHAR(45) NULL,
//		  `memDesc` VARCHAR(100) NULL, (자기소개문)
//		  PRIMARY KEY (`seq`))
//		ENGINE = InnoDB