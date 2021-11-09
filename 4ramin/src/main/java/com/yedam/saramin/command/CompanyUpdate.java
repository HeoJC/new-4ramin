package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class CompanyUpdate implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업 회원정보 수정
		HttpSession session = request.getSession() ;
		CompanyService companyDao = new CompanyServiceImpl() ;
		CompanyVO vo = new CompanyVO() ;
		
		vo.setCom_id(request.getParameter("com_id")) ; // where 조건
		vo.setCom_pw(request.getParameter("com_pw")) ;
		vo.setCom_intro(request.getParameter("com_intro")) ;
		vo.setCom_phone(request.getParameter("com_phone")) ;
		vo.setCom_email(request.getParameter("com_email")) ;
		vo.setCom_loc(request.getParameter("com_loc")) ;
		vo.setCom_imp(request.getParameter("com_imp")) ;
		vo.setCom_man(request.getParameter("com_man")) ;
		vo.setCom_sal(request.getParameter("com_sal")) ;
		
		CompanyVO vo2 = new CompanyVO() ;
		
		vo2.setCom_id(request.getParameter("com_id")) ;
		vo2.setSal_2021(request.getParameter("com_sal")) ;
		
		CompanyVO vo3 = new CompanyVO() ;
		
		vo3.setCom_id(request.getParameter("com_id")) ;
		vo3.setCom_branch(request.getParameter("com_branch")) ;		
		
		String id = String.valueOf(session.getAttribute("id")) ;
		String viewPage = null ;
		
		if (id.equals(request.getParameter("com_id")) || id.equals("admin")) {
			int n = companyDao.updateCompany(vo) ;
			companyDao.updateSalCompany(vo2) ;
			companyDao.updateBranchCompany(vo3) ;
			
			if (n != 0) {
				request.setAttribute("message", "정보가 수정되었습니다") ;
				viewPage = "companyMyInfo.do" ;
			} else {
				request.setAttribute("message", "정보가 수정되지 않았습니다") ;
				viewPage = "companyMyInfo.do" ;
			}
		} else {
			request.setAttribute("message", "해당회사나 관리자만 수정할 수 있습니다") ;
			viewPage = "company/companyUpdateForm" ;
		}
		
		return viewPage ;
	}

}
