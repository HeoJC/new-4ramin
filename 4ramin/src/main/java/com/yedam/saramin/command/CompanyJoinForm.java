package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;

public class CompanyJoinForm implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업 회원가입 폼 호출
		return "company/companyJoinForm" ;
	}

}
