package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;

public class LoginForm implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 개인 , 기업 같이 쓰는 로그인 창 호출
		return "member/memberLoginForm" ;
	}

}
