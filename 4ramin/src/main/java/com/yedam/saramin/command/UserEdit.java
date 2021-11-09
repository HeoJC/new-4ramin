package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.service.UsersVO;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class UserEdit implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//개인정보 수정 처리
		UsersService userDao = new UsersServiceImpl();
		UsersVO vo = new UsersVO();
		vo.setUser_name(request.getParameter("user_name"));
		vo.setUser_id(request.getParameter("user_id"));
		vo.setUser_password(request.getParameter("user_password"));
		vo.setUser_email(request.getParameter("user_email"));
		vo.setUser_phone(request.getParameter("user_phone"));
		vo.setUser_auth(request.getParameter("user_auth"));
		
		
		int U = userDao.usersUpdate(vo);
		String viewPage = null;
		if(U != 0) {
			viewPage = "UserSelect.do";
		}else {
			request.setAttribute("message", "수정 실패하였습니다.");
			viewPage = "users/UserFail";
		}
		return viewPage;
	}

}
