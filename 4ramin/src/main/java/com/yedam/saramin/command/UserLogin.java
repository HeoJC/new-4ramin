package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.service.UsersVO;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class UserLogin implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 유저 로그인 처리
		HttpSession session = request.getSession() ;
		UsersService usersDao = new UsersServiceImpl() ;
		UsersVO vo = new UsersVO() ;
		
		vo.setUser_id(request.getParameter("user_id")) ;
		vo.setUser_password(request.getParameter("user_password")) ;
		vo = usersDao.userssSelect(vo) ;
		
		session.setAttribute("id", vo.getUser_id()) ;
		session.setAttribute("name", vo.getUser_name()) ;
		session.setAttribute("pw", vo.getUser_password()) ;
		
		return "ajax:" ;
	}

}
