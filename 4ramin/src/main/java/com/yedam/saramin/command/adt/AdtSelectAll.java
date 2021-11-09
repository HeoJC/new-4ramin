package com.yedam.saramin.command.adt;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.adoptions.Adoption;
import com.yedam.saramin.adoptions.service.AdoptionService;
import com.yedam.saramin.adoptions.service.impl.AdoptionServiceImpl;
import com.yedam.saramin.comm.Command;

public class AdtSelectAll implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		AdoptionService adtDao = new AdoptionServiceImpl();
		List<Adoption> list = new ArrayList<Adoption>();
		list = adtDao.selectAdoptionAll();
		
		request.setAttribute("adoptions", list);
		request.setAttribute("pageName", "채용공고");
		request.setAttribute("cnt", list.size());
		
		
		return "adoptions/adtSelectAll";
	}

}
