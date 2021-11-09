package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class ComBookMarkDelete implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업북마크 삭제
		CompanyService companyDao = new CompanyServiceImpl() ;
		CompanyVO vo = new CompanyVO() ;
		
		vo.setCom_id(request.getParameter("com_id")) ;
		
		companyDao.deleteComBookMark(vo) ;
		
		String viewPage = "bookMarkForm.do" ;
		
		return viewPage ;
	}

}
