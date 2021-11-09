package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.service.UsersVO;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class UserDelete implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//회원탈퇴 
		HttpSession session = request.getSession();
		UsersService userDao = new UsersServiceImpl();
		UsersVO vo = new UsersVO();
		vo.setUser_id(request.getParameter("user_id"));
		System.out.println("Delete" +request.getParameter("user_id"));
		
		String id = String.valueOf(session.getAttribute("id"));
		if (!id.equals("admin")) {
			session.invalidate() ;
		}
		
		userDao.usersDelete(vo);
		String viewPage = "main.do";
		return viewPage;
	}

}
