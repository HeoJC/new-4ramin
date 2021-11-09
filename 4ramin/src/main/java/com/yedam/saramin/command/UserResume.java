package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.saramin.comm.Command;
import com.yedam.saramin.resume.ResumeService;
import com.yedam.saramin.resume.ResumeServiceImpl;
import com.yedam.saramin.resume.ResumeVO;

public class UserResume implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//유저 리스트 조회해서 리턴값 ajax 로 넘기기 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ResumeService resumeDao = new ResumeServiceImpl();
		ResumeVO vo = new ResumeVO();
		Gson gson = new GsonBuilder().create();
		
		return null;
	}

}
