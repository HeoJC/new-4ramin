package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class AjaxCompanyList implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 관리자 페이지에 ajax로 회사목록 불러오기
		CompanyService companyDao = new CompanyServiceImpl() ;
		request.setAttribute("companies", companyDao.selectCompanyList());
		
		String json = new Gson().toJson(companyDao.selectCompanyList()) ;
		
		return "ajax:" + json ;
	}

}
