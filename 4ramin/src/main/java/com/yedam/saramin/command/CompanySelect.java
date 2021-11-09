package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class CompanySelect implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업정보 조회
		CompanyService companyDao = new CompanyServiceImpl() ;
		CompanyVO vo1 = new CompanyVO() ;
		vo1.setCom_id(request.getParameter("com_id")) ;
		vo1 = companyDao.selectCompany(vo1) ;
		request.setAttribute("company", vo1) ;
		
		CompanyVO vo2 = new CompanyVO() ;
		vo2.setCom_id(request.getParameter("com_id")) ;
		vo2 = companyDao.selectSalCompany(vo2) ;
		request.setAttribute("salary", vo2) ;
		
		return "company/companySelect" ;
	}

}
