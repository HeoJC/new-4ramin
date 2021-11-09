package com.yedam.saramin.company.service;

import java.util.List;

public interface CompanyService {
	List<CompanyVO> selectCompanyList() ;
	CompanyVO selectCompany(CompanyVO vo) ;
	int insertCompany(CompanyVO vo) ;
	int updateCompany(CompanyVO vo) ;
	int deleteCompany(CompanyVO vo) ;
	int likeCompany(CompanyVO vo) ;
	CompanyVO selectLikeCompany(CompanyVO vo) ;
	CompanyVO selectSalCompany(CompanyVO vo) ;
	int insertSalCompany(CompanyVO vo) ;
	int insertBranchCompany(CompanyVO vo) ;
	int deleteSalCompany(CompanyVO vo) ;
	int deleteBranchCompany(CompanyVO vo) ;
	int updateSalCompany(CompanyVO vo) ;
	int updateBranchCompany(CompanyVO vo) ;
	List<CompanyVO> selectComBookMarkList(CompanyVO vo) ;
	int insertComBookMark(CompanyVO vo) ;
	int deleteComBookMark(CompanyVO vo) ;	
	List<CompanyVO> selectAdtBookMarkList(CompanyVO vo) ;
	int insertAdtBookMark(CompanyVO vo) ;
	int deleteAdtBookMark(CompanyVO vo) ;	
}
