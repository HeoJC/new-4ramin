package com.yedam.saramin.adoptions.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.saramin.adoptions.Adoption;
import com.yedam.saramin.adoptions.service.AdoptionService;
import com.yedam.saramin.adoptions.service.AdoptionMapper;
import com.yedam.saramin.comm.DataSource;

public class AdoptionServiceImpl implements AdoptionService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private AdoptionMapper map = sqlSession.getMapper(AdoptionMapper.class);
	
	@Override
	public List<Adoption> selectAdoptionAll() {
		return map.selectAdoptionAll();
	}

	@Override
	public Adoption selectAdoptionByComId(Adoption adt) {
		return map.selectAdoptionByComId(adt);
	}
	
	@Override
	public int updateAdoption(Adoption adt) {
		return map.updateAdoption(adt);
	}

	@Override
	public int insertAdoption(Adoption adt) {
		return map.insertAdoption(adt);
	}

	@Override
	public int deleteAdoption(Adoption adt) {
		return map.deleteAdoption(adt);
	}

	@Override
	public Adoption selectAdoptionByAdtIdx(Adoption adt) {
		return map.selectAdoptionByAdtIdx(adt);
	}

}
