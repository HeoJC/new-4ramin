package com.yedam.saramin.resume;


import java.util.List;

public interface ResumeMapper {
	List<ResumeVO>resumeSelectList();
	ResumeVO resumeSelect(ResumeVO vo);
	int resumeInsert(ResumeVO vo);
	int resumeDelete(ResumeVO vo);
	int resumeUpdate(ResumeVO vo);
}
