package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class CompanyDelete implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession() ;
		CompanyService companyDao = new CompanyServiceImpl() ;
		CompanyVO vo = new CompanyVO() ;
		vo.setCom_id(request.getParameter("com_id")) ;
		vo.setCom_pw(request.getParameter("com_pw")) ;
		vo.setCom_reg(request.getParameter("com_reg")) ;
		
		String id = String.valueOf(session.getAttribute("id")) ;
		String viewPage = null ;
		
		if (id.equals(request.getParameter("com_id")) || id.equals("admin")) {
			int n = companyDao.deleteCompany(vo) ;
			if (n != 0) {
				viewPage = "main.do" ;
			} else {
				request.setAttribute("message", "정상적으로 탈퇴가 되지 않았습니다)") ;
				viewPage = "company/companyDeleteForm" ;
			}
		} else {
			request.setAttribute("message", "해당회사나 관리자만 수정할 수 있습니다") ;
			viewPage = "company/companyDeleteForm" ;
		}
		
		return viewPage ;
	}

}
