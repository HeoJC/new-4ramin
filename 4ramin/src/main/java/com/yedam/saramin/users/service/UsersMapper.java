package com.yedam.saramin.users.service;

import java.util.List;

public interface UsersMapper {
	List<UsersVO> usersSelectList();
	UsersVO usersSelect(UsersVO vo);
	
	int usersInsert(UsersVO vo);

	int usersDelete(UsersVO vo);

}
