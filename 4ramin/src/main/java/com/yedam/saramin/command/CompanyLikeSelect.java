package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.company.service.CompanyService;
import com.yedam.saramin.company.service.CompanyVO;
import com.yedam.saramin.company.serviceImpl.CompanyServiceImpl;

public class CompanyLikeSelect implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 기업 좋아요 조회
		CompanyService companyDao = new CompanyServiceImpl() ;
		CompanyVO vo = new CompanyVO() ;
		vo.setCom_id(request.getParameter("com_id")) ;
		
		vo = companyDao.selectLikeCompany(vo) ;
		int r = Integer.valueOf(vo.getCom_like()) ;
		
		return "ajax:" +  r ;
	}

}
