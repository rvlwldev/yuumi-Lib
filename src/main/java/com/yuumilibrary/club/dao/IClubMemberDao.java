package com.yuumilibrary.club.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yuumilibrary.club.vo.ClubMemberListVO;
import com.yuumilibrary.club.vo.ClubSearchVO;
import com.yuumilibrary.club.vo.ClubVO;

@Mapper
public interface IClubMemberDao {

	// 아래 3개의 기능은 클럽마스터가 할수있따 ^^
	public int getClubCount(ClubSearchVO searchVO) throws Exception;
	
	public List<ClubVO> getClubList(ClubSearchVO searchVO) throws Exception;
	
	public ClubVO getClub(String bkClubName) throws Exception;
	
	// 클럽을 만듬
	public int registClub(ClubVO clubVO) throws Exception;
	
	// 클럽 지움
	public int deleteClub(ClubVO clubVO) throws Exception;

	// 클럽 정보수정
	public int modifyClub(ClubVO clubVO) throws Exception;

	
	// 밑에는 회원이 클럽가입신청 등등...
	
	  public int registMember(ClubMemberListVO clubListVO) throws Exception;
	  
	  public int registMemberConfirm(ClubMemberListVO clubListVO) throws Exception;
	  
	  public int withdrawMember(ClubMemberListVO clubListVO) throws Exception;
	  
	  public int getMemberCount(ClubMemberListVO clubListVO) throws Exception;
	 
}
