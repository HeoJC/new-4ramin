package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.service.UsersVO;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class UsersJoin implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//회원가입 -> DB로 넘겨주는
		
		UsersService usersDao = new UsersServiceImpl();
		UsersVO vo = new UsersVO();
		
		vo.setUser_id(request.getParameter("user_id"));
		vo.setUser_password(request.getParameter("user_password"));
		vo.setUser_name(request.getParameter("user_name"));
		vo.setUser_phone(request.getParameter("user_phone"));
		vo.setUser_email(request.getParameter("user_email"));
		vo.setUser_auth(request.getParameter("user_auth"));
		
		int a = usersDao.usersInsert(vo);
		String viewPage = null;
		
		if(a != 0) {
			request.setAttribute("message", "회원가입 성공");
			viewPage = "users/usersJoinSuccess";
		}
		return viewPage;
	}

}
