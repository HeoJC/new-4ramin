package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.saramin.comm.Command;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.service.UsersVO;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class UserOne implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		//클릭한id값 받아와서 단건검색
		UsersService usersDao = new UsersServiceImpl();
		UsersVO vo = new UsersVO();
		Gson gson = new GsonBuilder().create();
		String str = null;
		
		
		
		vo.setUser_id(request.getParameter("uid"));
		vo = usersDao.usersSelectlookup(vo);
		str = gson.toJson(usersDao.usersSelectlookup(vo));
			
		System.out.println("vo: " + vo);
		
		return "ajax:"+str;
	}

}
