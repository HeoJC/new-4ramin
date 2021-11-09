package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class ComBookMarkInsert implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업북마크 추가
		HttpSession session = request.getSession() ;
		CompanyService companyDao = new CompanyServiceImpl() ;
		CompanyVO vo = new CompanyVO() ;
		
		String id = String.valueOf(session.getAttribute("id")) ;
		
		vo.setUser_id(id) ;
		vo.setCom_id(request.getParameter("com_id")) ;
		vo.setCom_name(request.getParameter("com_name")) ;
		vo.setCom_intro(request.getParameter("com_intro")) ;
		vo.setCom_sal(request.getParameter("com_sal")) ;
		
		companyDao.insertComBookMark(vo) ;
		
		String viewPage = "bookMarkForm.do" ;
		
		return viewPage ;
	}

}
