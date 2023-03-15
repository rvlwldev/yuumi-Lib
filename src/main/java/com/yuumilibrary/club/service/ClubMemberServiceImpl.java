package com.yuumilibrary.club.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.yuumilibrary.club.dao.IClubMemberDao;
import com.yuumilibrary.club.vo.ClubSearchVO;
import com.yuumilibrary.club.vo.ClubVO;
import com.yuumilibrary.common.exception.BizDuplicateException;
import com.yuumilibrary.common.exception.BizException;
import com.yuumilibrary.common.exception.BizNotFoundException;

@Service
public class ClubMemberServiceImpl implements IClubMemberService {
	
	@Autowired
	private IClubMemberDao clubMemberDao;

	@Override
	public List<ClubVO> getClubList(ClubSearchVO searchVO) throws Exception {
		try {
			int rowCount = clubMemberDao.getClubCount(searchVO);
			searchVO.setTotalRowCount(rowCount);
			
			searchVO.setting();
			return clubMemberDao.getClubList(searchVO);
		} catch (Exception e) {
			throw new BizException(e);
		}
	}

	@Override
	public ClubVO getClub(String bkClubName) throws Exception {
		try {
			ClubVO club = clubMemberDao.getClub(bkClubName);
			if (club == null) {
				throw new BizNotFoundException("클럽 [" + bkClubName + "]을 조회하지 못했습니다.");
			}
			return club;
		} catch (Exception e) {
			throw new BizException(e);
		}
	}

	@Override
	public void registClub(ClubVO clubVO) throws Exception {
		try {
			ClubVO vo = clubMemberDao.getClub(clubVO.getBkClubName());
			if (vo != null) {
				throw new BizDuplicateException("클럽이름 [" + clubVO.getBkClubName() + "]가 이미 사용중입니다.");
			}
			clubMemberDao.registClub(clubVO);
		} catch (Exception e) {
			throw new BizException(e);
		}
	}

	@Override
	public void modifyClub(ClubVO clubVO) throws Exception {
		try {
			ClubVO vo = clubMemberDao.getClub(clubVO.getBkClubName());
			if (vo == null) {
				throw new BizNotFoundException("클럽이름 [" + clubVO.getBkClubName() + "]을 조회하지 못했습니다.");
			}
			clubMemberDao.modifyClub(clubVO);
		} catch (Exception e) {
			throw new BizException(e);
		}
	}

	@Override
	public void removeClub(ClubVO clubVO) throws Exception {
		try {
			ClubVO vo = clubMemberDao.getClub(clubVO.getBkClubName());
			if (vo == null) {
				throw new BizNotFoundException("클럽이름 [" + clubVO.getBkClubName() + "]을 조회하지 못했습니다.");
			}
			clubMemberDao.deleteClub(clubVO);
		} catch (Exception e) {
			throw new BizException(e);
		}
	}

}
