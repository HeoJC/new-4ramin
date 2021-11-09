package com.yedam.saramin.adoptions.service;

import java.util.List;

import com.yedam.saramin.adoptions.Adoption;

public interface AdoptionMapper {
	List<Adoption> selectAdoptionAll();
	Adoption selectAdoptionByComId(Adoption adt);
	Adoption selectAdoptionByAdtIdx(Adoption adt);
	int updateAdoption(Adoption adt);
	int insertAdoption(Adoption adt);
	int deleteAdoption(Adoption adt);
}