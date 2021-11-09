package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class CompanyLogin implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업 로그인 처리
		HttpSession session = request.getSession() ;
		CompanyService companyDao = new CompanyServiceImpl() ;
		CompanyVO vo = new CompanyVO() ;
		
		vo.setCom_id(request.getParameter("com_id")) ;
		vo.setCom_pw(request.getParameter("com_pw")) ;
		vo.setCom_reg(request.getParameter("com_reg")) ;
		vo = companyDao.selectCompany(vo) ;
		
		session.setAttribute("id", vo.getCom_id()) ;
		session.setAttribute("name", vo.getCom_name()) ;
		session.setAttribute("pw", vo.getCom_pw()) ;
		session.setAttribute("com_reg", vo.getCom_reg()) ;
		
		return "ajax:" ;
	}

}
