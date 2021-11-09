package com.yedam.saramin.command.adt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.adoptions.Adoption;
import com.yedam.saramin.adoptions.service.AdoptionService;
import com.yedam.saramin.adoptions.service.impl.AdoptionServiceImpl;
import com.yedam.saramin.comm.Command;

public class AdtSelect implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		AdoptionService adtDAO = new AdoptionServiceImpl();
		Adoption adt = new Adoption();
		adt.setAdt_idx(Integer.parseInt(request.getParameter("adt_idx")));
		request.setAttribute("pageName","채용공고");
		request.setAttribute("adt",  adtDAO.selectAdoptionByAdtIdx(adt));
		return "adoptions/adtSelect";
	}

}
