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
		
		CompanyVO vo2 = new CompanyVO() ;
		vo2.setCom_id(request.getParameter("com_id")) ;
		
		CompanyVO vo3 = new CompanyVO() ;
		vo3.setCom_id(request.getParameter("com_id")) ;
		
		String id = String.valueOf(session.getAttribute("id")) ;
		String viewPage = null ;
		
		if (id.equals(request.getParameter("com_id")) || id.equals("admin")) {
			int n = companyDao.deleteCompany(vo) ;
			companyDao.deleteSalCompany(vo2) ;
			companyDao.deleteBranchCompany(vo3) ;
			
			if (!id.equals("admin")) {
				session.invalidate() ;
			}
			
			if (n != 0) {
				viewPage = "main.do" ;
			} else {
				viewPage = "company/companyDeleteForm" ;
			}
		} else {
			viewPage = "company/companyDeleteForm" ;
		}
		return viewPage ;
	}
}
