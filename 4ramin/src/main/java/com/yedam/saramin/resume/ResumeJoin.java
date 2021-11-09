package com.yedam.saramin.resume;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.saramin.comm.Command;

public class ResumeJoin implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {

		ResumeService resumeDao = new ResumeServiceImpl();
		ResumeVO vo = new ResumeVO();
		
		vo.setRsm_name(request.getParameter("rsm_name"));
		vo.setUser_id(request.getParameter("user_id"));
		vo.setRsm_birthday(Date.valueOf(request.getParameter("rsm_birthday")));
		vo.setRsm_gender(request.getParameter("rsm_gender"));
		vo.setRsm_education(request.getParameter("rsm_education"));
		vo.setRsm_career(request.getParameter("rsm_career"));
		vo.setRsm_certificate(request.getParameter("rsm_certificate"));
		vo.setRsm_photo(request.getParameter("rsm_photo"));
		vo.setRsm_tel(request.getParameter("rsm_tel"));
		vo.setRsm_title(request.getParameter("rsm_title"));
		

		int n = resumeDao.resumeInsert(vo);
		String viewPage = null;

		if (n != 0) {
			viewPage = "resumeForm.do";
		} else {
			request.setAttribute("message", "이력서 등록에 실패하였습니다");
			viewPage = "resume/resumeForm";
		}
		return viewPage;
	}

}
