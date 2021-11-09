package com.yedam.saramin.resume;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.serviceImpl.UsersServiceImpl;

public class ResumeList implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		
		ResumeService resumeDao = new ResumeServiceImpl();
		ResumeVO vo = new ResumeVO();
		vo.setRsm_idx(Integer.valueOf(request.getParameter("rsm_idx")));
		vo = resumeDao.resumeSelect(vo);
		request.setAttribute("resumes", vo);
		return "rsm/resumeList";
	}

}
