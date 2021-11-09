package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class UserList implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//회원 리스트 출력..
		UsersService usersDao = new UsersServiceImpl();
		request.setAttribute("users", usersDao.usersSelectList());
		
		return "users/UserList";
	}

}
