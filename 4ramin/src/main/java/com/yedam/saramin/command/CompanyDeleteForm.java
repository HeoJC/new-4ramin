package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyVO;

public class CompanyDeleteForm implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업 회원 탈퇴 폼 호출
		HttpSession session = request.getSession() ;
		CompanyVO vo = new CompanyVO() ;
		vo.setCom_id(String.valueOf(session.getAttribute("id"))) ;
		vo.setCom_pw(String.valueOf(session.getAttribute("pw"))) ;
		vo.setCom_reg(String.valueOf(session.getAttribute("com_reg"))) ;
		
		request.setAttribute("company", vo) ;
		
		// 탈퇴 폼 불렀을 때 회사 아이디랑 회사명이 기본으로 폼에 들어가도록 하려고 세션에서 받는걸로
		
		return "company/companyDeleteForm" ;
	}

}
