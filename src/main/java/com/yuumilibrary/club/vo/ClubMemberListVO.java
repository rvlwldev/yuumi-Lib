package com.yuumilibrary.club.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class ClubMemberListVO {
	private String cbName;
	private String memId;
	private int cbBoClubNum;

	
	public int getCbBoClubNum() {
		return cbBoClubNum;
	}
	public void setCbBoClubNum(int cbBoClubNum) {
		this.cbBoClubNum = cbBoClubNum;
	}
	public String getCbName() {
		return cbName;
	}
	public void setCbName(String cbName) {
		this.cbName = cbName;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
