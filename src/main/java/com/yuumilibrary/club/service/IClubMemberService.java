package com.yuumilibrary.club.service;

import java.util.List;

import com.yuumilibrary.club.vo.ClubSearchVO;
import com.yuumilibrary.club.vo.ClubVO;

public interface IClubMemberService {

	public List<ClubVO> getClubList(ClubSearchVO searchVO) throws Exception;
	
	public ClubVO getClub(String bkClubName) throws Exception;
	
	// 클럽을 만듬
	public void registClub(ClubVO clubVO) throws Exception;

	// 클럽 정보수정
	public void modifyClub(ClubVO clubVO) throws Exception;

	// 클럽 지움
	public void removeClub(ClubVO clubVO) throws Exception;




	/*
	 * // 밑에는 회원이 클럽가입신청 등등... public int registMember(ClubListVO clubListVO) throws
	 * Exception;
	 * 
	 * public void registMemberConfirm(ClubListVO clubListVO) throws Exception;
	 * 
	 * public void withdrawMember(ClubListVO clubListVO) throws Exception;
	 * 
	 * public void getMemberCount(ClubListVO clubListVO) throws Exception;
	 */
	
}
