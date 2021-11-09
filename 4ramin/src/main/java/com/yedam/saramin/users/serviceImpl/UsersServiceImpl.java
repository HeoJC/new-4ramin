package com.yedam.saramin.users.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.saramin.comm.DataSource;
import com.yedam.saramin.users.service.UsersMapper;
import com.yedam.saramin.users.service.UsersService;
import com.yedam.saramin.users.service.UsersVO;

public class UsersServiceImpl implements UsersService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private UsersMapper map = sqlSession.getMapper(UsersMapper.class);

	@Override
	public List<UsersVO> usersSelectList() {
		// TODO Auto-generated method stub
		return map.usersSelectList();
	}

	@Override
	public UsersVO userssSelect(UsersVO vo) {
		// TODO Auto-generated method stub
		return map.usersSelect(vo);
	}

	@Override
	public int usersInsert(UsersVO vo) {
		// TODO Auto-generated method stub
		return map.usersInsert(vo);
	}

	@Override
	public int usersDelete(UsersVO vo) {
		// TODO Auto-generated method stub
		return map.usersDelete(vo);
	}

	@Override
	public int usersUpdate(UsersVO vo) {
		// TODO Auto-generated method stub
		return map.usersUpdate(vo);
	}

}
