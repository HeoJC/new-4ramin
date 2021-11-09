package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;

public class Logout implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 로그아웃
		HttpSession session = request.getSession() ;
		session.invalidate() ;
		return "main.do" ;
	}

}
