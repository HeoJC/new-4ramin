package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.resume.ResumeService;
import com.yedam.saramin.resume.ResumeServiceImpl;
import com.yedam.saramin.resume.ResumeVO;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.service.UsersVO;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class UserResume implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//유저 이력서 체크후 ajax 로 리턴값 넘기기..
		HttpSession session = request.getSession();
		UsersService usersDao = new UsersServiceImpl();
		UsersVO vo1 = new UsersVO();
		ResumeService resumeDao = new ResumeServiceImpl();
		ResumeVO vo = new ResumeVO();
		
		return null;
	}

}
