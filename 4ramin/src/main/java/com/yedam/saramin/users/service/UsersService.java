package com.yedam.saramin.users.service;

import java.util.List;

public interface UsersService {
	List<UsersVO> usersSelectList();
	UsersVO userssSelect(UsersVO vo);
	
	int usersInsert(UsersVO vo);

	int usersDelete(UsersVO vo);

}
