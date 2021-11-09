package com.yedam.saramin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.search.service.SearchService;
import com.yedam.saramin.search.service.impl.SearchServiceImpl;

public class HomeCommand implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		SearchService searchDAO = new SearchServiceImpl();
		request.setAttribute("result", searchDAO.searchDistinct());
		return "home/main.jsp";
	}

}
