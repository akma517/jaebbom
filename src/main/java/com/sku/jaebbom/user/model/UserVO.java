package com.sku.jaebbom.user.model;

public class UserVO {
	private int user_num;
	private String user_name;
	private String user_id;
	private String user_pwd;
	private String user_mail;
	private String user_adress;
	private String talent_provision;
	private String univ;
	private String major;
	private String school_year;
	private String graduate;
	private String nickname;
	
	private int career_num;
	private int register_num;
	private String career_name;
	private String career_photo;
	private String etc_career;
	
	public UserVO() {}
	public UserVO(int user_num, String user_pwd) {
		super();
		this.user_num = user_num;
		this.user_pwd = user_pwd;
	}
	public UserVO(String user_id, String user_pwd) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
	}
	public UserVO(String user_id, String user_pwd, String user_name) {
		super();
		this.user_name = user_name;
	}
	public UserVO(String user_name, String user_id, String user_pwd, String user_mail, String user_adress, String nickname) {
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_mail = user_mail;
		this.user_adress = user_adress;
		this.nickname = nickname;
	}
	
	public int getCareer_num() {
		return career_num;
	}
	public void setCareer_num(int career_num) {
		this.career_num = career_num;
	}
	public int getRegister_num() {
		return register_num;
	}
	public void setRegister_num(int register_num) {
		this.register_num = register_num;
	}
	public String getCareer_name() {
		return career_name;
	}
	public void setCareer_name(String career_name) {
		this.career_name = career_name;
	}
	public String getCareer_photo() {
		return career_photo;
	}
	public void setCareer_photo(String career_photo) {
		this.career_photo = career_photo;
	}
	public String getEtc_career() {
		return etc_career;
	}
	public void setEtc_career(String etc_career) {
		this.etc_career = etc_career;
	}
	public int getUser_num() {
		return user_num;
	}
	
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getUser_adress() {
		return user_adress;
	}
	public void setUser_adress(String user_adress) {
		this.user_adress = user_adress;
	}
	public String isTalent_provision() {
		return talent_provision;
	}
	public void setTalent_provision(String talent_provision) {
		this.talent_provision = talent_provision;
	}
	public String getUniv() {
		return univ;
	}
	public void setUniv(String univ) {
		this.univ = univ;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getSchool_year() {
		return school_year;
	}
	public void setSchool_year(String school_year) {
		this.school_year = school_year;
	}
	public String isGraduate() {
		return graduate;
	}
	public void setGraduate(String graduate) {
		this.graduate = graduate;
	}
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Override
	public String toString() {
		return "UserVO [user_num=" + user_num + ", user_name=" + user_name + ", user_id=" + user_id + ", user_pwd="
				+ user_pwd + ", user_mail=" + user_mail + ", user_adress=" + user_adress + ", talent_provision="
				+ talent_provision + ", univ=" + univ + ", major=" + major + ", school_year=" + school_year
				+ ", graduate=" + graduate + ", nickname=" + nickname + ", career_num=" + career_num + ", register_num="
				+ register_num + ", career_name=" + career_name + ", career_photo=" + career_photo + ", etc_career="
				+ etc_career + "]";
	}
	
}
