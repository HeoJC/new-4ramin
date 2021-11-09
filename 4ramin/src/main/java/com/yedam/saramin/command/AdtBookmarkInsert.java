package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class AdtBookmarkInsert implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 공고북마크 추가
		HttpSession session = request.getSession() ;
		CompanyService companyDao = new CompanyServiceImpl() ;
		CompanyVO vo = new CompanyVO() ;
		
		String id = String.valueOf(session.getAttribute("id")) ;
		
		vo.setAdt_idx(request.getParameter("adt_idx")) ;
		vo.setUser_id(id) ;
		vo.setCom_id(request.getParameter("com_id")) ;
		vo.setTitle(request.getParameter("title")) ;
		vo.setAdt_exp(request.getParameter("adt_exp")) ;
		
		companyDao.insertAdtBookMark(vo) ;
		
		String viewPage = "bookMarkForm.do" ;
		
		return viewPage ;
	}

}
