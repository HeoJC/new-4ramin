package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class ComBookMarkList implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업북마크 불러오기
		HttpSession session = request.getSession() ;
		CompanyService companyDao = new CompanyServiceImpl() ;
		CompanyVO vo = new CompanyVO() ;
		String user_id = String.valueOf(session.getAttribute("id")) ;
		
		vo.setUser_id(user_id) ;
		String json = new Gson().toJson(companyDao.selectComBookMarkList(vo)) ;
		
		return "ajax:" + json ;
	}

}
