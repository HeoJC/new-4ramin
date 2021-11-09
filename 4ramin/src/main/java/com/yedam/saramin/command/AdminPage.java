package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class AdminPage implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 어드민 페이지 호출
		CompanyService companyDao = new CompanyServiceImpl() ;
		UsersService usersDao = new UsersServiceImpl() ;
		
		request.setAttribute("companies", companyDao.selectCompanyList()) ;
		request.setAttribute("users", usersDao.usersSelectList()) ;
		
		return "home/adminPage" ;
	}

}
