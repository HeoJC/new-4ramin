package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.service.UsersVO;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class UserDeleto implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//회원정보 삭제
		UsersService usersDao = new UsersServiceImpl();
		UsersVO vo = new UsersVO();
		
		vo.setUser_id(request.getParameter("user_id"));
		
		int r = usersDao.usersDelete(vo);
		String viewPage = null;
		
		if(r != 0) {
			request.setAttribute("message", "정말로 삭제하시겠습니까?");
		}
		return null;
	}

}
