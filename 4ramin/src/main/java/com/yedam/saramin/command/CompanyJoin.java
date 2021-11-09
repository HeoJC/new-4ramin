package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class CompanyJoin implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업 회원가입 처리
		CompanyService companyDao = new CompanyServiceImpl() ;
		CompanyVO vo1 = new CompanyVO() ;
		
		vo1.setCom_id(request.getParameter("com_id")) ;
		vo1.setCom_pw(request.getParameter("com_pw")) ;
		vo1.setCom_name(request.getParameter("com_name")) ;
		vo1.setCom_intro(request.getParameter("com_intro")) ;
		vo1.setCom_phone(request.getParameter("com_phone")) ;
		vo1.setCom_email(request.getParameter("com_email")) ;
		vo1.setCom_loc(request.getParameter("com_loc")) ;
		vo1.setCom_reg(request.getParameter("com_reg")) ;
		vo1.setCom_imp(request.getParameter("com_imp")) ;
		vo1.setCom_man(request.getParameter("com_man")) ;
		vo1.setCom_sal(request.getParameter("com_sal")) ;
		
		int n = companyDao.insertCompany(vo1) ;
		
		CompanyVO vo2 = new CompanyVO() ;
		
		vo2.setCom_id(request.getParameter("com_id")) ;
		vo2.setSal_2021(request.getParameter("com_sal")) ;
		
		companyDao.insertSalCompany(vo2) ;
		
		String viewPage = null ;
		
		if (n != 0) {
			viewPage = "loginForm.do" ;
		} else {
			request.setAttribute("message", "회원가입이 정상적으로 처리되지 않았습니다") ;
			viewPage = "company/companyJoinForm" ;
		}
		return viewPage ;
	}

}
