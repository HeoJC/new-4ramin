package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.service.UsersVO;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class UserDeleto implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//회원정보 삭제
		HttpSession session = request.getSession() ;
		UsersService usersDao = new UsersServiceImpl();
		UsersVO vo = new UsersVO();
		
		vo.setUser_id(request.getParameter("user_id"));
		
		String id = String.valueOf(session.getAttribute("id")) ;
		String viewPage = null;
		
		if (!id.equals("admin")) {
			session.invalidate() ;
		}
		
		if (id.equals(request.getParameter("com_id")) || id.equals("admin")) {
			int n = usersDao.usersDelete(vo);
			
			if (n != 0) {
				request.setAttribute("message", "정말로 삭제하시겠습니까?");
				viewPage = "main.do" ;
			} else {
				viewPage = "main.do" ; // 탈퇴 실패 했을 때 삭제 페이지로 다시 가도록 설정해야됩니다. (허재철)
			}
		} else {
			viewPage = "main.do" ; // 탈퇴 실패 했을 때 삭제 페이지로 다시 가도록 설정해야됩니다. (허재철)
		}
		return viewPage ;
	}

}
