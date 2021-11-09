   package com.yedam.saramin.resume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.saramin.comm.DataSource;

public class ResumeServiceImpl implements ResumeService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private ResumeMapper map = sqlSession.getMapper(ResumeMapper.class);

	@Override
	public List<ResumeVO> resumeSelectList() {
		// TODO Auto-generated method stub
		return map.resumeSelectList();
	}

	@Override
	public ResumeVO resumeSelect(ResumeVO vo) {
		// TODO Auto-generated method stub
		return map.resumeSelect(vo);
	}
	
	public ResumeVO resumeSelectID(ResumeVO vo) {
		// TODO Auto-generated method stub
		return map.resumeSelect(vo);
	}

	@Override
	public int resumeInsert(ResumeVO vo) {
		// TODO Auto-generated method stub
		return map.resumeInsert(vo);
	}

	@Override
	public int resumeDelete(ResumeVO vo) {
		// TODO Auto-generated method stub
		return map.resumeDelete(vo);
	}

	@Override
	public int resumeUpdate(ResumeVO vo) {
		// TODO Auto-generated method stub
		return map.resumeUpdate(vo);
	}

}
