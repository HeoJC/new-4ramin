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
		String pw = String.valueOf(session.getAttribute("pw")) ;
		String com_reg = String.valueOf(session.getAttribute("com_reg")) ;
		String message = "" ;		
		
		if (id.equals(request.getParameter("com_id")) && pw.equals(request.getParameter("com_pw"))
				&& com_reg.equals(request.getParameter("com_reg")) || id.equals("admin")) {
			companyDao.deleteCompany(vo) ;
			companyDao.deleteSalCompany(vo2) ;
			companyDao.deleteBranchCompany(vo3) ;
			
			message = "탈퇴가 완료되었습니다" ;
			
			if (!id.equals("admin")) {
				session.invalidate() ;
			}
		} else {
			message = "아이디 또는 비밀번호 또는 사업자번호를 확인하세요" ;
		}
		
		return "ajax:" + message ;
	}
}
