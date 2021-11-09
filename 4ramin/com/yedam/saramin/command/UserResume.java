package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;

public class UserResume implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//유저 이력서 체크후 ajax 로 리턴값 넘기기..
		return null;
	}

}
