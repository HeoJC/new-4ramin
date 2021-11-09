package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yedam.saramin.comm.Command;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class AjaxUserList implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 관리자 페이지에 ajax로 유저목록 불러오기
		UsersService usersDao = new UsersServiceImpl();
		request.setAttribute("users", usersDao.usersSelectList());
		
		String json = new Gson().toJson(usersDao.usersSelectList()) ;
		
		return "ajax:" + json ;
	}

}
