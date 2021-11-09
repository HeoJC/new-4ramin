package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.service.UsersVO;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class UserSelect implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//로그인후 내 정보보기 세션으로
		HttpSession session = request.getSession();
		UsersService usersDao = new UsersServiceImpl();
		UsersVO vo = new UsersVO();
		
		vo.setUser_id((String)session.getAttribute("id"));
		
		request.setAttribute("user", usersDao.userssSelect(vo));
		
		return "users/userSelect";
	}

}
