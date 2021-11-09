package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class CompanyJoinCheck implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업 회원가입 아이디 중복 체크
		CompanyService companyDao = new CompanyServiceImpl() ;
		CompanyVO vo = new CompanyVO() ;
		vo.setCom_id(request.getParameter("com_id")) ;
		
		String message = "" ;
		
		if(companyDao.selectCompany(vo) != null) {
			message = "이미 가입된 아이디입니다" ;
		} else {
			message = "가입 가능한 아이디입니다" ;
		}
		
		return "ajax:" + message ;
	}

}
