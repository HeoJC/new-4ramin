package com.yedam.saramin.resume;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.BigIntegerTypeHandler;

import com.yedam.saramin.comm.Command;

public class ResumeUpdateForm implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		return "rsm/resumeUpdateForm.do";
	}

}
