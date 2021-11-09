package com.yedam.saramin.resume;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;

public class ResumeDelete implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		ResumeService resumeDao = new ResumeServiceImpl();
		ResumeVO vo = new ResumeVO();
		vo.setRsm_idx(Integer.parseInt(request.getParameter("rsm_idx")));
		int n = resumeDao.resumeDelete(vo);
		String viewPage = null;
		if(n != 0) {
			viewPage = "resumeForm.do";
		}else {
			request.setAttribute("message", "이력서 삭제 실패하였습니다");
			viewPage = "resume/resumeFail";
			
		}
		return viewPage;
	}

}
