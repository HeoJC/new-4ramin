package com.yedam.saramin.search.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.saramin.comm.DataSource;
import com.yedam.saramin.search.Search;
import com.yedam.saramin.search.service.SearchMapper;
import com.yedam.saramin.search.service.SearchService;

public class SearchServiceImpl implements SearchService, SearchMapper {
	private SqlSession sqlsession = DataSource.getInstance().openSession(true);
	private SearchMapper map = sqlsession.getMapper(SearchMapper.class);
	
	@Override
	public List<Search> search(Search vo) {
		return map.search(vo);
	}

	@Override
	public List<Search> searchDistinct() {
		return map.searchDistinct();
	}

}
