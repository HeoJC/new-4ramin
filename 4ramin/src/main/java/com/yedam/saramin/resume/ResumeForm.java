package com.yedam.saramin.resume;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;

public class ResumeForm implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "rsm/resumeForm";
	}

}
