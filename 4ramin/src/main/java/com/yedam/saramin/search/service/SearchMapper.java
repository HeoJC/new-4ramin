package com.yedam.saramin.search.service;

import java.util.List;

import com.yedam.saramin.search.Search;

public interface SearchMapper {

	public List<Search> search(Search vo);
	public List<Search> searchDistinct();
	
}
