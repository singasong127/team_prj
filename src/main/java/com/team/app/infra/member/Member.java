package com.team.app.infra.member;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	//UPLOAD
	private String tableName;
	private Integer type;
	private String defaultNy;
	private String path;
	private String originalName;
	private String uuidName;
	private String ext;
	private long size;
	private String pseq;
	private MultipartFile[] uploadImg;
	private MultipartFile[] uploadImgProfile;
	private Integer uploadImgType;

	public MultipartFile[] getUploadImg() {
		return uploadImg;
	}

	public void setUploadImg(MultipartFile[] uploadImg) {
		this.uploadImg = uploadImg;
	}

	public MultipartFile[] getUploadImgProfile() {
		return uploadImgProfile;
	}

	public void setUploadImgProfile(MultipartFile[] uploadImgProfile) {
		this.uploadImgProfile = uploadImgProfile;
	}

	public Integer getUploadImgType() {
		return uploadImgType;
	}

	public void setUploadImgType(Integer uploadImgType) {
		this.uploadImgType = uploadImgType;
	}

	public Integer getUploadImgProfileType() {
		return uploadImgProfileType;
	}

	public void setUploadImgProfileType(Integer uploadImgProfileType) {
		this.uploadImgProfileType = uploadImgProfileType;
	}

	public Integer getUploadImgMaxNumber() {
		return uploadImgMaxNumber;
	}

	public void setUploadImgMaxNumber(Integer uploadImgMaxNumber) {
		this.uploadImgMaxNumber = uploadImgMaxNumber;
	}

	public Integer getUploadImgProfileMaxNumber() {
		return uploadImgProfileMaxNumber;
	}

	public void setUploadImgProfileMaxNumber(Integer uploadImgProfileMaxNumber) {
		this.uploadImgProfileMaxNumber = uploadImgProfileMaxNumber;
	}

	public String[] getUploadImgDeleteSeq() {
		return uploadImgDeleteSeq;
	}

	public void setUploadImgDeleteSeq(String[] uploadImgDeleteSeq) {
		this.uploadImgDeleteSeq = uploadImgDeleteSeq;
	}

	public String[] getUploadImgDeletePathFile() {
		return uploadImgDeletePathFile;
	}

	public void setUploadImgDeletePathFile(String[] uploadImgDeletePathFile) {
		this.uploadImgDeletePathFile = uploadImgDeletePathFile;
	}

	private Integer uploadImgProfileType;
	private Integer uploadImgMaxNumber;
	private Integer uploadImgProfileMaxNumber;
	private String[] uploadImgDeleteSeq;
	private String[] uploadImgDeletePathFile;


//	컬럼
	private String seq;
	private String memType;
	private String nickname;
	private String email;
	private String pwd;
	private String gender;
	private String dob;
	private String zipcode;
	private String address;
	private String memDesc;
	private String delNy;
	private String signUpDt;
	private String uptProfileDt;

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getDefaultNy() {
		return defaultNy;
	}

	public void setDefaultNy(String defaultNy) {
		this.defaultNy = defaultNy;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getUuidName() {
		return uuidName;
	}

	public void setUuidName(String uuidName) {
		this.uuidName = uuidName;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public String getPseq() {
		return pseq;
	}

	public void setPseq(String pseq) {
		this.pseq = pseq;
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

	public String getZipcode() {
		return zipcode;
	}
	
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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