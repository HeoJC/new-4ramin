package com.yedam.saramin.resume;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.saramin.comm.Command;

public class ResumeUpdate implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ResumeService resumeDao = new ResumeServiceImpl();
		ResumeVO vo = new ResumeVO();
		
		vo.setRsm_name(request.getParameter("rsm_name"));
		vo.setRsm_education(request.getParameter("rsm_education"));
		vo.setRsm_career(request.getParameter("rsm_career"));
		vo.setRsm_certificate(request.getParameter("rsm_certificate"));
		vo.setRsm_photo(request.getParameter("rsm_photo"));
		vo.setRsm_tel(request.getParameter("rsm_tel"));
		vo.setRsm_title(request.getParameter("rsm_title"));
		
		String viewPage = null;
		int n = resumeDao.resumeUpdate(vo);
		
		if(n != 0) {
			request.setAttribute("message", "정보가 수정되었습니다");
			viewPage = "resumeUpdateForm.do";
		}else {
			request.setAttribute("message", "정보가 수정안됨");
		}
				
		return viewPage;
	}

}
