package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class CompanyMyInfo implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업이 내정보 보기
		HttpSession session = request.getSession() ;
		CompanyService companyDao = new CompanyServiceImpl() ;
		CompanyVO vo = new CompanyVO() ;
		vo.setCom_id(String.valueOf(session.getAttribute("id"))) ;
		vo = companyDao.selectCompany(vo) ;
		request.setAttribute("company", vo) ;
		
		CompanyVO vo2 = new CompanyVO() ;
		vo2.setCom_id(String.valueOf(session.getAttribute("id"))) ;
		vo2 = companyDao.selectSalCompany(vo2) ;
		request.setAttribute("salary", vo2) ;
		
		return "company/companySelect" ;
	}

}
