package model;

public class Member {
	private String memId;
	private String memPw;
	private String memName;
	private String memPhone;
	private String memEmail;
	private String memAdress;
	private int memPosition;
	private int memPoint;

	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemAdress() {
		return memAdress;
	}
	public void setMemAdress(String memAdress) {
		this.memAdress = memAdress;
	}
	public int getMemPosition() {
		return memPosition;
	}
	public void setMemPosition(int memPosition) {
		this.memPosition = memPosition;
	}
	public int getMemPoint() {
		return memPoint;
	}
	public void setMemPoint(int memPoint) {
		this.memPoint = memPoint;
	}

	@Override
	public String toString() {
		return "Member [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memPhone=" + memPhone
				+ ", memEmail=" + memEmail + ", memAdress=" + memAdress + ", memPosition=" + memPosition + ", memPoint="
				+ memPoint + "]";
	}
}
