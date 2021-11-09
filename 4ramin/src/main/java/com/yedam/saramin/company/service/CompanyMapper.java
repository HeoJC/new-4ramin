package com.yedam.saramin.company.service;

import java.util.List;

public interface CompanyMapper {
	List<CompanyVO> selectCompanyList() ;
	CompanyVO selectCompany(CompanyVO vo) ;
	int insertCompany(CompanyVO vo) ;
	int updateCompany(CompanyVO vo) ;
	int deleteCompany(CompanyVO vo) ;
	int likeCompany(CompanyVO vo) ;
	CompanyVO selectLikeCompany(CompanyVO vo) ;
	CompanyVO selectSalCompany(CompanyVO vo) ;
	int insertSalCompany(CompanyVO vo) ;
}
