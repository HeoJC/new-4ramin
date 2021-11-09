package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class CompanySelectList implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업 목록
		CompanyService companyDao = new CompanyServiceImpl() ;
		request.setAttribute("companies", companyDao.selectCompanyList());
		
		return "company/companySelectList" ;
	}

}
