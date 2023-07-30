package model;

import java.util.Date;

public class Account {
	private int accountPlus;
	private int accountMinus;
	private String memId;
	private Date accountDate;
	private String accountReason;
	private int accountTotal;
	public int getAccountPlus() {
		return accountPlus;
	}
	public void setAccountPlus(int accountPlus) {
		this.accountPlus = accountPlus;
	}
	public int getAccountMinus() {
		return accountMinus;
	}
	public void setAccountMinus(int accountMinus) {
		this.accountMinus = accountMinus;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Date getAccountDate() {
		return accountDate;
	}
	public void setAccountDate(Date accountDate) {
		this.accountDate = accountDate;
	}
	public String getAccountReason() {
		return accountReason;
	}
	public void setAccountReason(String accountReason) {
		this.accountReason = accountReason;
	}
	public int getAccountTotal() {
		return accountTotal;
	}
	public void setAccountTotal(int accountTotal) {
		this.accountTotal = accountTotal;
	}
	@Override
	public String toString() {
		return "Account [accountPlus=" + accountPlus + ", accountMinus=" + accountMinus + ", memId=" + memId
				+ ", accountDate=" + accountDate + ", accountReason=" + accountReason + ", accountTotal=" + accountTotal
				+ "]";
	}

}
