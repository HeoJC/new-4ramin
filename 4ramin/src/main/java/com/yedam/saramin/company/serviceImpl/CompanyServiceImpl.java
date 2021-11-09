package com.yedam.saramin.company.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.saramin.comm.DataSource;
import com.yedam.saramin.company.service.CompanyMapper;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;

public class CompanyServiceImpl implements CompanyService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true) ;
	private CompanyMapper map = sqlSession.getMapper(CompanyMapper.class) ;

	@Override
	public List<CompanyVO> selectCompanyList() {
		return map.selectCompanyList() ;
	}

	@Override
	public CompanyVO selectCompany(CompanyVO vo) {
		return map.selectCompany(vo) ;
	}

	@Override
	public int insertCompany(CompanyVO vo) {
		return map.insertCompany(vo) ;
	}

	@Override
	public int updateCompany(CompanyVO vo) {
		return map.updateCompany(vo) ;
	}

	@Override
	public int deleteCompany(CompanyVO vo) {
		return map.deleteCompany(vo) ;
	}

	@Override
	public int likeCompany(CompanyVO vo) {
		return map.likeCompany(vo) ;
	}

	@Override
	public CompanyVO selectLikeCompany(CompanyVO vo) {
		return map.selectLikeCompany(vo) ;
	}

	@Override
	public CompanyVO selectSalCompany(CompanyVO vo) {
		return map.selectSalCompany(vo) ;
	}

	@Override
	public int insertSalCompany(CompanyVO vo) {
		return map.insertSalCompany(vo) ;
	}
}
