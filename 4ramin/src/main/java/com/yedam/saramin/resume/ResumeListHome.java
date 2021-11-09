package com.yedam.saramin.resume;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;

public class ResumeListHome implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		
		ResumeService resumeDao = new ResumeServiceImpl();
		request.setAttribute("resumes", resumeDao.resumeSelectList());
		
		return "rsm/resumeListHome";
	}
}
